import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordx/controllers/game_controller.dart';
import 'package:wordx/views/widgets/add_diamond_widget.dart';
import 'package:wordx/views/widgets/add_hint_widget.dart';
import 'package:wordx/views/widgets/delete_key_widget.dart';
import 'package:wordx/views/widgets/feedback_widget.dart';
import 'package:wordx/views/widgets/hint_box.dart';
import 'package:wordx/views/widgets/input_box_widget.dart';
import 'package:wordx/views/widgets/keyboard_widget.dart';
import 'package:wordx/views/widgets/score_card_widget.dart';

class GamePage extends StatelessWidget {
  GamePage({super.key});

  final GameController controller =
      Get.find<GameController>();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            image: DecorationImage(
              scale: 2,
              alignment: Alignment(0.7, 0),
              image: AssetImage(
                'assets/images/background_image.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(
                () => ScoreCardWidget(
                  currentLevel:
                      controller.currentLevel.string,
                  trilsLeft: controller.trialsLeft.string,
                  points: controller.totalPoints.string,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    AddHintWidget(),

                    AddDiamondWidget(),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  vertical: 10,
                ),
                child: FeedbackWidget(),
              ),
              SizedBox(
                height: 300,
                child: Center(child: HintBox()),
              ),

              Center(child: InputBoxWidget()),

              SizedBox(height: 30),
              KeyboardWidget(),
              DeleteKeyWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
