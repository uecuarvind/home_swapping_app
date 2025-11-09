import 'package:get/get.dart';

import '../controllers/space_tape_controller.dart';

class SpaceTapeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpaceTapeController>(
      () => SpaceTapeController(),
    );
  }
}
