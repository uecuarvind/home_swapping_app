import 'package:get/get.dart';

import '../controllers/edit_my_profile_controller.dart';

class EditMyProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditMyProfileController>(
      () => EditMyProfileController(),
    );
  }
}
