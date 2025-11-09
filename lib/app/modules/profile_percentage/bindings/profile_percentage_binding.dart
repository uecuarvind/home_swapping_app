import 'package:get/get.dart';

import '../controllers/profile_percentage_controller.dart';

class ProfilePercentageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfilePercentageController>(
      () => ProfilePercentageController(),
    );
  }
}
