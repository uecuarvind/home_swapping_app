import 'package:get/get.dart';

import '../controllers/traveler_profile_dreaming_go_controller.dart';

class TravelerProfileDreamingGoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TravelerProfileDreamingGoController>(
      () => TravelerProfileDreamingGoController(),
    );
  }
}
