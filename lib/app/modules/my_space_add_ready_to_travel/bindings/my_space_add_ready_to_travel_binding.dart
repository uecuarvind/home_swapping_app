import 'package:get/get.dart';

import '../controllers/my_space_add_ready_to_travel_controller.dart';

class MySpaceAddReadyToTravelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MySpaceAddReadyToTravelController>(
      () => MySpaceAddReadyToTravelController(),
    );
  }
}
