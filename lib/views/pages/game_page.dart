import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
               ScoreCardWidget(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    AddHintWidget(),
                    FeedbackWidget(),

                    AddDiamondWidget(),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Guess the word",
                  style: TextStyle(
                    color: Color(0XFFFF3D12),
                    fontFamily: "Comic-Helvetic",
                    fontWeight: FontWeight.w900,
                    fontSize: 32,
                  ),
                ),
              ),
              SizedBox(
                height: 200,
                child: Center(child: HintBox()),
              ),
              Center(child: InputBoxWidget()),
              SizedBox(height: 20),

              KeyboardWidget(),
              DeleteKeyWidget(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
