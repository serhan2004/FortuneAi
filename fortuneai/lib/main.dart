import 'package:flutter/material.dart';
import 'package:fortuneai/FlowPages/LandingPage.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "FortuneAi",
      home: LandingPage(),
    );
  }
}
