import 'package:get/get.dart';

import '../controllers/spport_team_controller.dart';

class SpportTeamBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpportTeamController>(
      () => SpportTeamController(),
    );
  }
}
