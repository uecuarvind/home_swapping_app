import 'package:get/get.dart';

import '../controllers/house_rule_controller.dart';

class HouseRuleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HouseRuleController>(
      () => HouseRuleController(),
    );
  }
}
