import 'package:get/get.dart';
import 'package:home_swipping/app/modules/explore/controllers/explore_controller.dart';
import 'package:home_swipping/app/modules/profile_setting/controllers/profile_setting_controller.dart';
import 'package:home_swipping/app/modules/trips/controllers/trips_controller.dart';

import '../controllers/nav_bar_controller.dart';

class NavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavBarController>(
      () => NavBarController(),
    );
    Get.lazyPut<TripsController>(
          () => TripsController(),
    );
    Get.lazyPut<ExploreController>(
          () => ExploreController(),
    );
    Get.lazyPut<ProfileSettingController>(
          () => ProfileSettingController(),
    );

  }
}
