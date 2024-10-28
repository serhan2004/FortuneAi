import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  void initState() {
    super.initState();
    initResponse();
  }
  String result = "";
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Card(
          color: Colors.grey.shade900,
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Container(
              child: Center(child: Text(result, style:  TextStyle(color: Colors.white, fontSize: 13),)),
              width: Get.width,
              height: 500,
              decoration: BoxDecoration(
                color: Colors.grey.shade900
              ),
            ),
          ),
        ),
      ),
    );
  }

  void initResponse() async {
    final request = ChatCompleteText(

        model: Gpt4oMini2024ChatModel(),
        messages: [
          {"role": "system", "content": firstContent},
          {
            "role": "user",
            "content":
                "Adım : Serhan, Doğum Tarihim 09/11/2004, Doğum saatim 02:12, ilişki durumum : Sevgilimden yeni ayrıldım" +
                    " Benim hakkımda daha fazla bilgi : Haliç Üniversitesi Yazılım mühendisliği 1. Sınıf öğrencisiyim ve gdg on campus organizatörüyüm"
          }
        ]);
    final response = await OpenAI.instance.onChatCompletion(request: request);
    for (var element in response!.choices) {
      if (element.message != null) {
        print(element.message!.content);
       
      }
    }
  }

  final firstContent = """
First, I’ll start by interpreting the user’s input, focusing on their birth date, birth time, personality traits, love life, name, and any other unique characteristics they provide. I'll use these details to uncover relevant astrological or tarot-based insights. 

Next, I'll move on to crafting personalized predictions for each life aspect they’re curious about:

1. **Love Life**: I'll provide a detailed and conversational narrative, focusing on potential developments, challenges, or opportunities based on the user's inputs. I’ll make sure it feels unique and authentic to them.

2. **Career**: Here, I’ll aim for an insightful reading that’s motivational but also realistic, weaving in career growth, any noted personality strengths, or potential shifts that could come into play.

3. **Family Life**: This prediction will be warm and family-oriented, giving a sense of harmony or potential transformations within their family dynamic.

4. **Tarot Reading**: I’ll interpret a tarot spread based on the insights from their input, making it a bit mystical while staying in tune with the other predictions.

I'll present each prediction as a cohesive, short paragraph, creating a friendly, conversational tone for a personal touch. Each will be crafted to be plausible and engaging, ensuring the reading resonates on a meaningful level. I'll also stay mindful of cultural sensitivities to keep the reading inclusive and respectful. 

Now, I’m ready to create a personalized experience for the user! """;
}
