import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

import '../../../routes/app_pages.dart';

class TravelerProfileCongratulationController extends GetxController {
  //TODO: Implement TravelerProfileCongratulationController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void  clickOnExploreButton() async{
    await HapticFeedback.heavyImpact();
    await Haptics.vibrate(HapticsType.heavy);
    Get.offNamedUntil(Routes.EXPLORE,(route)=>false);
  }
}
