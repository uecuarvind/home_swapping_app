import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:home_swipping/app/data/constants/image_constants.dart';
import 'package:home_swipping/app/data/constants/string_constants.dart';
import 'package:home_swipping/app/routes/app_pages.dart';

import '../../../../common/update_house_details.dart';

class SpacesStyleController extends GetxController {
  //TODO: Implement SpacesStyleController

  List<Map<String,dynamic>> spacesStyleList = [
    {
      'image':ImageConstants.imgSpaceStyle1,
      'style':'metropolitan',
      'isSelected':false
    },
    {
      'image':ImageConstants.imgSpaceStyle2,
      'style':'rural',
      'isSelected':false
    },
    {
      'image':ImageConstants.imgSpaceStyle1,
      'style':'desert',
      'isSelected':false
    },
    {
      'image':ImageConstants.imgSpaceStyle2,
      'style':'coastal',
      'isSelected':false
    },{
      'image':ImageConstants.imgSpaceStyle1,
      'style':'cabin',
      'isSelected':false
    },
    {
      'image':ImageConstants.imgSpaceStyle2,
      'style':'views',
      'isSelected':false
    }
  ];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    checkSelectedSpaceStyle();
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

  void checkSelectedSpaceStyle(){
    for(int i=0;i<spacesStyleList.length;i++){
      if(UpdateHouseDetails.myHouseModel?.houseDetails?.spaceStyle?.contains(spacesStyleList[i]['style'])??false){
        spacesStyleList[i]['isSelected']=true;
      }}
    increment();
  }

  clickToSelect(int index){
    spacesStyleList[index]['isSelected'] = !(spacesStyleList[index]['isSelected']);
    increment();
  }

  void clickOnContinueButton() async{
    await HapticFeedback.heavyImpact();
    await Haptics.vibrate(HapticsType.heavy);
    await setSelectedData();
    Get.toNamed(Routes.MY_SPACE_ADD_LOCATION);
  }

  Future<void> setSelectedData() async{
    List<String> list=[];
    for(int i=0;i<spacesStyleList.length;i++){
      if(spacesStyleList[i]['isSelected']){
        list.add(spacesStyleList[i]['style']);
      }
    }
    UpdateHouseDetails.spaceStyle=list;
  }

  void clickOnSkip(){
    Get.toNamed(Routes.MY_SPACE_ADD_LOCATION);
  }
}
