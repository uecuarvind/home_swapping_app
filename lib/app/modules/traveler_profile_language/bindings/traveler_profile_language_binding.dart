import 'package:get/get.dart';

import '../controllers/traveler_profile_language_controller.dart';

class TravelerProfileLanguageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TravelerProfileLanguageController>(
      () => TravelerProfileLanguageController(),
    );
  }
}
