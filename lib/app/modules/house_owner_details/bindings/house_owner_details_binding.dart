import 'package:get/get.dart';

import '../controllers/house_owner_details_controller.dart';

class HouseOwnerDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HouseOwnerDetailsController>(
      () => HouseOwnerDetailsController(),
    );
  }
}
