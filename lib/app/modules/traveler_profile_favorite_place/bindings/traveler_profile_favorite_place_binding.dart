import 'package:get/get.dart';

import '../controllers/traveler_profile_favorite_place_controller.dart';

class TravelerProfileFavoritePlaceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TravelerProfileFavoritePlaceController>(
      () => TravelerProfileFavoritePlaceController(),
    );
  }
}
