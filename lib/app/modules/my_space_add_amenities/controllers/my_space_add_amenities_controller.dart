import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:home_swipping/app/routes/app_pages.dart';
import 'package:home_swipping/common/update_house_details.dart';

class MySpaceAddAmenitiesController extends GetxController {

  List<Map<String,dynamic>> topAminitiesList = [
    {
      'name':'Gym',
      'isSelected':false
    },
    {
      'name':'Beach access',
      'isSelected':false
    },
    {
      'name':'Great Location',
      'isSelected':false
    },
    {
      'name':'Quiet & Peaceful',
      'isSelected':false
    },
    {
      'name':'History',
      'isSelected':false
    }, {
      'name':'Galleries',
      'isSelected':false
    },{
      'name':'Adventure',
      'isSelected':false
    },
  ];
  List<String> aminetiesList=[
   'Hot tub/Jacuzzi',
    'Swimming pool',
    'Spa services',
    'Home theater',
    'Garden Patio',
    'Meditation/yoga room',
    'Fireplace',
    'Outdoor grill/bbq',
    'Hammock',
    'Reading nook'
  ];
  List<bool> aminetiesStatusList=[false,false,false,false,false,false,false,false,false,false];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    checkSelectedRelaxing();
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

  void clickToAnimityItem(int index){
    topAminitiesList[index]['isSelected'] = !(topAminitiesList[index]['isSelected']);
    increment();
  }


  void checkSelectedRelaxing(){
    for(int i=0;i<aminetiesList.length;i++){
      if(UpdateHouseDetails.myHouseModel?.houseDetails?.relaxingFeatures?.contains(aminetiesList[i])??false){
        aminetiesStatusList[i]=true;
      }
    }
    increment();
  }
  // void changeStatus(int index){
  //   aminetiesStatusList[index]=!aminetiesStatusList[index];
  //   increment();
  // }

  void clickOnContinueButton()async{
    await HapticFeedback.heavyImpact();
    await Haptics.vibrate(HapticsType.heavy);
    List<String> selectedList=[];
    for(int i=0;i<aminetiesList.length;i++){
      if(aminetiesStatusList[i]){
        selectedList.add(aminetiesList[i]);
      }
    }
    UpdateHouseDetails.relaxingFeatures=selectedList;
    Get.toNamed(Routes.MY_SPACE_ADD_HOUSE_RULES);
  }

}
