import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:home_swipping/app/routes/app_pages.dart';

class MySpaceController extends GetxController {
   TextEditingController titleController=TextEditingController();
   TextEditingController locationController=TextEditingController();
  List<Map<String,String>> spaceCommonFeaturesList = [
    {
      'featureName':'Table',
      'featureIcon':'assets/icons/ic_table.png',
    },
    {
      'featureName':'Chair',
      'featureIcon':'assets/icons/ic_chair.png',
    },
    {
      'featureName':'Balcony',
      'featureIcon':'assets/icons/ic_balcony.png',
    },
    {
      'featureName':'Wifi',
      'featureIcon':'assets/icons/ic_wifi.png',
    },
    {
      'featureName':'Dishwasher',
      'featureIcon':'assets/icons/ic_dishwasher.png',
    },
    {
      'featureName':'Mini fridge',
      'featureIcon':'assets/icons/ic_mini_fridge.png',
    },
    {
      'featureName':'Refrigerator',
      'featureIcon':'assets/icons/ic_refrigerator.png',
    },
    {
      'featureName':'Stove',
      'featureIcon':'assets/icons/ic_stove.png',
    },
    {
      'featureName':'Freezer',
      'featureIcon':'assets/icons/ic_freezer.png',
    },
  ];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    titleController.text='Spacious studio in the heart of the city.';
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


  clickOnBasicEdit(){
    Get.toNamed(Routes.EDIT_MY_SPACE_BASIC);
  }
  clickOnEssentialEdit(){
    Get.toNamed(Routes.EDIT_MY_SPACE_ESSENTIAL);
  }
  clickOnLocationEdit(){
    Get.toNamed(Routes.EDIT_MY_SPACE_LOCATION);
  }
  clickOnSpaceQuestionEdit(){
    Get.toNamed(Routes.EDIT_MY_SPACE_QUESTION);
  }
  clickOnSpaceRulesEdit(){
    Get.toNamed(Routes.EDIT_MY_SPACE_RULES);
  }
}
