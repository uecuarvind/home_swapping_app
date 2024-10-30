import 'package:get/get.dart';

import '../controllers/edit_my_space_basic_controller.dart';

class EditMySpaceBasicBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditMySpaceBasicController>(
      () => EditMySpaceBasicController(),
    );
  }
}
