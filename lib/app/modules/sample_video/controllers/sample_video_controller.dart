import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_swipping/app/data/constants/image_constants.dart';

class SampleVideoController extends GetxController {
  List<String> selectFiles=[ImageConstants.imgSampleVideo2,ImageConstants.imgSampleVideo3,
  ImageConstants.imgSampleVideo4,ImageConstants.imgSampleVideo5,ImageConstants.imgSampleVideo6,ImageConstants.imgSampleVideo7,
  ImageConstants.imgSampleVideo8,ImageConstants.imgSampleVideo9,ImageConstants.imgSampleVideo10,ImageConstants.imgSampleVideo11,
  ImageConstants.imgSampleVideo12,ImageConstants.imgSampleVideo13];
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
}
