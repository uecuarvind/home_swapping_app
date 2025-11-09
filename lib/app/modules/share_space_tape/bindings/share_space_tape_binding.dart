import 'package:get/get.dart';

import '../controllers/share_space_tape_controller.dart';

class ShareSpaceTapeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShareSpaceTapeController>(
      () => ShareSpaceTapeController(),
    );
  }
}
