import 'package:get/get.dart';

import '../controllers/credit_system_controller.dart';

class CreditSystemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreditSystemController>(
      () => CreditSystemController(),
    );
  }
}
