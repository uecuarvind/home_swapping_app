import 'package:get/get.dart';

import '../controllers/next_page_controller.dart';

class NextPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NextPageController>(
      () => NextPageController(),
    );
  }
}
