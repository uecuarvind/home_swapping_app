import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:home_swipping/common/update_house_details.dart';

import '../../../routes/app_pages.dart';

class TellAboutSapceController extends GetxController {
  //TODO: Implement TellAboutSapceController
  final noOfGuests = 1.obs;
  final noOfBedrooms = 1.obs;
  final noOfBeds = 1.obs;
  final noOfBathrooms = 1.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    if(UpdateHouseDetails.myHouseModel?.houseDetails?.moreAboutSpace!=null){
      noOfGuests.value=UpdateHouseDetails.myHouseModel?.houseDetails?.moreAboutSpace?.guests??1;
      noOfBedrooms.value=UpdateHouseDetails.myHouseModel?.houseDetails?.moreAboutSpace?.bedrooms??1;
      noOfBeds.value=UpdateHouseDetails.myHouseModel?.houseDetails?.moreAboutSpace?.bed??1;
      noOfBathrooms.value=UpdateHouseDetails.myHouseModel?.houseDetails?.moreAboutSpace?.bathrooms??1;
    }
    increment();
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


  void increase(int index) async{
    await HapticFeedback.lightImpact();
    await Haptics.vibrate(HapticsType.light);
    switch(index){
      case 0:{
        noOfGuests.value++;
      }
      case 1:{
        noOfBedrooms.value++;
      }
      case 2:{
        noOfBeds.value++;
      }
      case 3:{
        noOfBathrooms.value++;
      }
    }
  }

  void decrease(int index)async{
    await HapticFeedback.lightImpact();
    await Haptics.vibrate(HapticsType.light);
    switch(index){
      case 0:{
        if(noOfGuests.value>1){
          noOfGuests.value--;
        }
    }break;
      case 1:{
        if(noOfBedrooms.value>1){
          noOfBedrooms.value--;
        }
      }break;
      case 2:{
        if(noOfBeds.value>1){
          noOfBeds.value--;
        }
      }break;

      case 3:{
        if(noOfBathrooms.value>1){
          noOfBathrooms.value--;
        }
      }break;
  }
  }

  clickOnContinueButton()async{
    await HapticFeedback.heavyImpact();
    await Haptics.vibrate(HapticsType.heavy);
    UpdateHouseDetails.moreAboutSpace={
      "guests": noOfGuests.value,
      "bedrooms": noOfBedrooms.value,
      "bed": noOfBeds.value,
      "bathrooms": noOfBathrooms.value
    };
    Get.toNamed(Routes.FEATURES_SPACE_HAVE);
  }

}
