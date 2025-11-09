import 'package:get/get.dart';

import '../controllers/traveler_profile_complete_controller.dart';

class TravelerProfileCompleteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TravelerProfileCompleteController>(
      () => TravelerProfileCompleteController(),
    );
  }
}
