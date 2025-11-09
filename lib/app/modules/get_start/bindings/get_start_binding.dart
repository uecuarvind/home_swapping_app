import 'package:get/get.dart';

import '../controllers/get_start_controller.dart';

class GetStartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetStartController>(
      () => GetStartController(),
    );
  }
}
