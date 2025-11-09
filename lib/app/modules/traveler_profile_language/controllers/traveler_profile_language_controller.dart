import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:home_swipping/app/routes/app_pages.dart';
import 'package:home_swipping/common/languageList.dart';
import 'package:home_swipping/common/update_profile_detail.dart';

import '../../../data/constants/image_constants.dart';

class TravelerProfileLanguageController extends GetxController {
  List<Map<String,dynamic>> languageList=[
  ];
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    languageList=TotalLanguageList.languageList;
    increment();
    checkSelectedLanguages();
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

  void checkSelectedLanguages(){
    for(int i=0;i<languageList.length;i++){
      if(UpdateProfileDetails.getUserModel?.user?.languages?.contains(languageList[i]['name'])??false){
        languageList[i]['status']=true;
      }
    }
    increment();
  }
  void changeSelectLanguage(int index) async{
    await HapticFeedback.lightImpact();
    await Haptics.vibrate(HapticsType.light);
    languageList[index]['status']=!languageList[index]['status'];
    increment();
  }
  void clickOnContinueButton()async{
    await HapticFeedback.heavyImpact();
    await Haptics.vibrate(HapticsType.heavy);
    List<String> selectedLanguageList=[];
    for(int i=0;i<languageList.length;i++){
      if(languageList[i]['status']){
        selectedLanguageList.add(languageList[i]['name']);
      }
    }
    UpdateProfileDetails.languages=selectedLanguageList;
    //Get.toNamed(Routes.TRAVELER_PROFILE_FAVORITE_PLACE);
    //Get.toNamed(Routes.TRAVELER_PROFILE_DREAMING_GO);
   // Get.toNamed(Routes.TRAVELER_PROFILE_COMPLETE);
    Get.toNamed(Routes.THAT_IT);
  }
}
