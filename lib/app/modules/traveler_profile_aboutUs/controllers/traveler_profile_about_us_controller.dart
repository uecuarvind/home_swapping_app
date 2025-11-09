import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:home_swipping/app/routes/app_pages.dart';
import 'package:home_swipping/common/update_profile_detail.dart';

class TravelerProfileAboutUsController extends GetxController {
  TextEditingController aboutMeController=TextEditingController();
  FocusNode focusAboutMe = FocusNode();
  final isAboutMe = false.obs;
  final count = 0.obs;

  void startListener() {
    focusAboutMe.addListener(onFocusChange);
  }
  void onFocusChange() {
    isAboutMe.value = focusAboutMe.hasFocus;
  }
  @override
  void onInit() {
    super.onInit();
    aboutMeController.text=UpdateProfileDetails.getUserModel?.user?.description??'';
    startListener();
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



  void clickOnContinueButton()async{
    await HapticFeedback.heavyImpact();
    await Haptics.vibrate(HapticsType.heavy);
    UpdateProfileDetails.description=aboutMeController.text;
  //  Get.toNamed(Routes.TRAVELER_PROFILE_QUESTIONS);
    Get.toNamed(Routes.TRAVELER_PROFILE_TRAVEL_LOVE);
  }
}
