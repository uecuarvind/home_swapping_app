import 'package:get/get.dart';

import '../controllers/send_swap_offer_controller.dart';

class SendSwapOfferBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SendSwapOfferController>(
      () => SendSwapOfferController(),
    );
  }
}
