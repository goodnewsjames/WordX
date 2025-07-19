import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordx/controllers/effect_controller.dart';

class EmptyBoxWidget extends StatelessWidget {
  EmptyBoxWidget({
    super.key,
    this.letter = "",
    this.isEntered = false,
    this.isWrong = false,
    
  }) {
    if (isWrong) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.find<EffectsController>().shake();
      });
    }
  }

  final String? letter;
  final bool isEntered;
  final bool isWrong;
 

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EffectsController>(
      builder: (controller) {
        return Transform.translate(
          offset: Offset(controller.shakeValue, 0),
          child: Container(
            height: 50,
            width: 50,
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              color:
                  isEntered
                  ? const Color(0xFF3E87FF)
                  : Colors.white.withValues(alpha: 0.2),
              border: Border.all(
                color: isWrong
                    ? const Color(0xFFFFB571)
                    : const Color(0xFF3E87FF),
                width: isWrong ? 4 : 3,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                letter ?? '',
                style: const TextStyle(
                  fontFamily: "Comic-Helvetic",
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
