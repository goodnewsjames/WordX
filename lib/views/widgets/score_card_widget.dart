import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wordx/controllers/game_controller.dart';

class ScoreCardWidget extends StatelessWidget {
  ScoreCardWidget({super.key});

  final GameController controller =
      Get.find<GameController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                SvgPicture.asset(
                  "assets/svgs/star_holder.svg",
                ),
                Positioned(
                  left: 8,
                  top: 6,
                  child: SvgPicture.asset(
                    "assets/svgs/star.svg",
                  ),
                ),
                Positioned(
                  left: 45,
                  top: 3,
                  child: Text(
                    controller.trialsLeft.string,
                    style: TextStyle(
                      fontFamily: "Comic-Helvetic",
                      fontWeight: FontWeight.w300,
                      color: Color(0XFF484848),
                      fontSize: 26,
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                SvgPicture.asset("assets/svgs/polygon.svg"),
                Positioned(
                  top: 22,
                  left: 35,
                  child: Text(
                    controller.currentLevel.string,
                    style: TextStyle(
                      fontFamily: "Comic-Helvetic",
                      fontWeight: FontWeight.w300,
                      color: Color(0XFF484848),
                      fontSize: 26,
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                SvgPicture.asset(
                  "assets/svgs/diamond_holder.svg",
                ),
                Positioned(
                  right: 8,
                  top: 8,
                  child: SvgPicture.asset(
                    "assets/svgs/diamond.svg",
                  ),
                ),
                Positioned(
                  right: 45,
                  top: 3,
                  child: Text(
                    controller.totalPoints.string,
                    style: TextStyle(
                      fontFamily: "Comic-Helvetic",
                      fontWeight: FontWeight.w300,
                      color: Color(0XFF484848),
                      fontSize: 26,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
