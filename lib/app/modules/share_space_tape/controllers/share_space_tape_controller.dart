import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:home_swipping/app/routes/app_pages.dart';
import 'package:photo_manager/photo_manager.dart';

class ShareSpaceTapeController extends GetxController {
  //TODO: Implement ShareSpaceTapeController
   PageController pageController = PageController();
  List<File> selectFiles=Get.arguments;
   var currentIndex = 0.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    Timer.periodic(Duration(seconds:selectFiles.length ), (Timer timer) {
      while(currentIndex < selectFiles.length){
        if (currentIndex < selectFiles.length) {
          currentIndex++;
          pageController.animateToPage(
            currentIndex.value,
            duration: Duration(seconds:selectFiles.length),
            curve: Curves.easeIn,
          );
        } else {
          currentIndex.value = 0;
        }
      }
    });
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

  Future<void> main() async {
    final List<AssetEntity> entities = await PhotoManager.getAssetListPaged(
        page: 2, pageCount: selectFiles.length
    );
  }
  clickOnShareButton(){
    Get.toNamed(Routes.HOUSE_RULE);
  }
  clickOnEditButton(){
    Get.toNamed(Routes.EDIT_SHARE_SPACE_TAPE,arguments: selectFiles);
  }
}
