import 'dart:math';
import 'package:flutter/material.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:fortuneai/singletons.dart';
import 'package:get/route_manager.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String result = ""; // Yanıtı saklayacak değişken
  bool isLoading = true; // Yüklenme durumunu izlemek için

  @override
  void initState() {
    super.initState();
    initResponse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Your Future",
          style: TextStyle(
              color: Colors.purple, fontWeight: FontWeight.w500, fontSize: 23),
        ),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Card(
          color: Colors.grey.shade900,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              width: Get.width,
              height: Get.height / 1.7,
              decoration: BoxDecoration(color: Colors.grey.shade900),
              child: SingleChildScrollView(
                child: Center(
                  child: isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : buildStyledText(result), // RichText widget ile stilize edilmiş yazı
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void initResponse() async {
    try {
      final request = ChatCompleteText(
        model: Gpt4oMini2024ChatModel(), // Geçerli bir model adı
        messages: [
          {"role": "system", "content": firstContent},
          {
            "role": "user",
            "content":
                "Adım : ${userSingleton.username}, Doğum Tarihim ${userSingleton.birthDate}, Doğum saatim:${userSingleton.birthTime}, ilişki durumum :${userSingleton.relationshipStatus}" +
                    " Benim hakkımda daha fazla bilgi : ${userSingleton.aboutuser}"
          }
        ],
      );

      final response = await OpenAI.instance.onChatCompletion(request: request);

      setState(() {
        result = response?.choices.first.message?.content ?? "Yanıt alınamadı";
        isLoading = false;
      });
    } catch (e) {
      print("Error during API request: $e");
      setState(() {
        result = "Bir hata oluştu. Lütfen daha sonra tekrar deneyin.";
        isLoading = false;
      });
    }
  }

  // Rastgele renk oluşturucu
  Color getRandomColor() {
    final random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  // RichText ile stilize edilmiş yazıyı oluşturur
  Widget buildStyledText(String text) {
    final regex = RegExp(r"\*\*(.*?)\*\*"); // **kalın** kısımlarını yakalamak için regex

    final spans = <TextSpan>[];
    int lastIndex = 0;

    // Regex ile yakalanan bölümleri işliyoruz
    for (final match in regex.allMatches(text)) {
      // Kalın metinden önceki kısmı ekle
      if (match.start > lastIndex) {
        spans.add(TextSpan(
          text: text.substring(lastIndex, match.start),
          style: const TextStyle(color: Colors.white),
        ));
      }

      // Kalın metni ekle ve rastgele renkle stilize et
      spans.add(TextSpan(
        text: match.group(1), // ** işaretlerini kaldırarak metni alır
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: getRandomColor(),
        ),
      ));

      lastIndex = match.end; // Sonraki metin parçasına geçiş
    }

    // Kalan kısmı ekle
    if (lastIndex < text.length) {
      spans.add(TextSpan(
        text: text.substring(lastIndex),
        style: const TextStyle(color: Colors.white),
      ));
    }

    return RichText(
      text: TextSpan(children: spans),
    );
  }

  final firstContent = """
First, I will interpret the user's date of birth, time of birth, personality traits, love life, name and other characteristics. Based on this data, I will get astrological or tarot-based insights.Then I will prepare personalized predictions for each life area:
Love Life: Depending on the user's characteristics, I will offer an authentic and sincere narrative, focusing on developments, challenges or opportunities.
Career: I will prepare a realistic and motivating career forecast, highlighting strengths and possible changes.
Family Life: I will provide a warm and intimate insight, addressing harmony or changes in the family.
Tarot: I will give a reading in harmony with the other predictions, adding a mystical touch with a Tarot opening.
I will create a user-specific, engaging experience by presenting each prediction as a short, intimate paragraph.
Translated with DeepL.com (free version) """;
}
