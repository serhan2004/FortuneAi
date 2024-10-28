import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';
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
        title: Text(
          "Your Future",
          style: TextStyle(
              color: Colors.purple, fontWeight: FontWeight.w500, fontSize: 23)
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
                      : Text(
                          result, // Yanıt burada görüntülenir
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
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
                "Adım : Serhan, Doğum Tarihim 09/11/2004, Doğum saatim 02:12, ilişki durumum : Sevgilimden yeni ayrıldım" +
                    " Benim hakkımda daha fazla bilgi : Haliç Üniversitesi Yazılım mühendisliği 1. Sınıf öğrencisiyim ve gdg on campus organizatörüyüm"
          }
        ],
      );

      final response = await OpenAI.instance.onChatCompletion(request: request);

      // Yanıt alındığında UI'ı güncelle
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

  final firstContent = """
First, I will interpret the user's date of birth, time of birth, personality traits, love life, name and other characteristics. Based on this data, I will get astrological or tarot-based insights.Then I will prepare personalized predictions for each life area:
Love Life: Depending on the user's characteristics, I will offer an authentic and sincere narrative, focusing on developments, challenges or opportunities.
Career: I will prepare a realistic and motivating career forecast, highlighting strengths and possible changes.
Family Life: I will provide a warm and intimate insight, addressing harmony or changes in the family.
Tarot: I will give a reading in harmony with the other predictions, adding a mystical touch with a Tarot opening.
I will create a user-specific, engaging experience by presenting each prediction as a short, intimate paragraph.
Translated with DeepL.com (free version) """;
}
