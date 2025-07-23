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
          height: 65,
          width: 220,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              controller.feedbackMessage.value,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Comic-Helvetic",
                color: Colors.black,
                fontWeight: FontWeight.w300,
                fontSize: 16,
              ),
            ),
          ),
        );
      }
    );
  }
}


// Color(0XFFD3D3D0)