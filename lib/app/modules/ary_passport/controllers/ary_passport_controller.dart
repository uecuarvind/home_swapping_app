import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_swipping/app/data/constants/icons_constant.dart';
import 'package:home_swipping/app/routes/app_pages.dart';
import 'package:home_swipping/common/colors.dart';
import 'package:home_swipping/common/common_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/image_pick_and_crop.dart';
import '../../../data/constants/string_constants.dart';

class AryPassportController extends GetxController {
  final profileImage = Rxn<File>();

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

   clickOnContinueButton(){
     Get.toNamed(Routes.HIGHLIGHTE_REAL);
   }


  Future<void> pickCamera() async {
    profileImage.value = await ImagePickerAndCropper.pickImage(
      context: Get.context!,
      wantCropper: true,
      color: Theme.of(Get.context!).primaryColor,
    );
    increment();
  }

  Future<void> pickGallery() async {
    profileImage.value = await ImagePickerAndCropper.pickImage(
        context: Get.context!,
        wantCropper: true,
        color: Theme.of(Get.context!).primaryColor,
        pickImageFromGallery: true);

    increment();
  }


  openBottomSheet(){
    showModalBottomSheet(
      context: Get.context!,
      barrierColor: Colors.transparent.withOpacity(0.5),
      backgroundColor: primary3Color,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topRight: Radius.circular(15.px),topLeft: Radius.circular(15.px)),
      ),
      builder: (BuildContext context) {
        return Container(
          height: 300,
          padding: EdgeInsets.all(15.px),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(StringConstants.profilePhoto,style: MyTextStyle.customStyle(fontSize: 24,fontWeight: FontWeight.w700,
                      color: text2Color,fontFamily: 'Lora'),),
                  SizedBox(height: 5.px,),
                  GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                    child: const Icon(Icons.cancel_outlined,size: 30,color: text2Color,),
                  )
                ],
              ),
              Text(StringConstants.addPhotoPersonaliseYourProfile,style: MyTextStyle.customStyle(fontSize: 16,fontWeight: FontWeight.bold,
              color: text2Color,fontFamily: 'Lora'),),
              SizedBox(height: 10.px,),
              ListTile(
                onTap: (){
                  Get.back();
                  pickCamera();
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.px),
                  side: BorderSide(color: text2Color,width: 2.px)
                ),
                contentPadding: EdgeInsets.all(8.px),
                leading: CommonWidgets.appImagesView(
                    imagePath: IconConstants.icCamera,
                    height: 50.px,width: 50.px
                ),
                title:Text(StringConstants.takePicture,style: MyTextStyle.customStyle(fontSize: 16,fontWeight: FontWeight.bold,
                    color: text2Color,fontFamily: 'Lora'),) ,
              ),
              SizedBox(height: 10.px,),
              ListTile(
                onTap: (){
                  Get.back();
                  pickGallery();
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.px),
                    side: BorderSide(color: text2Color,width: 2.px)
                ),
                contentPadding: EdgeInsets.all(8.px),
                leading: CommonWidgets.appImagesView(
                    imagePath: IconConstants.icGallery,
                    height: 50.px,width: 50.px
                ),
                title:Text(StringConstants.chooseExisting,style: MyTextStyle.customStyle(fontSize: 16,fontWeight: FontWeight.bold,
                    color: text2Color,fontFamily: 'Lora'),) ,
              )
            ],
          ),
        );
      },
    );
  }
}
