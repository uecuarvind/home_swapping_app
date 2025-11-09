import 'package:get/get.dart';

import '../controllers/my_space_add_house_rules_controller.dart';

class MySpaceAddHouseRulesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MySpaceAddHouseRulesController>(
      () => MySpaceAddHouseRulesController(),
    );
  }
}
