import 'package:get/get.dart';

import '../controllers/host_review_request_controller.dart';

class HostReviewRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HostReviewRequestController>(
      () => HostReviewRequestController(),
    );
  }
}
