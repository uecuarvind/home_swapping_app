import 'package:get/get.dart';

import '../controllers/traveler_profile_questions_controller.dart';

class TravelerProfileQuestionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TravelerProfileQuestionsController>(
      () => TravelerProfileQuestionsController(),
    );
  }
}
