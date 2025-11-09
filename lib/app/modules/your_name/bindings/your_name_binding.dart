import 'package:get/get.dart';

import '../controllers/your_name_controller.dart';

class YourNameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<YourNameController>(
      () => YourNameController(),
    );
  }
}
