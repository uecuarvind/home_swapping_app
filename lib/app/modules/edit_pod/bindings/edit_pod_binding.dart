import 'package:get/get.dart';

import '../controllers/edit_pod_controller.dart';

class EditPodBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditPodController>(
      () => EditPodController(),
    );
  }
}
