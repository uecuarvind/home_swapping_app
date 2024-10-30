import 'package:get/get.dart';

import '../controllers/all_amenities_controller.dart';

class AllAmenitiesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllAmenitiesController>(
      () => AllAmenitiesController(),
    );
  }
}
