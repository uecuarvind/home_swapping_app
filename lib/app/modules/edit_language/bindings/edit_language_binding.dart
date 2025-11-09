import 'package:get/get.dart';

import '../controllers/edit_language_controller.dart';

class EditLanguageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditLanguageController>(
      () => EditLanguageController(),
    );
  }
}
