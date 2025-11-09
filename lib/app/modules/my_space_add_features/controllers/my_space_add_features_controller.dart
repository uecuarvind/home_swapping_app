import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

import '../../../../common/update_house_details.dart';
import '../../../routes/app_pages.dart';

class MySpaceAddFeaturesController extends GetxController {

  List<Map<String,dynamic>> comfortList = [
    {
      'name':'Bathtub',
      'isSelected':false
    },
    {
      'name':'Coffee or Espresso Maker',
      'isSelected':false
    },
    {
      'name':'Hair Dryer',
      'isSelected':false
    },
    {
      'name':'Iron',
      'isSelected':false
    },
    {
      'name':'Fans',
      'isSelected':false
    }, {
      'name':'Dishwasher',
      'isSelected':false
    },{
      'name':'Drying Rack',
      'isSelected':false
    },
  ];
  List<Map<String,dynamic>> familyList = [
    {
      'name':'Pack N Play',
      'isSelected':false
    },
    {
      'name':'Car Seats',
      'isSelected':false
    },
    {
      'name':'High Chair',
      'isSelected':false
    },
    {
      'name':'Kids Utensils',
      'isSelected':false
    },

  ];
  List<Map<String,dynamic>> wellNessList = [
    {
      'name':'Sauna',
      'isSelected':false
    },
    {
      'name':'Treadmills',
      'isSelected':false
    },
    {
      'name':'Stationary Bike',
      'isSelected':false
    },
    {
      'name':'Onsite Gym',
      'isSelected':false
    },
    {
      'name':'Bicycles',
      'isSelected':false
    }, {
      'name':'Free Weights',
      'isSelected':false
    },{
      'name':'Surfboards',
      'isSelected':false
    },{
      'name':'Kayak',
      'isSelected':false
    },{
      'name':'Rowing Machine',
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

  void clickToComfortItem(int index){
    comfortList[index]['isSelected'] = !(comfortList[index]['isSelected']);
    increment();
  }
  void clickToWellNessItem(int index){
    wellNessList[index]['isSelected'] = !(wellNessList[index]['isSelected']);
    increment();
  }
  void clickToFamilyItem(int index){
    familyList[index]['isSelected'] = !(familyList[index]['isSelected']);
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
    Get.toNamed(Routes.MY_SPACE_ADD_AMENITIES);
  }


}
