import 'package:get/get.dart';

import '../controllers/my_travel_plan_controller.dart';

class MyTravelPlanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyTravelPlanController>(
      () => MyTravelPlanController(),
    );
  }
}
