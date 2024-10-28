import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/route_manager.dart';

class Onboardingpage extends StatelessWidget {
  const Onboardingpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: Get.width,
          height: Get.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "lib/FlowPages/assets/image/background.jpg",
                  ),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                color: Colors.black.withOpacity(0.5), 
                 padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Welcome To Fortune Ai",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 35),
                ),
              ),
              Card(
                elevation: 5,
                shadowColor: Colors.purple,
                child: Container(
                  width: Get.width / 2,
                  height: 50,
                  decoration: BoxDecoration(color: Colors.purple),
                ),
              ),
              Gap(200)
            ],
          ),
        ),
      ),
    );
  }
}
