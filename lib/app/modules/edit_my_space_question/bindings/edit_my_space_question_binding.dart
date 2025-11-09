import 'package:get/get.dart';

import '../controllers/edit_my_space_question_controller.dart';

class EditMySpaceQuestionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditMySpaceQuestionController>(
      () => EditMySpaceQuestionController(),
    );
  }
}
