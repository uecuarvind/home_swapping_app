import 'package:get/get.dart';

import '../controllers/traveler_profile_about_us_controller.dart';

class TravelerProfileAboutUsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TravelerProfileAboutUsController>(
      () => TravelerProfileAboutUsController(),
    );
  }
}
