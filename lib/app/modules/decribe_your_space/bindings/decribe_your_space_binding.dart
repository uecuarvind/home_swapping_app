import 'package:get/get.dart';

import '../controllers/decribe_your_space_controller.dart';

class DecribeYourSpaceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DecribeYourSpaceController>(
      () => DecribeYourSpaceController(),
    );
  }
}
