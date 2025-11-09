import 'package:get/get.dart';

import '../controllers/traveler_profile_pod_controller.dart';

class TravelerProfilePodBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TravelerProfilePodController>(
      () => TravelerProfilePodController(),
    );
  }
}
