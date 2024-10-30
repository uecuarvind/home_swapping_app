import 'package:get/get.dart';

import '../controllers/finding_homes_controller.dart';

class FindingHomesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FindingHomesController>(
      () => FindingHomesController(),
    );
  }
}
