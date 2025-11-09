import 'package:get/get.dart';

import '../controllers/request_chat_controller.dart';

class RequestChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RequestChatController>(
      () => RequestChatController(),
    );
  }
}
