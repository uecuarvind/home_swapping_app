import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

import '../../../../common/update_profile_detail.dart';
import '../../../routes/app_pages.dart';

class TravelerProfileFavoritePlaceController extends GetxController {
  List<Map<String,dynamic>> dreamList = [
    {
      'image':'assets/images/img_barcelona.png',
      'place':'Barcelona',
      'status':false
    },
    {
      'image':'assets/images/img_lisbon.png',
      'place':'Lisbon',
      'status':false
    },
    {
      'image':'assets/images/img_miami.png',
      'place':'Miami',
      'status':false
    },
    {
      'image':'assets/images/img_barcelona.png',
      'place':'Barcelona',
      'status':false
    },
    {
      'image':'assets/images/img_lisbon.png',
      'place':'Lisbon',
      'status':false
    },
    {
      'image':'assets/images/img_miami.png',
      'place':'Miami',
      'status':false
    }
  ];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    checkSelectedFavorites();
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


  void checkSelectedFavorites(){
    for(int i=0;i<dreamList.length;i++){
      if(UpdateProfileDetails.getUserModel?.user?.favoritePlace?.contains(dreamList[i]['place'])??false){
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
    UpdateProfileDetails.favoritePlace=selectedList;
   // Get.toNamed(Routes.TRAVELER_PROFILE_DREAMING_GO);
     Get.toNamed(Routes.TRAVELER_PROFILE_LANGUAGE);
  }
}
