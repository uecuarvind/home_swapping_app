import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:home_swipping/app/data/api_models/get_user_model.dart';
import 'package:home_swipping/app/data/api_models/my_house_model.dart';
import 'package:home_swipping/app/data/constants/icons_constant.dart';
import 'package:home_swipping/app/routes/app_pages.dart';
import 'package:home_swipping/common/common_widgets.dart';
import 'package:home_swipping/common/update_house_details.dart';
import 'package:home_swipping/common/update_profile_detail.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../data/api_methods/api_methods.dart';
import '../../../data/constants/string_constants.dart';

class ProfileSettingController extends GetxController {
  //TODO: Implement ProfileSettingController

  final count = 0.obs;
  final percentageProfile = 20.obs;
  final isLoading = true.obs;
  @override
  void onInit() async{
    super.onInit();
    await callingGetMyHouseApi(Get.context!);
    callingGetUserApi(Get.context!);
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
  onTapGoToProfile(){
    Get.toNamed(Routes.PROFILE);
  }

  clickOnMyTravelPlan(BuildContext context){
    if(!isLoading.value){
      Get.toNamed(Routes.MY_TRAVEL_PLAN);
    }else{
      CommonWidgets.showSnackBar(context: context,message:'Please waiting data is fetching...',status: false);
    }
  }
  clickOnMySpace(){
    Get.toNamed(Routes.MY_SPACE);
  }
  clickOnEditProfile(BuildContext context){
    if(UpdateProfileDetails.getUserModel!=null){
      Get.toNamed(Routes.EDIT_MY_PROFILE);
    }else{
      CommonWidgets.showSnackBar(context: context,message:'Data not fetched correctly please restart app..',status: false);
    }

  }
  clickOnContinueSpaceProfile(BuildContext context){
    if(!isLoading.value){
      //Get.toNamed(Routes.DECRIBE_YOUR_SPACE);
      Get.toNamed(Routes.NAME_WOULD_YOU_CALL);
    }else{
      CommonWidgets.showSnackBar(context: context,message:'Please waiting data is fetching...',status: false);
    }
  }
  void clickOnSettingIcon(){
    Get.toNamed(Routes.SETTING);
  }

  void clickOnCompleteTravelerProfile(BuildContext context){
    if(UpdateProfileDetails.getUserModel!=null){
      Get.toNamed(Routes.TRAVELER_PROFILE_PHOTO);
    }else{
      CommonWidgets.showSnackBar(context: context,message:'Data not fetched correctly please restart app..',status: false);
    }
  }
  void clickOn5Credits(){
    Get.toNamed(Routes.CREDITS);
  }
  void clickOnSpaceTape(){
   Get.toNamed(Routes.SPACE_TAPE);
    //CommonWidgets.showSnackBar(message: 'Arvind Kumar Gupta', context: Get.context!,status: false);
  }


  Future<void> callingGetMyHouseApi(BuildContext context) async {
    try {
      MyHouseModel? myHouseModel =
      await ApiMethods.getMyHousesApi();
      if (myHouseModel != null && myHouseModel.success == true && myHouseModel.houseDetails!=null ) {
         print('successfully......:-${myHouseModel.houseDetails?.sId}');
        UpdateHouseDetails.houseId=myHouseModel.houseDetails?.sId??'';
        UpdateHouseDetails.myHouseModel=myHouseModel;
         isLoading.value = false;
      } else {
        print('failed api.......');
        CommonWidgets.showSnackBar(context: context,message:'Get House Details Failed...',status: false);
        isLoading.value = true;
      }

    } catch (e) {
      isLoading.value = true;
      print('Error:-  ${e.toString()}');
      CommonWidgets.showSnackBar(context: context,message:'Some thing is wrong server issue...',status: false);
    }
  }

  void callingGetUserApi(BuildContext context) async {
    try {
      isLoading.value = true;
      GetUserModel? getUserModel =
      await ApiMethods.getUserProfileApi();
      if (getUserModel != null && getUserModel.success == true  ) {
        print('successfully......');
        UpdateProfileDetails.getUserModel=getUserModel;
        if(getUserModel.user!.spaceQuestionAns!=null){
          percentageProfile.value=percentageProfile.value+10;
        }
        if(getUserModel.user!.partners!=null){
          percentageProfile.value=percentageProfile.value+10;
        }
        if(getUserModel.user!.languages!=null){
          percentageProfile.value=percentageProfile.value+10;
        }
        if(getUserModel.user!.favoritePlace!=null){
          percentageProfile.value=percentageProfile.value+10;
        }
        if(getUserModel.user!.dreamPlace!=null){
          percentageProfile.value=percentageProfile.value+10;
        }
        if(getUserModel.user!.whatYouLove!=null){
          percentageProfile.value=percentageProfile.value+10;
        }
        if(getUserModel.user!.profileimage!=null){
          percentageProfile.value=percentageProfile.value+5;
        }
        if(getUserModel.user!.description!=null){
          percentageProfile.value=percentageProfile.value+5;
        }

        isLoading.value = false;
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

}
