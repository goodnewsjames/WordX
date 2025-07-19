import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wordx/controllers/game_controller.dart';

class AddHintWidget extends StatelessWidget {
   AddHintWidget({
    super.key,
  });

  final GameController controller = Get.find<GameController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.buyTrials();
      },
      child: SvgPicture.asset("assets/svgs/add_hint.svg"),
    );
  }
}
