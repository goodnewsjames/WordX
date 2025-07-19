import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordx/controllers/game_controller.dart';

class HintBox extends StatelessWidget {
  HintBox({super.key});
  final GameController controller =
      Get.find<GameController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 200,
              width: 335,
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: Color(0XFF3E87FF),
                  width: 10,
                ),
              ),
              child: Center(
                child: Text(
                  controller.getCurrentLevel().hint,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Comic-Helvetic",
                    fontWeight: FontWeight.w300,
                    color: Color(0XFF373F4A),
                    fontSize: 26,
                  ),
                ),
              ),
            ),
            Positioned(
              top: -20,
              left: 70,
              child: Container(
                height: 40,
                width: 182,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 2,
                    color: Color(0XFF3E87FF),
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    "Hint",
                    style: TextStyle(
                      fontFamily: "Comic-Helvetic",
                      fontWeight: FontWeight.w300,
                      color: Color(0XFF000000),
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }
    );
  }
}
