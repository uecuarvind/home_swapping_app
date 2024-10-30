import 'package:get/get.dart';

import '../controllers/edit_travel_interest_controller.dart';

class EditTravelInterestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditTravelInterestController>(
      () => EditTravelInterestController(),
    );
  }
}
