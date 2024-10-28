import 'package:flutter/material.dart';
import 'package:fortuneai/FlowPages/SecondAskPage.dart';
import 'package:fortuneai/FlowPages/resultPage.dart';
import 'package:fortuneai/singletons.dart';
import 'package:gap/gap.dart';
import 'package:get/route_manager.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final TextEditingController usernameController = TextEditingController();
  String? errorText; // Hata mesajı için bir değişken ekleyelim

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          "Fortune Ai",
          style: TextStyle(
              color: Colors.purple, fontWeight: FontWeight.w500, fontSize: 23),
        ),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: usernameController,
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Your name...",
                hintStyle: const TextStyle(color: Colors.grey),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: errorText != null ? Colors.red : Colors.white,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: errorText != null ? Colors.red : Colors.white,
                  ),
                ),
                errorText: errorText, // Hata mesajını göster
                errorStyle: const TextStyle(color: Colors.red), // Hata mesajı rengi kırmızı
              ),
            ),
            const Gap(50),
            Container(
              width: 150,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.purple, borderRadius: BorderRadius.circular(16)),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (usernameController.text.trim().isEmpty) {
                      errorText = "Name cannot be empty!";
                    } else {
                      userSingleton.username = usernameController.text.trim();
                      errorText = null; // Hata yoksa hata mesajını temizle
                      Get.to(()=>ResultPage());
                    }
                  });
                },
                child: const Center(
                  child: Text(
                    "Next",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
