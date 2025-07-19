import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordx/bindings/bindings.dart';
import 'package:wordx/views/pages/splash_screen.dart';

class GameApp extends StatelessWidget {
  const GameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      initialBinding: WordXBindings(),
    );
  }
}