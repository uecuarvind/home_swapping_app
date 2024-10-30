import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditTravelQuestionController extends GetxController {
  TextEditingController controller1=TextEditingController();
  TextEditingController controller2=TextEditingController();
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
    controller1.text='Being surrounded by loved ones and familiar faces.';
    controller2.text='Being surrounded by loved ones and familiar faces.';
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
