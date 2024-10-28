import 'package:flutter/material.dart';
import 'package:fortuneai/FlowPages/LandingPage.dart';
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
                    "assets/image/background.jpg",
                  ),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                color: Colors.black.withOpacity(0.5),
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  "Welcome To FortuneAi",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 35),
                ),
              ),
              Gap(10),
              GestureDetector(
                onTap: () => Get.to(()=>LandingPage()),
                child: Container(
                  width: Get.width / 1.5,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(16)),
                  child: const Center(
                      child: Text(
                    "I agree Terms And Conditions",
                    //textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18),
                  )),
                ),
              ),
              const Gap(200)
            ],
          ),
        ),
      ),
    );
  }
}
