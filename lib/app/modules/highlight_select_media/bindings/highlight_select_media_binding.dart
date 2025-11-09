import 'package:get/get.dart';

import '../controllers/highlight_select_media_controller.dart';

class HighlightSelectMediaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HighlightSelectMediaController>(
      () => HighlightSelectMediaController(),
    );
  }
}
