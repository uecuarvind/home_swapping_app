import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:get/get.dart';
import 'package:home_swipping/app/data/api_constants/api_key_constants.dart';
import 'package:home_swipping/app/data/api_models/get_all_house.dart';
import 'package:home_swipping/app/routes/app_pages.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/update_profile_detail.dart';
import '../../../data/api_methods/api_methods.dart';
import '../../../data/api_models/get_user_model.dart';

class ExploreController extends GetxController {
  List<SwipeItem> swipeItems = <SwipeItem>[];
  MatchEngine? matchEngine;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final CardSwiperController swiperController = CardSwiperController();
  final isModernDesignSelected = false.obs;
  final isEmptyItem = false.obs;
  List<String> horizontalList=[
    'Photography','Design','Adventure','Sustainability','Creative',
    'Remote Worker','Great workspace'
  ];
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

  List<Houses> houseList=[];

  List<Map<String,String>> inCommonList=[
    {
      'title':'Comfort',
      '1':'Bathtub',
      '2':'Hair Dryer',
      '3':'Fans',
      '4':'Drying Rack',
    },
    {
      'title':'Wellness',
      '1':'Treadmills',
      '2':'Free Weights',
      '3':'Sauna',
      '4':'Bicycles',
    },
    {
      'title':'Comfort',
      '1':'Bathtub',
      '2':'Hair Dryer',
      '3':'Fans',
      '4':'Drying Rack',
    },
    {
      'title':'Wellness',
      '1':'Treadmills',
      '2':'Free Weights',
      '3':'Sauna',
      '4':'Bicycles',
    }
  ];

  final count = 0.obs;
  final currentIndex = 0.obs;
  final currentHouseIndex = 0.obs;
  final isLoading = true.obs;
  // final showActionIcon = false.obs;
  // final rightLeftSwap = false.obs;
  @override
  void onInit() async{
    super.onInit();
    await callingGetAllHouseApi(Get.context!);
    callingGetUserApi(Get.context!);
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

  changeTabIndex(int index){
    switch(index){
      case 1:{
        Get.toNamed(Routes.TRIPS);
      }break;
      case 2:{
        Get.toNamed(Routes.PROFILE_SETTING);
      }break;
    }
  }

  // void showLikeUnlike(bool rightSwipe)async{
  //   rightLeftSwap.value=rightSwipe;
  //   showActionIcon.value=true;
  //   increment();
  //   await Future.delayed(const Duration(seconds: 1));
  //   showActionIcon.value=false;
  //   increment();
  // }


  void callingGetUserApi(BuildContext context) async {
    try {
      GetUserModel? getUserModel =
      await ApiMethods.getUserProfileApi();
      if (getUserModel != null && getUserModel.success == true  ) {
        print('successfully......');
        UpdateProfileDetails.getUserModel=getUserModel;
        isLoading.value = false;
      } else {
        print('failed api.......');
        CommonWidgets.showSnackBar(context: context,message:'Get User Profile Details Failed...',status: false);
      }
    } catch (e) {
      isLoading.value = true;
      print('Error:-  ${e.toString()}');
      CommonWidgets.showSnackBar(context: context,message:'Some thing is wrong server issue...',status: false);
    }
  }


  selectModernDesign(){
    isModernDesignSelected.value=(!isModernDesignSelected.value);
  }

  onTapWhereWeGo(){
    Get.toNamed(Routes.SWAP_STAYS);
  }
  clickOnTravelPlan(){
    Map<String,String> data={
      ApiKeyConstants.houseId:houseList[currentHouseIndex.value].sId??'',
      ApiKeyConstants.profileImage:houseList[currentHouseIndex.value].houseOwner?.image?.path??'',
    };
    Get.toNamed(Routes.TRIP_REQUEST,parameters: data);
  }
  
  void clickOnRobort(){
    Get.toNamed(Routes.SPPORT_TEAM);
  }

  void openTravellerProfile(){
    //Get.toNamed(Routes.PROFILE);
    Map<String,String> data={
      ApiKeyConstants.userId:houseList[currentHouseIndex.value].houseOwner?.sId??''
    };
    Get.toNamed(Routes.HOUSE_OWNER_DETAILS,parameters: data);
  }

  Future<void> callingGetAllHouseApi(BuildContext context) async {
    try {
      AllHouseModel? allHouseModel =
      await ApiMethods.getAllHousesApi();
      if (allHouseModel != null && allHouseModel.success == true && allHouseModel.houses!=null && allHouseModel.houses!.isNotEmpty) {
        houseList=allHouseModel.houses!;
        currentHouseIndex.value=0;
        setAllItem(context);
      } else {
        print('failed api.......');
        CommonWidgets.showSnackBar(context: context,message:
            allHouseModel!.message ?? 'Add House Failed...',status: false);
        isLoading.value = false;
      }

    } catch (e) {
      isLoading.value = false;
      print('Error:-  ${e.toString()}');
      CommonWidgets.showSnackBar(context: context,message:'Some thing is wrong server issue...',status: false);
    }
  }

  void setAllItem(BuildContext context) {
    for (int i = 0; i < houseList.length; i++) {
      swipeItems.add(
          SwipeItem(
          content: houseList[i],
          likeAction: () async{
            // showLikeUnlike(true);
            // await Future.delayed(const Duration(seconds: 1));
          // CommonWidgets.showSnackBar(context: context,message:'Liked...');
           Map<String,String> data={
             ApiKeyConstants.houseId:houseList[i].sId??''
           };
           Get.toNamed(Routes.FIRST_LIKE,parameters: data);
          },
          nopeAction: () {
            // showLikeUnlike(false);
           // CommonWidgets.showSnackBar(context: context,message:'Nope...');

          },
          superlikeAction: () {
           // CommonWidgets.showSnackBar(context: context,message:'Super Like...');
          },
          onSlideUpdate: (SlideRegion? region) async {
            print("Region $region");
          })
      );
    }
    matchEngine = MatchEngine(swipeItems: swipeItems);
    isLoading.value = false;
  }
}
