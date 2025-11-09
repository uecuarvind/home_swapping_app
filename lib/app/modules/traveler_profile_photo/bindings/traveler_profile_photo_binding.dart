import 'package:get/get.dart';

import '../controllers/traveler_profile_photo_controller.dart';

class TravelerProfilePhotoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TravelerProfilePhotoController>(
      () => TravelerProfilePhotoController(),
    );
  }
}
