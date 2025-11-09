import 'package:get/get.dart';

import '../controllers/traveler_profile_travel_love_controller.dart';

class TravelerProfileTravelLoveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TravelerProfileTravelLoveController>(
      () => TravelerProfileTravelLoveController(),
    );
  }
}
