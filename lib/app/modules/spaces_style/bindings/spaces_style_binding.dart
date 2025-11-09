import 'package:get/get.dart';

import '../controllers/spaces_style_controller.dart';

class SpacesStyleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpacesStyleController>(
      () => SpacesStyleController(),
    );
  }
}
