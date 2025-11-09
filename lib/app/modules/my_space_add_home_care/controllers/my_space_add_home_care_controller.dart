import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:home_swipping/app/routes/app_pages.dart';

import '../../../../common/update_house_details.dart';

class MySpaceAddHomeCareController extends GetxController {

  TextEditingController homeCareController = TextEditingController();
  FocusNode homeCareNode=FocusNode();
  final isHomeCare=false.obs;

  void startListing(){
    homeCareNode.addListener(changeFocus);
  }

  void changeFocus(){
    isHomeCare.value=homeCareNode.hasFocus;
  }
   List<Map<String,dynamic>>homeCareList=
  [{
    'title':'Plant Parent',
    'status':false
  },
    {
    'title':'Pets',
    'status':false
  },
    {
      'title':'Mail',
      'status':false
    },{
    'title':'add yours',
    'status':false
  },{
    'title':'do you have any home care while you’re away? this can be anything from plant to pet care.',
    'status':false
  }];


  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    startListing();
    checkSelectedHomeCare();
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

  void checkSelectedHomeCare(){
    for(int i=0;i<homeCareList.length;i++){
      if(UpdateHouseDetails.myHouseModel?.houseDetails?.homeCare?.contains(homeCareList[i]['title'])??false){
        homeCareList[i]['status']=true;
      }
    }
    increment();
  }

  void changeSelected(int index ){
    homeCareList[index]['status']=!homeCareList[index]['status'];
    increment();
  }


  void clickOnContinueButton()async{
    await HapticFeedback.heavyImpact();
    await Haptics.vibrate(HapticsType.heavy);
    List<String> selectedList=[];
    for(int i=0;i<homeCareList.length;i++){
      if(homeCareList[i]['status']){
        selectedList.add(homeCareList[i]['title']);
      }
    }
    UpdateHouseDetails.homeCare=selectedList;
   Get.toNamed(Routes.MY_SPACE_ADD_READY_TO_TRAVEL);
  }

}
