import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_swipping/app/data/api_models/get_simple_response_model.dart';
import 'package:home_swipping/app/data/constants/string_constants.dart';
import 'package:home_swipping/app/modules/nav_bar/controllers/nav_bar_controller.dart';
import 'package:home_swipping/common/MyTextStyle.dart';
import 'package:home_swipping/common/common_widgets.dart';

import '../../../data/api_constants/api_key_constants.dart';
import '../../../data/api_methods/api_methods.dart';
import '../../../data/api_models/get_booking_model.dart';
import '../../../routes/app_pages.dart';

class ReviewYourSendRequestController extends GetxController {
  CarouselController sliderController  = CarouselController();
  final count = 0.obs;
  final currentIndex = 0.obs;
  final isLoading = false.obs;
  Map<String,String?> parameter=Get.parameters;
  BookingRequests bookingRequests=Get.arguments;
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


void clickOnBackIcon(){
  if(parameter[ApiKeyConstants.type]=='Request'){
    navBarIndex.value=1;
    Get.offNamedUntil(Routes.EXPLORE, (routes)=>false);
  }else{
    Get.back();
  }
}

}
