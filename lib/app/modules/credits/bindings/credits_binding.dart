import 'package:get/get.dart';

import '../controllers/credits_controller.dart';

class CreditsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreditsController>(
      () => CreditsController(),
    );
  }
}
