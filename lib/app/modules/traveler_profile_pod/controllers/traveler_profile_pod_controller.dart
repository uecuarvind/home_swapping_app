import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_swipping/app/data/api_models/get_simple_response_model.dart';
import 'package:home_swipping/common/update_profile_detail.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/image_pick_and_crop.dart';
import '../../../data/api_constants/api_key_constants.dart';
import '../../../data/api_methods/api_methods.dart';
import '../../../data/api_models/get_user_model.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class TravelerProfilePodController extends GetxController {
  TextEditingController nameController=TextEditingController();
  final profileImage = Rxn<File>();
  final travelImage = Rxn<File>();

  final count = 0.obs;
  final tabIndex = 0.obs;
  final isLoading = false.obs;
  final selectedPodType = 'Partner'.obs;

  List<String> podTypeList=[
'Partner','Roommate','Child',
    'Teenager','Baby','Senior Citizen','Dog','Cat','Bunny',' + Add more'
  ];
  List<Partners> myPodList=[];
  Map<String,String?> parameters=Get.parameters;
  @override
  void onInit() {
    super.onInit();
    myPodList=UpdateProfileDetails.getUserModel?.user?.partners??[];
    increment();
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



  void clickOnContinueButton(){
    tabIndex.value=1;
  }
  void clickOnExploreButton(){
    Get.toNamed(Routes.TRAVELER_PROFILE_ABOUT_US);
  }

  void clickOnConfirmButton(){
    //tabIndex.value=2;
    Get.toNamed(Routes.TRAVELER_PROFILE_ABOUT_US);
  }
  void clickOnSaveButton(BuildContext context){
  // tabIndex.value=2;
    clickUploadButton(context);
  }

void changeSelectedPodType(String value){
    selectedPodType.value=value;
    increment();
}
  Future<void> pickCamera(int index) async {
    File? file = await ImagePickerAndCropper.pickImage(
      context: Get.context!,
      wantCropper: true,
      color: Theme.of(Get.context!).primaryColor,
    );
    if(index==0){
      profileImage.value=file;
    }else{
      travelImage.value=file;
    }
    increment();
  }

  Future<void> pickGallery(int index) async {
   File? file = await ImagePickerAndCropper.pickImage(
        context: Get.context!,
        wantCropper: true,
        color: Theme.of(Get.context!).primaryColor,
        pickImageFromGallery: true);
    if(index==0){
      profileImage.value=file;
    }else{
      travelImage.value=file;
    }

    increment();
  }




  void clickUploadButton(BuildContext context) async {
    try {
      Map<String, String> bodyParams = {
        ApiKeyConstants.name: nameController.text,
        ApiKeyConstants.relation: selectedPodType.value,
      };
      isLoading.value = true;
      SimpleResponseModel? simpleResponseModel =
      await ApiMethods.addTravelerPartnerApi(
        bodyParams: bodyParams,
        image: travelImage.value,);
      if (simpleResponseModel != null && simpleResponseModel.success == true) {
        travelImage.value=null;
        nameController.text='';
        callingGetUserApi(context);

        print('Successfully added partner details.......');
      } else {
        print('failed api.......');
        CommonWidgets.showSnackBar(context: context,message:
            simpleResponseModel!.message ?? 'Add Partner Failed...',status: false);
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      print('Error:-  ${e.toString()}');
      CommonWidgets.showSnackBar(context: context,message:'Some thing is wrong server issue...',status: false);
    }
  }



  void callingGetUserApi(BuildContext context) async {
    try {
      GetUserModel? getUserModel =
      await ApiMethods.getUserProfileApi();
      if (getUserModel != null && getUserModel.success == true  ) {
        print('successfully......');
        UpdateProfileDetails.getUserModel=getUserModel;
        isLoading.value = false;
        if(parameters[ApiKeyConstants.other]=='Yes'){
          Get.back(result: true);
        }else{
         // tabIndex.value=2;
          Get.toNamed(Routes.TRAVELER_PROFILE_ABOUT_US);
        }
      } else {
        print('failed api.......');
        CommonWidgets.showSnackBar(context: context,message:'Get User Profile Details Failed...',status: false);
        isLoading.value = true;
      }

    } catch (e) {
      isLoading.value = true;
      print('Error:-  ${e.toString()}');
      CommonWidgets.showSnackBar(context: context,message:'Some thing is wrong server issue...',status: false);
    }
  }


  openBottomSheet(int index){
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
                  pickCamera(index);
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
                  pickGallery(index);
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