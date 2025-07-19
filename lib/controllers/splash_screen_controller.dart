import 'package:get/get.dart';
import 'package:wordx/views/pages/game_page.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 2), () {
      Get.off(GamePage());
    });
  }
}
