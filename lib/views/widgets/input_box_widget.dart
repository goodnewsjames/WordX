import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordx/controllers/game_controller.dart';
import 'package:wordx/views/widgets/empty_box_widget.dart';

class InputBoxWidget extends StatelessWidget {
   InputBoxWidget({
    super.key,
  });

  final GameController controller = Get.find<GameController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          physics: NeverScrollableScrollPhysics(),
          itemCount: controller.currentWordLength.value,
          itemBuilder: (context, index) {
            return Obx(() {
              String letter =
                  controller.enteredLetters[index];
              return EmptyBoxWidget(
                letter: letter,
                isEntered: letter.isNotEmpty,
                isWrong: controller.isWrongGuess.value,
              );
            });
          },
        ),
      ),
    );
  }
}
