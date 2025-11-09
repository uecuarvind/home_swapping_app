import 'package:get/get.dart';

import '../controllers/edit_dream_destinations_controller.dart';

class EditDreamDestinationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditDreamDestinationsController>(
      () => EditDreamDestinationsController(),
    );
  }
}
