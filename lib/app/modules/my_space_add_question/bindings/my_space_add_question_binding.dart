import 'package:get/get.dart';

import '../controllers/my_space_add_question_controller.dart';

class MySpaceAddQuestionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MySpaceAddQuestionController>(
      () => MySpaceAddQuestionController(),
    );
  }
}
