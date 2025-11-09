import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:home_swipping/app/data/api_models/get_user_model.dart';
import 'package:home_swipping/app/routes/app_pages.dart';
import 'package:home_swipping/common/update_profile_detail.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/image_pick_and_crop.dart';
import '../../../data/api_constants/api_key_constants.dart';
import '../../../data/api_methods/api_methods.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';

class TravelerProfilePhotoController extends GetxController {
  List<Map<String,dynamic>> dreamList = [
    {
      'image':'assets/images/img_barcelona.png',
      'place':'Solo',
      'status':false
    },
    {
      'image':'assets/images/img_lisbon.png',
      'place':'Couple',
      'status':false
    },
    {
      'image':'assets/images/img_miami.png',
      'place':'baby friendly',
      'status':false
    },
    {
      'image':'assets/images/img_barcelona.png',
      'place':'family friendly',
      'status':false
    },
    {
      'image':'assets/images/img_lisbon.png',
      'place':'roommates',
      'status':false
    },
    {
      'image':'assets/images/img_miami.png',
      'place':'pet friendly',
      'status':false
    },
    {
      'image':'assets/images/img_lisbon.png',
      'place':'seasoned travelers',
      'status':false
    },
    {
      'image':'assets/images/img_miami.png',
      'place':'plant parent',
      'status':false
    }
  ];
  final profileImage = Rxn<File>();

  final count = 0.obs;
  final isLoading = false.obs;
  final tabIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
    checkSelectedPartnerShip();
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

  void checkSelectedPartnerShip(){
    for(int i=0;i<dreamList.length;i++){
      if(dreamList[i]['place']==UpdateProfileDetails.getUserModel?.user?.yourPartner){
        dreamList[i]['status']=true;
      }
    }
    increment();
  }

  void changeSelectedIndex(int index)async{
    await HapticFeedback.lightImpact();
    await Haptics.vibrate(HapticsType.light);
    dreamList[index]['status']=!(dreamList[index]['status']);
   // dreamList[index]['status']=!(dreamList[index]['status']);
    increment();
  }

  void clickOnContinueButton(BuildContext context){
    if(profileImage.value!=null){
      clickUploadButton(context);
    }else{
      tabIndex.value=1;
    }
  } 
  void clickOnExploreButton() async{
    await HapticFeedback.heavyImpact();
    await Haptics.vibrate(HapticsType.heavy);
   // UpdateProfileDetails.your_partner=dreamList[selectedIndex.value]['place'];
    Get.toNamed(Routes.TRAVELER_PROFILE_POD);
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
      backgroundColor: primary3Color.withOpacity(0.25),
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topRight: Radius.circular(35.px),topLeft: Radius.circular(15.px)),
      ),
      builder: (BuildContext context) {
        return Container(
          height: 300,
          padding: EdgeInsets.all(15.px),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Align(
                  alignment: Alignment.centerRight,
                  child:   GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                    child: const Icon(Icons.cancel_outlined,size: 30,color: primary3Color,),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(StringConstants.profilePhoto,style: MyTextStyle.customStyle(fontSize: 30,fontWeight: FontWeight.w600,
                        color: primary3Color,fontFamily: 'Lora'),),


                  ],
                ),
                Text(StringConstants.addPhotoPersonaliseYourProfile,style: MyTextStyle.customStyle(fontSize: 16,fontWeight: FontWeight.w400,
                    color: primary3Color,fontFamily: 'Lora'),),
                SizedBox(height: 10.px,),
                GestureDetector(
                  onTap: (){
                    Get.back();
                    pickCamera();
                  },
                  child: Container(
                    padding:  EdgeInsets.symmetric(horizontal: 20.px,vertical: 6.px),
                    decoration: BoxDecoration(
                      color: primary3Color.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(50.px),
                      border: Border.all(color: primary3Color.withOpacity(0.2),width: 1.px)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(StringConstants.takePicture,style: MyTextStyle.customStyle(fontSize: 18,fontWeight: FontWeight.w500,
                            color: primary3Color,fontFamily: 'Lora'),),
                        CommonWidgets.appImagesView(
                            imagePath: IconConstants.icCamera,
                            height: 50.px,width: 50.px
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 10.px,),
                GestureDetector(
                  onTap: (){
                    Get.back();
                    pickGallery();
                  },
                  child: Container(
                    padding:  EdgeInsets.symmetric(horizontal: 20.px,vertical: 6.px),
                    decoration: BoxDecoration(
                        color: primary3Color.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(50.px),
                        border: Border.all(color: primary3Color.withOpacity(0.2),width: 1.px)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(StringConstants.chooseExisting,style: MyTextStyle.customStyle(fontSize: 18,fontWeight: FontWeight.w500,
                            color: primary3Color,fontFamily: 'Lora'),),
                        CommonWidgets.appImagesView(
                            imagePath: IconConstants.icGallery,
                            height: 50.px,width: 50.px
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }


  void clickUploadButton(BuildContext context) async {
    try {
      Map<String, String> bodyParams = {
        ApiKeyConstants.name:UpdateProfileDetails.getUserModel?.user?.name??'' ,
      };
      isLoading.value = true;
      GetUserModel? getUserModel =
      await ApiMethods.updateUserProfileApi(
        bodyParams: bodyParams,
        image: profileImage.value,);
      if (getUserModel != null && getUserModel.success == true && getUserModel.user!=null) {
        isLoading.value = false;
        profileImage.value=null;
        UpdateProfileDetails.getUserModel=getUserModel;
        tabIndex.value=1;

        print('Successfully update profile .......');
      } else {
        print('failed api.......');
        CommonWidgets.showSnackBar(context: context,message:
            getUserModel!.message ?? 'Update Profile Failed...',status: false);
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      print('Error:-  ${e.toString()}');
      CommonWidgets.showSnackBar(context: context,message:'Some thing is wrong server issue...',status: false);
    }
  }
}
