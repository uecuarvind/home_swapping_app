import 'package:get/get.dart';

import '../controllers/edit_my_space_essential_controller.dart';

class EditMySpaceEssentialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditMySpaceEssentialController>(
      () => EditMySpaceEssentialController(),
    );
  }
}
