import 'package:get/get.dart';

import '../controllers/edit_share_space_tape_controller.dart';

class EditShareSpaceTapeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditShareSpaceTapeController>(
      () => EditShareSpaceTapeController(),
    );
  }
}
