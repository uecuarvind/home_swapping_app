import 'package:get/get.dart';

import '../controllers/name_would_you_call_controller.dart';

class NameWouldYouCallBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NameWouldYouCallController>(
      () => NameWouldYouCallController(),
    );
  }
}
