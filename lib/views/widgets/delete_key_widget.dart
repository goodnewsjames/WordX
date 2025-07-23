import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordx/controllers/audio_controller.dart';
import 'package:wordx/controllers/game_controller.dart';

class DeleteKeyWidget extends StatelessWidget {
  DeleteKeyWidget({super.key});

  final GameController controller =
      Get.find<GameController>();
  final AudioController soundController =
      Get.find<AudioController>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.deleteLastLetter();
        soundController.playDeleteTap();
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(4),
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0XFF3E87FF),
        ),
        child: Icon(
          Icons.keyboard_backspace_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}
