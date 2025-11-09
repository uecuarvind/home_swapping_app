import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:home_swipping/app/data/constants/string_constants.dart';
import 'package:home_swipping/app/routes/app_pages.dart';
import 'package:home_swipping/common/update_house_details.dart';

class WantToShareSpaceController extends GetxController {
  //TODO: Implement WantToShareSpaceController
  final selectedTabIndex = 0.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    if(UpdateHouseDetails.myHouseModel?.houseDetails?.sharingContext==StringConstants.sharedSpace){
      print('1.....');
      selectedTabIndex.value=1;
    }else{
      print('0.....');
      selectedTabIndex.value=0;
    }
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


  clickOnContinueButton()async{
    await HapticFeedback.heavyImpact();
    await Haptics.vibrate(HapticsType.heavy);
    UpdateHouseDetails.sharingContext=selectedTabIndex.value==0?StringConstants.entireSpace:StringConstants.sharedSpace;
    Get.toNamed(Routes.TELL_ABOUT_SAPCE);
  }
  changeTabIndex(int index)async{
    await HapticFeedback.lightImpact();
    await Haptics.vibrate(HapticsType.light);
    selectedTabIndex.value  = index;
  }
}
