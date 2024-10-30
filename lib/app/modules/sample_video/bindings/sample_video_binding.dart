import 'package:get/get.dart';

import '../controllers/sample_video_controller.dart';

class SampleVideoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SampleVideoController>(
      () => SampleVideoController(),
    );
  }
}
