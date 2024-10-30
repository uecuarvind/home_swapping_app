import 'dart:io';

import 'package:get/get.dart';
import 'package:home_swipping/app/routes/app_pages.dart';

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

  clickOnShareButton(){
    Get.toNamed(Routes.HOUSE_RULE);
  }
  onTapBack(){
    Get.toNamed(Routes.SHARE_SPACE_TAPE);
  }
}
