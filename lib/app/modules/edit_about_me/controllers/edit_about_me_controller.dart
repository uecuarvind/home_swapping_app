import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditAboutMeController extends GetxController {
  TextEditingController aboutMeController=TextEditingController();
  FocusNode focusAboutMe = FocusNode();
  final isAboutMe = true.obs;
  final count = 0.obs;

  void startListener() {
    focusAboutMe.addListener(onFocusChange);
  }
  void onFocusChange() {
    isAboutMe.value = focusAboutMe.hasFocus;
  }
  @override
  void onInit() {
    super.onInit();
    startListener();
    aboutMeController.text='I live in New York. I like travelling, discover new culture and traditions, taste new food. I love meeting my guests and sharing my local...';
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

  clickOnSaveButton(){
   Get.back();
  }
}
