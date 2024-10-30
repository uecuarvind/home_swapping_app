import 'dart:io';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:home_swipping/app/routes/app_pages.dart';

class HighlightSelectEditController extends GetxController {
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

  onTapNext(){
    Get.toNamed(Routes.SHARE_SPACE_TAPE,arguments: selectFiles);
  }
}
