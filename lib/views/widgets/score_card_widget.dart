import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ScoreCardWidget extends StatelessWidget {
  const ScoreCardWidget({
    super.key,
    required this.currentLevel,
    required this.points,
    required this.trilsLeft,
  });
  final String currentLevel;
  final String points;
  final String trilsLeft;
  @override
  Widget build(BuildContext context) {
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
                  trilsLeft,
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
                  currentLevel,
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
                  points,
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
  }
}
