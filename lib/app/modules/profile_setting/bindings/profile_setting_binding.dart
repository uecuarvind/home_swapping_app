import 'package:get/get.dart';

import '../controllers/profile_setting_controller.dart';

class ProfileSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileSettingController>(
      () => ProfileSettingController(),
    );
  }
}
