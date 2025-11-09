import 'package:get/get.dart';

import '../controllers/want_to_share_space_controller.dart';

class WantToShareSpaceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WantToShareSpaceController>(
      () => WantToShareSpaceController(),
    );
  }
}
