import 'package:get/get.dart';

import '../controllers/highlight_select_edit_controller.dart';

class HighlightSelectEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HighlightSelectEditController>(
      () => HighlightSelectEditController(),
    );
  }
}
