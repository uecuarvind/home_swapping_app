import 'package:get/get.dart';

import '../controllers/swap_stays_controller.dart';

class SwapStaysBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SwapStaysController>(
      () => SwapStaysController(),
    );
  }
}
