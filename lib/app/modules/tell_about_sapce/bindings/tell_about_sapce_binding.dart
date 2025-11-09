import 'package:get/get.dart';

import '../controllers/tell_about_sapce_controller.dart';

class TellAboutSapceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TellAboutSapceController>(
      () => TellAboutSapceController(),
    );
  }
}
