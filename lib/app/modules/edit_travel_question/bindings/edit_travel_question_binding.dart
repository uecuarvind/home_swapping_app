import 'package:get/get.dart';

import '../controllers/edit_travel_question_controller.dart';

class EditTravelQuestionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditTravelQuestionController>(
      () => EditTravelQuestionController(),
    );
  }
}
