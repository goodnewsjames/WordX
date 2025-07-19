import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wordx/controllers/game_controller.dart';

class AddDiamondWidget extends StatelessWidget {
  AddDiamondWidget({super.key});
 final GameController controller = Get.find<GameController>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.reducePoints();
      },
      child: SvgPicture.asset(
        "assets/svgs/add_diamond.svg",
      ),
    );
  }
}
