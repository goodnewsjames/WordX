import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wordx/controllers/audio_controller.dart';
import 'package:wordx/controllers/game_controller.dart';

class AddDiamondWidget extends StatelessWidget {
  AddDiamondWidget({super.key});
  final GameController controller =
      Get.find<GameController>();
  final AudioController soundController =
      Get.find<AudioController>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        controller.resetGame();
      },
      onTap: () {
        if (soundController.isBackgroundPlaying.value) {
          soundController.stopBackgroundSound();
        } else {
          soundController.startBackgroundSound();
        }
      },
      child: SvgPicture.asset(
        "assets/svgs/add_diamond.svg",
      ),
    );
  }
}
