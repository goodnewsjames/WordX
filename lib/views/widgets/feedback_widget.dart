import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordx/controllers/game_controller.dart';

class FeedbackWidget extends StatelessWidget {
  FeedbackWidget({super.key});
 final GameController controller = Get.find<GameController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Container(
          height: 70,
          width: 335,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.1),
            border: Border.all(
              color: Color(0XFF3E87FF),
              width: 3,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              controller.feedbackMessage.value,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Comic-Helvetic",
                // color: Color(0XFFD3D3D0),
                fontWeight: FontWeight.w300,
                fontSize: 20,
              ),
            ),
          ),
        );
      }
    );
  }
}


// Color(0XFFD3D3D0)