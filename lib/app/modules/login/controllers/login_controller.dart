import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:home_swipping/app/routes/app_pages.dart';

class LoginController extends GetxController {
  TextEditingController phoneController=TextEditingController();
  FocusNode focusPhone = FocusNode();
  final isPhone = true.obs;
  final count = 0.obs;

  void startListener() {
    focusPhone.addListener(onFocusChange);
  }
  void onFocusChange() {
    isPhone.value = focusPhone.hasFocus;
  }
  @override
  void onInit() {
    super.onInit();
    startListener();
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


  clickOnContinueButton(){
    Get.toNamed(Routes.VERIFICATION_CODE);
  }
}
