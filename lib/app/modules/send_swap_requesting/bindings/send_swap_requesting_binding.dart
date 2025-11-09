import 'package:get/get.dart';

import '../controllers/send_swap_requesting_controller.dart';

class SendSwapRequestingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SendSwapRequestingController>(
      () => SendSwapRequestingController(),
    );
  }
}
