import 'package:get/get.dart';

import '../controllers/my_space_add_amenities_controller.dart';

class MySpaceAddAmenitiesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MySpaceAddAmenitiesController>(
      () => MySpaceAddAmenitiesController(),
    );
  }
}
