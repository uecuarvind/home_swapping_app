import 'package:get/get.dart';

import '../controllers/edit_about_me_controller.dart';

class EditAboutMeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditAboutMeController>(
      () => EditAboutMeController(),
    );
  }
}
