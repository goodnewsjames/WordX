import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordx/controllers/game_controller.dart';
import 'package:wordx/views/widgets/filled_box_widget.dart';

class KeyboardWidget extends StatelessWidget {
   KeyboardWidget({
    super.key,
  });

  final GameController controller = Get.find<GameController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 150,
        child: GridView.builder(
          padding: EdgeInsets.all(16),
          shrinkWrap: true,

          physics: NeverScrollableScrollPhysics(),
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    MediaQuery.of(context).size.width < 400
                    ? 6
                    : 26,
              ),
          itemCount: controller
              .getCurrentLevel()
              .keyboardCharacters
              .length,
          itemBuilder: (context, index) {
            String letter = controller
                .getCurrentLevel()
                .keyboardCharacters[index];
            return GestureDetector(
              onTap: () {
                controller.addLetter(letter);
              },
              child: FilledBoxWidget(letter: letter),
            );
          },
        ),
      ),
    );
  }
}
