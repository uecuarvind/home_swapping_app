import 'package:get/get.dart';

import '../controllers/my_space_controller.dart';

class MySpaceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MySpaceController>(
      () => MySpaceController(),
    );
  }
}
