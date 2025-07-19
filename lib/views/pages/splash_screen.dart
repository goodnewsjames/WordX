import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordx/controllers/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final SplashScreenController controller = Get.put(
    SplashScreenController(),
  );
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenController>(
      builder: (controller) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0XFFBDFFFF),
                  Color(0XFFDEFFDA),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Center(
              // child: SvgPicture.asset(
              //   "assets/svgs/game_title.svg",
              //   height: 100,
              //   width: 300,
              // ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Guess the word",
                    style: TextStyle(
                      color: Color(0XFFFF3D12),
                      fontFamily: "Comic-Helvetic",
                      fontWeight: FontWeight.w900,
                      fontSize: 32,
                    ),
                  ),
                  Text(
                    "Word puzzle game",
                    style: TextStyle(
                      color: Color(0XFFFF7C3B),
                      fontFamily: "Comic-Helvetic",
                      fontWeight: FontWeight.w300,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
