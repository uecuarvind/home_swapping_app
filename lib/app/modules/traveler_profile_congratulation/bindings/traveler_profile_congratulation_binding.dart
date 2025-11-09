import 'package:get/get.dart';

import '../controllers/traveler_profile_congratulation_controller.dart';

class TravelerProfileCongratulationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TravelerProfileCongratulationController>(
      () => TravelerProfileCongratulationController(),
    );
  }
}
