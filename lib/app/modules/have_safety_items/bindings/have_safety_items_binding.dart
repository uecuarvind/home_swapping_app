import 'package:get/get.dart';

import '../controllers/have_safety_items_controller.dart';

class HaveSafetyItemsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HaveSafetyItemsController>(
      () => HaveSafetyItemsController(),
    );
  }
}
