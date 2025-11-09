import 'package:get/get.dart';

import '../controllers/booked_details_controller.dart';

class BookedDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookedDetailsController>(
      () => BookedDetailsController(),
    );
  }
}
