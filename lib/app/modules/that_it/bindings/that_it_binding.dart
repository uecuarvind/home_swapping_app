import 'package:get/get.dart';

import '../controllers/that_it_controller.dart';

class ThatItBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ThatItController>(
      () => ThatItController(),
    );
  }
}
