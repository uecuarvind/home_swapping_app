import 'dart:async';
import 'dart:io';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:home_swipping/app/routes/app_pages.dart';
import 'package:photo_manager/photo_manager.dart';

import '../../../../common/image_pick_and_crop.dart';

class ShareSpaceTapeController extends GetxController {
  CarouselController sliderController  = CarouselController();
  List<File> selectFiles=Get.arguments;
   var currentIndex = 0.obs;
  final autoPlay = false.obs;
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

   void changeSelectedImageOrder(oldIndex,newIndex){
     print('old:-$oldIndex, new :-$newIndex');
     final element = selectFiles.removeAt(oldIndex);
     selectFiles.insert(newIndex, element);
     increment();
   }

   Future<void> pickGallery() async {
     File? file = await ImagePickerAndCropper.pickImage(
         context: Get.context!,
         wantCropper: true,
         color: Theme.of(Get.context!).primaryColor,
         pickImageFromGallery: true);
     if(file!=null){
       selectFiles.add(file);
       increment();
     }


   }

  void clickOnShareButton()async{
    await HapticFeedback.lightImpact();
    await Haptics.vibrate(HapticsType.light);
    //Get.toNamed(Routes.HOUSE_RULE,arguments: selectFiles);
    Get.toNamed(Routes.HOUSE_RULE,arguments: selectFiles);
  }

}
