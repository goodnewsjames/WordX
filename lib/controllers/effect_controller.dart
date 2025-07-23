import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

class EffectsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> shakeAnimation;
  bool _hasVibrated =
      false; // Track if haptic feedback has been triggered

  @override
  void onInit() {
    super.onInit();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );

    shakeAnimation = Tween<double>(begin: -15, end: 15)
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.linear,
          ),
        );

    _controller.addListener(() {
      update();
      Haptics.vibrate(
        HapticsType.medium,
      ); // Notify GetX for UI updates
    });
  }

  void shake() async {
    if (!_hasVibrated) {
      try {
        await Haptics.vibrate(
          HapticsType.medium,
        ); // Trigger haptic feedback once
        _hasVibrated = true;
      } catch (e) {
        print("Error triggering haptic feedback: $e");
      }
    }
    _controller.repeat(
      reverse: true,
    ); // Rapid back-and-forth shake
    Future.delayed(const Duration(seconds: 1), () {
      _controller.stop();
      _controller.reset();
      _hasVibrated = false; // Reset for next shake
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
