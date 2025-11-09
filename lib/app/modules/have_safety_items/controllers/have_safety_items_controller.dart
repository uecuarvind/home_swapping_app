import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

import '../../../../common/update_house_details.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../routes/app_pages.dart';

class HaveSafetyItemsController extends GetxController {
  //TODO: Implement HaveSafetyItemsController

  List<Map<String,dynamic>> safetyItemList = [
    {
      'name':'Fire Alarm',
      'icon':IconConstants.icFireAlarm,
      'isSelected':false
    },
    {
      'name':'First aid kit',
      'icon':IconConstants.icFirstAidKit,
      'isSelected':false
    },
    {
      'name':'Lock on bedroom door',
      'icon':IconConstants.icLock,
      'isSelected':false
    },
    {
      'name':'Fire extinguisher',
      'icon':IconConstants.icFireExtinguisher,
      'isSelected':false
    },
    {
      'name':'Carbon monoxide alarm',
      'icon':IconConstants.icCOAlarm,
      'isSelected':false
    },
  ];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    checkSelectedSafetyItem();
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
  void checkSelectedSafetyItem(){
    for(int i=0;i<safetyItemList.length;i++){
      if(UpdateHouseDetails.myHouseModel?.houseDetails?.safetyItems?.contains(safetyItemList[i]['name'])??false){
        safetyItemList[i]['isSelected']=true;
      }
    }
    increment();
  }

  clickToContinue() async{
    await HapticFeedback.heavyImpact();
    await Haptics.vibrate(HapticsType.heavy);
    await setSelectedData();
    Get.toNamed(Routes.SPACES_STYLE);
  }
  clickToSelect(int index){
    safetyItemList[index]['isSelected'] = !(safetyItemList[index]['isSelected']);
    increment();
  }


  Future<void> setSelectedData() async{
    List<String> list=[];
    for(int i=0;i<safetyItemList.length;i++){
      if(safetyItemList[i]['isSelected']){
        list.add(safetyItemList[i]['name']);
      }
    }
    UpdateHouseDetails.safetyItems=list;
  }

  void clickOnSkip(){
    Get.toNamed(Routes.SPACES_STYLE);
  }
}
