import 'package:get/get.dart';

import '../controllers/highlighte_real_controller.dart';

class HighlighteRealBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HighlighteRealController>(
      () => HighlighteRealController(),
    );
  }
}
