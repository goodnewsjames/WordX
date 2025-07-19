import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EffectsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> shakeAnimation;

  @override
  void onInit() {
    super.onInit();
    _controller = AnimationController(
      duration: const Duration(
        milliseconds: 100,
      ), 
      vsync: this,
    );

    shakeAnimation = Tween<double>(begin: -15, end: 15)
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves
                .linear, 
          ),
        );

    _controller.addListener(() {
      update(); 
    });
  }

  void shake() {
    _controller.repeat(
      reverse: true,
    ); // Rapid back-and-forth shake
    Future.delayed(const Duration(seconds: 1), () {
      _controller.stop();
      _controller.reset();
      update();
    });
  }

  double get shakeValue => shakeAnimation.value;

  @override
  void onClose() {
    _controller.dispose();
    super.onClose();
  }
}
