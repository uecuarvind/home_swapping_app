import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:home_swipping/app/routes/app_pages.dart';

import '../../../../common/image_pick_and_crop.dart';

class EditShareSpaceTapeController extends GetxController {
  List<File> selectFiles=Get.arguments;
  final count = 0.obs;
  final currentFile = 0.obs;
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

  void changeSelectedImageOrder(oldIndex,newIndex){
    final element = selectFiles.removeAt(oldIndex);
    selectFiles.insert(newIndex, element);
    increment();
  }

  void removeItem(int index){
    selectFiles.removeAt(index);
    increment();
  }

  clickOnShareButton()async{
    await HapticFeedback.lightImpact();
    await Haptics.vibrate(HapticsType.light);
   // Get.toNamed(Routes.HOUSE_RULE,arguments: selectFiles);
    Get.toNamed(Routes.SHARE_SPACE_TAPE,arguments: selectFiles);
  }

}
