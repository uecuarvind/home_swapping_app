import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SpaceTapeEditController extends GetxController {
  List<File> selectFiles=Get.arguments;
  PageController pageController = PageController();

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

  void clickOnShareButton(){
 //   Get.toNamed(Routes.SHARE_SPACE_TAPE,arguments: selectFiles);
  }
}
