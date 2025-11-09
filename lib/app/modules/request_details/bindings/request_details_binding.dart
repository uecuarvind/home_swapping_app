import 'package:get/get.dart';

import '../controllers/request_details_controller.dart';

class RequestDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RequestDetailsController>(
      () => RequestDetailsController(),
    );
  }
}
