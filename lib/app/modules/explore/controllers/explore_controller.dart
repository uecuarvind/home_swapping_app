import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:home_swipping/app/routes/app_pages.dart';

class ExploreController extends GetxController {
  final isModernDesignSelected = false.obs;

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
  PageController pageController  = PageController();
  CarouselController sliderController  = CarouselController();
  TextEditingController searchController = TextEditingController();
  final name='Josh'.obs;

  List<Map<String,String>> houseList=[
    {'image':'assets/images/img_house.png'},
    {'image':'assets/images/img_house1.png'},
    {'image':'assets/images/img_house.png'},
    {'image':'assets/images/img_house1.png'},
    {'image':'assets/images/img_house.png'},
  ];

  final count = 0.obs;
  final currentIndex = 0.obs;
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
  selectModernDesign(){
    isModernDesignSelected.value=(!isModernDesignSelected.value);
  }

  onTapWhereWeGo(){
    Get.toNamed(Routes.SWAP_STAYS);
  }
  clickOnTravelPlan(){
    Get.toNamed(Routes.TRIP_REQUEST);
  }
}
