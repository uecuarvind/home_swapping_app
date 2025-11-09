import 'package:get/get.dart';

import '../controllers/features_space_have_controller.dart';

class FeaturesSpaceHaveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FeaturesSpaceHaveController>(
      () => FeaturesSpaceHaveController(),
    );
  }
}
