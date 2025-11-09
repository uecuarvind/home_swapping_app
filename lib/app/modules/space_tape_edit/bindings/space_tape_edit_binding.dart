import 'package:get/get.dart';

import '../controllers/space_tape_edit_controller.dart';

class SpaceTapeEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpaceTapeEditController>(
      () => SpaceTapeEditController(),
    );
  }
}
