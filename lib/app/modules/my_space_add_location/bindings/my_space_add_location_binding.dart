import 'package:get/get.dart';

import '../controllers/my_space_add_location_controller.dart';

class MySpaceAddLocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MySpaceAddLocationController>(
      () => MySpaceAddLocationController(),
    );
  }
}
