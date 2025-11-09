import 'package:get/get.dart';

import '../controllers/my_space_add_home_care_controller.dart';

class MySpaceAddHomeCareBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MySpaceAddHomeCareController>(
      () => MySpaceAddHomeCareController(),
    );
  }
}
