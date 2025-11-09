import 'package:get/get.dart';

import '../controllers/my_space_add_features_controller.dart';

class MySpaceAddFeaturesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MySpaceAddFeaturesController>(
      () => MySpaceAddFeaturesController(),
    );
  }
}
