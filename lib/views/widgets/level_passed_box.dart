import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LevelPassedBox extends StatelessWidget {
  const LevelPassedBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 304,
          width: 299,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              width: 10,
              color: Color(0XFF3E87FF),
            ),
          ),
          child: Column(
            children: [
              Text(
                "Congrats",
                style: TextStyle(
                  fontFamily: "Comic-Helvetic",
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 8),

              Text(
                "Level passed!",
                style: TextStyle(
                  fontFamily: "Comic-Helvetic",
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Text(
                  "+10",
                  style: TextStyle(
                    fontFamily: "Comic-Helvetic",
                    fontWeight: FontWeight.w300,
                    fontSize: 36,
                  ),
                ),
              ),

              SizedBox(height: 30),
              SizedBox(
                height: 44,
                width: 144,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 6,

                    backgroundColor: Color(0XFF3E87FF),
                  ),
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      fontFamily: "Comic-Helvetic",
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        Positioned(
          top: -30,
          left: 60,
          child: SvgPicture.asset(
            "assets/svgs/congrat_star.svg",
          ),
        ),
        Positioned(
          bottom: 110,
          left: 85,
          child: SvgPicture.asset(
            "assets/svgs/sparkle.svg",
          ),
        ),
      ],
    );
  }
}
