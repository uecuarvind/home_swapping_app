import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:home_swipping/app/data/constants/icons_constant.dart';
import 'package:home_swipping/common/update_house_details.dart';

import '../../../routes/app_pages.dart';

class FeaturesSpaceHaveController extends GetxController {

  
  List<Map<String,dynamic>> featuresList = [
    {
      'name':'Wifi',
      'icon':IconConstants.icWifi2,
      'isSelected':false
    },
    {
      'name':'TV',
      'icon':IconConstants.icTv,
      'isSelected':false
    },
    {
      'name':'Kitchen',
      'icon':IconConstants.icKitchen,
      'isSelected':false
    },
    {
      'name':'Washer',
      'icon':IconConstants.icWasher,
      'isSelected':false
    },
    {
      'name':'Tub',
      'icon':IconConstants.icTub,
      'isSelected':false
    },
    {
      'name':'Air Conditioner',
      'icon':IconConstants.icAirConditioner,
      'isSelected':false
    },
    {
      'name':'Safe',
      'icon':IconConstants.icSafe,
      'isSelected':false
    },
    {
      'name':'Garden',
      'icon':IconConstants.icGarden,
      'isSelected':false
    },
  ];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    checkSelectedFeatures();
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

  void checkSelectedFeatures(){
    for(int i=0;i<featuresList.length;i++){
      if(UpdateHouseDetails.myHouseModel?.houseDetails?.features?.contains(featuresList[i]['name'])??false){
        featuresList[i]['isSelected']=true;
      }
    }
    increment();
  }

  clickToSelect(int index){
    featuresList[index]['isSelected'] = !(featuresList[index]['isSelected']);
    increment();
  }
  
  clickToContinue() async{
    await HapticFeedback.heavyImpact();
    await Haptics.vibrate(HapticsType.heavy);
    await setSelectedData();
    Get.toNamed(Routes.HAVE_SAFETY_ITEMS);
  }

  Future<void> setSelectedData() async{
    List<String> list=[];
    for(int i=0;i<featuresList.length;i++){
      if(featuresList[i]['isSelected']){
        list.add(featuresList[i]['name']);
      }
    }
    UpdateHouseDetails.features=list;
  }

}
