import 'package:get/get.dart';

import '../controllers/ary_passport_controller.dart';

class AryPassportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AryPassportController>(
      () => AryPassportController(),
    );
  }
}
