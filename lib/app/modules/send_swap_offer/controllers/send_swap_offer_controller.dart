import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:home_swipping/app/data/api_constants/api_key_constants.dart';
import 'package:home_swipping/app/data/constants/string_constants.dart';
import 'package:home_swipping/app/routes/app_pages.dart';
import 'package:home_swipping/common/common_widgets.dart';
import 'package:intl/intl.dart';

import '../../../data/api_models/get_house_detail.dart';

class SendSwapOfferController extends GetxController {
  TextEditingController aboutMeController=TextEditingController();
  FocusNode focusNodeAboutMe=FocusNode();
  CarouselController sliderController  = CarouselController();
  HouseDetails houseDetails=Get.arguments;
  Map<String,String?> parameter=Get.parameters;
  String startDate='';
  String endDate='';
  final count = 0.obs;
  final tabIndex=0.obs;
  final currentIndex = 0.obs;
  final isAboutMe = false.obs;
  void startListener(){
    focusNodeAboutMe.addListener(onFocusChange);
  }
  void onFocusChange(){
    isAboutMe.value=focusNodeAboutMe.hasFocus;
  }
  @override
  void onInit() {
    super.onInit();
    startListener();
    startDate=parameter[ApiKeyConstants.startDate]??'';
    endDate=parameter[ApiKeyConstants.endDate]??'';
    if(parameter[ApiKeyConstants.type]==StringConstants.stay){
      tabIndex.value=1;
    }
    increment();
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
    tabIndex.value=index;
  }


  void clickOnEditButton()async{
    Map<String,String> data={
      ApiKeyConstants.from:'StaySwap'
    };
   dynamic result=await Get.toNamed(Routes.TRIP_REQUEST,parameters: data);
   if(result!=null){
     startDate=result[ApiKeyConstants.startDate]??'';
     endDate=result[ApiKeyConstants.endDate]??'';
     print("Result:${result.toString()}");
   }
   increment();
  }

  void clickOnSendOfferButton(BuildContext context) async{
    FocusManager.instance.primaryFocus?.unfocus();
    await HapticFeedback.heavyImpact();
    await Haptics.vibrate(HapticsType.heavy);
    if(aboutMeController.text.isNotEmpty){
      Map<String,String> data={
        ApiKeyConstants.houseId:houseDetails.sId??'',
        ApiKeyConstants.startDate:startDate.toString(),
        ApiKeyConstants.endDate:endDate.toString(),
        ApiKeyConstants.personalNote:aboutMeController.text.toString(),
        ApiKeyConstants.lookingFor:tabIndex.value==0?'Swap':'Stay',

      };
      Get.toNamed(Routes.SEND_SWAP_REQUESTING,parameters: data);
    }else{
      CommonWidgets.showSnackBar(message: 'Please enter personal note...', context: context,status: false);
    }

  }
}
