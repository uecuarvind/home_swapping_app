import 'package:get/get.dart';

import '../controllers/edit_my_space_rules_controller.dart';

class EditMySpaceRulesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditMySpaceRulesController>(
      () => EditMySpaceRulesController(),
    );
  }
}
