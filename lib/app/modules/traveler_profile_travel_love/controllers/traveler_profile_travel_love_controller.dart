import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:home_swipping/app/routes/app_pages.dart';
import 'package:home_swipping/common/update_profile_detail.dart';

class TravelerProfileTravelLoveController extends GetxController {
  List<Map<String,dynamic>> dreamList = [
    {
      'image':'assets/images/img_barcelona.png',
      'place':'Exploring',
      'status':false
    },
    {
      'image':'assets/images/img_lisbon.png',
      'place':'Game Nights',
      'status':false
    },
    {
      'image':'assets/images/img_miami.png',
      'place':'Delicious Foods',
      'status':false
    },
    {
      'image':'assets/images/img_barcelona.png',
      'place':'Architecture',
      'status':false
    },
    {
      'image':'assets/images/img_lisbon.png',
      'place':'Photography',
      'status':false
    },
    {
      'image':'assets/images/img_miami.png',
      'place':'Local Coffee',
      'status':false
    }
  ];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    checkSelectedTravelLove();
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

  void checkSelectedTravelLove(){
    for(int i=0;i<dreamList.length;i++){
      if(UpdateProfileDetails.getUserModel?.user?.whatYouLove?.contains(dreamList[i]['place'])??false){
        dreamList[i]['status']=true;
      }
    }
    increment();
  }

  void changeSelected(int index) async{
    await HapticFeedback.lightImpact();
    await Haptics.vibrate(HapticsType.light);
    dreamList[index]['status']=!(dreamList[index]['status']);
    increment();
  }

  void clickOnContinueButton()async{
    await HapticFeedback.heavyImpact();
    await Haptics.vibrate(HapticsType.heavy);
    List<String> selectedList=[];
    for(int i=0;i<dreamList.length;i++){
      if(dreamList[i]['status']){
        selectedList.add(dreamList[i]['place']);
      }
    }
    UpdateProfileDetails.what_you_love=selectedList;
   // Get.toNamed(Routes.TRAVELER_PROFILE_LANGUAGE);
    Get.toNamed(Routes.TRAVELER_PROFILE_FAVORITE_PLACE);
  }
}
