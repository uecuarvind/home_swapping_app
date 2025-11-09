import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

import '../../../../common/update_profile_detail.dart';
import '../../../data/api_models/get_user_model.dart';
import '../../../routes/app_pages.dart';

class ProfilePercentageController extends GetxController with GetSingleTickerProviderStateMixin  {
  late AnimationController animationController;
  late Animation<double> animation;
  final percentageProfile = 0.20.obs;

  final count = 0.obs;
  @override
  void onInit() {
    calculatePercentageCompletion();
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    animation = Tween<double>(begin: 0.0, end: percentageProfile.value).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    ));

    animationController.forward();
    super.onInit();

    pageDuration();
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

  void calculatePercentageCompletion() async{
    GetUserModel? getUserModel= UpdateProfileDetails.getUserModel;
    if(getUserModel?.user?.spaceQuestionAns!=null){
      percentageProfile.value=percentageProfile.value+0.10;
    }
    if(getUserModel?.user?.partners!=null){
      percentageProfile.value=percentageProfile.value+0.10;
    }
    if(getUserModel?.user?.languages!=null){
      percentageProfile.value=percentageProfile.value+0.10;
    }
    if(getUserModel?.user?.favoritePlace!=null){
      percentageProfile.value=percentageProfile.value+0.10;
    }
    if(getUserModel?.user?.dreamPlace!=null){
      percentageProfile.value=percentageProfile.value+0.10;
    }
    if(getUserModel?.user?.whatYouLove!=null){
      percentageProfile.value=percentageProfile.value+0.10;
    }
    if(getUserModel?.user?.profileimage!=null){
      percentageProfile.value=percentageProfile.value+0.05;
    }
    if(getUserModel?.user?.description!=null){
      percentageProfile.value=percentageProfile.value+0.05;
    }
    await HapticFeedback.heavyImpact();
    await Haptics.vibrate(HapticsType.heavy);
    increment();
  }


  void pageDuration(){
    Future.delayed(const Duration(seconds: 3)).then((val) {
      Get.offNamed(Routes.TRAVELER_PROFILE_CONGRATULATION);
    });
  }
}
