import 'package:get/get.dart';

import '../controllers/edit_my_space_location_controller.dart';

class EditMySpaceLocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditMySpaceLocationController>(
      () => EditMySpaceLocationController(),
    );
  }
}
