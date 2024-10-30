import 'package:get/get.dart';

import '../controllers/trip_request_controller.dart';

class TripRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TripRequestController>(
      () => TripRequestController(),
    );
  }
}
