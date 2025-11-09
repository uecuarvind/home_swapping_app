import 'package:get/get.dart';

import '../controllers/request_accept_controller.dart';

class RequestAcceptBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RequestAcceptController>(
      () => RequestAcceptController(),
    );
  }
}
