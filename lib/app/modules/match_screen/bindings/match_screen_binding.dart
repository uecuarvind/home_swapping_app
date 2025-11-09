import 'package:get/get.dart';

import '../controllers/match_screen_controller.dart';

class MatchScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MatchScreenController>(
      () => MatchScreenController(),
    );
  }
}
