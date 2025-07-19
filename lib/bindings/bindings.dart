import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wordx/controllers/effect_controller.dart';
import 'package:wordx/controllers/game_controller.dart';

class WordXBindings extends Bindings {
  @override
  void dependencies() {
    _injectRepositories();
    _injectControllers();
  }

  void _injectRepositories() async {
    await GetStorage.init();
  }

  void _injectControllers() {
    Get.put(GameController(), permanent: true);
    Get.lazyPut(() => EffectsController());
  }
}
