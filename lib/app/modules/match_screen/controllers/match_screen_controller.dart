import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:home_swipping/app/data/api_constants/api_key_constants.dart';
import 'package:home_swipping/app/data/api_models/get_house_detail.dart';
import 'package:home_swipping/app/data/constants/string_constants.dart';
import 'package:home_swipping/app/routes/app_pages.dart';
import 'package:intl/intl.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/api_methods/api_methods.dart';

class MatchScreenController extends GetxController {

  HouseDetails? houseDetails;
  CarouselController sliderController  = CarouselController();
  final count = 0.obs;
  final isLoading = true.obs;
  final currentIndex = 0.obs;
  Map<String,String?> parameter=Get.parameters;
  int swapIndex = -1;
  int stayIndex = -1;
  List<AvaibilityDates> availableSwapList=[];
  List<AvaibilityDates> availableStayList=[];
  List<String> interestList=[
    'Photography','Design','Sustainability','Adventure'
  ];
  @override
  void onInit() {
    super.onInit();
    callingHouseDetailApi(Get.context!);
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



  void clickOnSwapDate(int index){
      stayIndex=-1;
      swapIndex=index;
      increment();
  }
  void clickOnStayDate(int index){
      swapIndex=-1;
      stayIndex=index;
      increment();
  }

  void openTravellerProfile(){
    Map<String,String> data={
      ApiKeyConstants.userId:houseDetails?.houseOwner?.sId??''
    };
    Get.toNamed(Routes.HOUSE_OWNER_DETAILS,parameters: data);
  }


  void clickOnContinueButton(BuildContext context) async{
    Map<String,String>data={

    };
    if(swapIndex!=-1){
      data={
        ApiKeyConstants.type:StringConstants.swap,
        ApiKeyConstants.startDate:availableSwapList[swapIndex].startDate.toString().substring(0,10),
        ApiKeyConstants.endDate:availableSwapList[swapIndex].endDate.toString().substring(0,10),
      };
    }
    if(stayIndex!=-1){
    data={
    ApiKeyConstants.type:StringConstants.stay,
    ApiKeyConstants.startDate:availableStayList[stayIndex].startDate.toString().substring(0,10),
    ApiKeyConstants.endDate:availableStayList[stayIndex].endDate.toString().substring(0,10),
    };
    }
    if(houseDetails!=null){
      await HapticFeedback.heavyImpact();
      await Haptics.vibrate(HapticsType.heavy);
      Get.toNamed(Routes.SEND_SWAP_OFFER,arguments: houseDetails,parameters: data);
    }else{
      CommonWidgets.showSnackBar(context: context,message: 'Data is not present...');
    }
  }


  void callingHouseDetailApi(BuildContext context) async {
    availableStayList.clear();
    availableSwapList.clear();
    try {
      HouseDetailModel? houseDetailModel =
      await ApiMethods.houseDetailsApi(houseId:parameter[ApiKeyConstants.houseId]??'');
      if (houseDetailModel != null && houseDetailModel.success == true && houseDetailModel.houseDetails!=null) {
        houseDetails=houseDetailModel.houseDetails;
        if(houseDetails!.avaibilityDates!=null  && houseDetails!.avaibilityDates!.isNotEmpty){
          for(int i=0;i<houseDetails!.avaibilityDates!.length;i++){
          if(houseDetails!.avaibilityDates![i].availableFor=='Stay'){
            availableStayList.add(houseDetails!.avaibilityDates![i]);
          }else{
            availableSwapList.add(houseDetails!.avaibilityDates![i]);
          }
          }
        }
        isLoading.value = false;
         print('Successfully get:-${houseDetailModel.message}');
      } else {
        print("Failed update.......");
        CommonWidgets.showSnackBar(context: context,message:'Failed  house details...',status: false);
      }
      isLoading.value = false;
    }catch(e){
      isLoading.value = false;
      CommonWidgets.showSnackBar(context: context,message:'Some thing is wrong...',status: false);
    }
    increment();
  }
}
