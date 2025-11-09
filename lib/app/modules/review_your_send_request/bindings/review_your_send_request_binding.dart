import 'package:get/get.dart';

import '../controllers/review_your_send_request_controller.dart';

class ReviewYourSendRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReviewYourSendRequestController>(
      () => ReviewYourSendRequestController(),
    );
  }
}
