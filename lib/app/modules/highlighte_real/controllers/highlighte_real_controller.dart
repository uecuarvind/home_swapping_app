import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:home_swipping/app/routes/app_pages.dart';

import '../../../data/constants/image_constants.dart';

class HighlighteRealController extends GetxController {
  List<String> simpleImages=[ImageConstants.imgSampleVideo2,ImageConstants.imgSampleVideo3,
    ImageConstants.imgSampleVideo4,ImageConstants.imgSampleVideo5,ImageConstants.imgSampleVideo6,ImageConstants.imgSampleVideo7,
    ImageConstants.imgSampleVideo8,ImageConstants.imgSampleVideo9,ImageConstants.imgSampleVideo10,ImageConstants.imgSampleVideo11,
    ImageConstants.imgSampleVideo12,ImageConstants.imgSampleVideo13];
  CarouselController sliderController  = CarouselController();
  final count = 0.obs;
  final currentIndex = 0.obs;
  final autoPlay = false.obs;
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


  clickOnCreateSpaceTape() async{
    await HapticFeedback.lightImpact();
    await Haptics.vibrate(HapticsType.light);
    Get.toNamed(Routes.HIGHLIGHT_SELECT_MEDIA);
  }
  clickOnSampleVideo(){
    Get.toNamed(Routes.SAMPLE_VIDEO);
  }
}
