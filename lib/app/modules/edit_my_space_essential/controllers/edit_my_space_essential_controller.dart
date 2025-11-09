import 'package:get/get.dart';

class EditMySpaceEssentialController extends GetxController {
  List<Map<String,dynamic>> spaceCommonFeaturesList = [
    {
      'featureName':'Table',
      'featureIcon':'assets/icons/ic_table.png',
      'status':false
    },
    {
      'featureName':'Chair',
      'featureIcon':'assets/icons/ic_chair.png',
      'status':false
    },
    {
      'featureName':'Balcony',
      'featureIcon':'assets/icons/ic_balcony.png',
      'status':false
    },
    {
      'featureName':'Wifi',
      'featureIcon':'assets/icons/ic_wifi.png',
      'status':false
    },
    {
      'featureName':'Dishwasher',
      'featureIcon':'assets/icons/ic_dishwasher.png',
      'status':false
    },
    {
      'featureName':'Mini fridge',
      'featureIcon':'assets/icons/ic_mini_fridge.png',
      'status':false
    },
    {
      'featureName':'Refrigerator',
      'featureIcon':'assets/icons/ic_refrigerator.png',
      'status':false
    },
    {
      'featureName':'Stove',
      'featureIcon':'assets/icons/ic_stove.png',
      'status':false
    },
    {
      'featureName':'Freezer',
      'featureIcon':'assets/icons/ic_freezer.png',
      'status':false
    },
  ];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
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

  void clickOnSaveButton(){
    Get.back();
  }

  void changeStatus(int index){
    spaceCommonFeaturesList[index]['status']=!spaceCommonFeaturesList[index]['status'];
    increment();
  }

}
