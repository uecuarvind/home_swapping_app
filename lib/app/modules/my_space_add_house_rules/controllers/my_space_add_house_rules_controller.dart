import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:home_swipping/app/routes/app_pages.dart';
import 'package:home_swipping/common/update_house_details.dart';

class MySpaceAddHouseRulesController extends GetxController {
  List<Map<String,dynamic>> rulesList=[
    {
      'title':'No Smoking',
      'status':false
    },
    {
      'title':'No Pets',
      'status':false
    },
    {
      'title':'No Parties',
      'status':false
    }
    , {
      'title':'No shoes inside',
      'status':false
    },
    {
      'title':'No children',
      'status':false
    }
  ];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    checkSelectedHouseRule();
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

  void checkSelectedHouseRule(){
    for(int i=0;i<rulesList.length;i++){
      if(UpdateHouseDetails.myHouseModel?.houseDetails?.houseRules?.contains(rulesList[i]['title'])??false){
        rulesList[i]['status']=true;
      }
    }
    increment();
  }

  void changeValue(int index,bool value){
    rulesList[index]['status']=value;
    increment();
  }

  void clickOnSaveButton(){
    Get.back();
  }


  void clickOnContinueButton()async{
    await HapticFeedback.heavyImpact();
    await Haptics.vibrate(HapticsType.heavy);
    List<String> selectedList=[];
    for(int i=0;i<rulesList.length;i++){
      if(rulesList[i]['status']){
        selectedList.add(rulesList[i]['title']);
      }
    }
    UpdateHouseDetails.houseRules=selectedList;
   Get.toNamed(Routes.MY_SPACE_ADD_HOME_CARE);
  }


}
