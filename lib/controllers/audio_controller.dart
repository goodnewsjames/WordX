import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class AudioController extends GetxController {
  final AudioPlayer _backgroundPlayer = AudioPlayer();
  final AudioPlayer _effectPlayer = AudioPlayer();
  var isBackgroundPlaying = false.obs;

  @override
  void onClose() {
    _backgroundPlayer.dispose();
    _effectPlayer.dispose();
    super.onClose();
  }

  Future<void> startBackgroundSound() async {
    try {
      await _backgroundPlayer.setAsset('assets/sounds/background_sound.mp3');
      await _backgroundPlayer.setLoopMode(LoopMode.one);
      isBackgroundPlaying.value = true;
      await _backgroundPlayer.play();
    } catch (e) {
      print("Error starting background sound: $e");
    }
  }

  Future<void> stopBackgroundSound() async {
    try {
      await _backgroundPlayer.stop();
      isBackgroundPlaying.value = false;
    } catch (e) {
      print("Error stopping background sound: $e");
    }
  }

  Future<void> playKeyboardTap() async {
    try {
      await _effectPlayer.setAsset('assets/sounds/button_tap.mp3');
      await _effectPlayer.play();
    } catch (e) {
      print("Error playing keyboard tap sound: $e");
    }
  }

  Future<void> playDeleteTap() async {
    try {
      await _effectPlayer.setAsset('assets/sounds/button.mp3');
      await _effectPlayer.play();
    } catch (e) {
      print("Error playing delete tap sound: $e");
    }
  }

  Future<void> playLevelPassed() async {
    try {
      await _effectPlayer.setAsset('assets/sounds/level_passed_sound.wav');
      await _effectPlayer.play();
    } catch (e) {
      print("Error playing level passed sound: $e");
    }
  }
}