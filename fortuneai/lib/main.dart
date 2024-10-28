import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';
import 'package:fortuneai/FlowPages/LandingPage.dart';
import 'package:fortuneai/FlowPages/OnboardingPage.dart';
import 'package:fortuneai/constants.dart';
import 'package:fortuneai/sharedPrefManager.dart';
import 'package:get/route_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool isFirstLaunch = await checkFirstLaunch();
  runApp(MyApp(isFirstLaunch: isFirstLaunch));
}

Future<bool> checkFirstLaunch() async {
  SharedPrefManager sharedPrefManager = SharedPrefManager();
  bool? firstLaunch = await sharedPrefManager.getBool("isFirstLaunch");

  if (firstLaunch == null) {
    await sharedPrefManager.saveBool("isFirstLaunch", false);
    return true; // İlk açılış
  }

  return false; // Sonraki açılışlar
}

class MyApp extends StatelessWidget {
  final bool isFirstLaunch;

  const MyApp({super.key, required this.isFirstLaunch});

  @override
  Widget build(BuildContext context) {
    final openAI = OpenAI.instance.build(
        token: OPENAI_API_KEY,
        baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 5)),
        enableLog: true);

        
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "FortuneAi",
      home: isFirstLaunch ? const Onboardingpage() : const LandingPage(),
    );
  }
}
