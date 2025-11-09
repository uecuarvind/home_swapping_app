import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/api_constants/api_key_constants.dart';
import '../../../data/api_methods/api_methods.dart';
import '../../../data/api_models/login_model.dart';
import '../../../data/api_models/my_house_model.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class VerificationCodeController extends GetxController {
  TextEditingController otpController=TextEditingController();

  final count = 0.obs;
  final isLoading = false.obs;
  Map<String,String?> parameter=Get.parameters;
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



  clickOnContinueButton(BuildContext context) async{
    await HapticFeedback.heavyImpact();
    await Haptics.vibrate(HapticsType.heavy);
    try {
      Map<String, dynamic> bodyParams = {
        ApiKeyConstants.phone: parameter[ApiKeyConstants.phone]??'',
        ApiKeyConstants.otp: int.parse(otpController.text),
      };
      isLoading.value = true;
      UserModel? userModel =
      await ApiMethods.verifyOtpApi(bodyParams: bodyParams);
      if (userModel != null && userModel.success == true) {
        CommonWidgets.showSnackBar(context: context,message:userModel.message ?? '');
        if(userModel.user!=null && userModel.user!.name!=''){
          //saveDataSharedPreference(userModel,context);
          callingGetMyHouseApi(userModel,context);
        }else{
          Map<String,String> data={
            ApiKeyConstants.phone:parameter[ApiKeyConstants.phone]??'',
          };
          Get.toNamed(Routes.YOUR_NAME,parameters: data);
        }
      } else {
        CommonWidgets.showSnackBar(context: context,message:userModel!.message ?? '',status: false);
      }
      isLoading.value = false;
    }catch(e){
      isLoading.value = false;
      CommonWidgets.showSnackBar(context: context,message:'Some thing is wrong...',status: false);
    }
  }

  Future<void> callingGetMyHouseApi(UserModel userdata,BuildContext context) async {
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.setString(ApiKeyConstants.token, userdata.token.toString());
    sharedPreferences.setString(ApiKeyConstants.userId, userdata.user?.sId.toString()??'');

    try {
      MyHouseModel? myHouseModel =
      await ApiMethods.getMyHousesApi();
      if (myHouseModel != null && myHouseModel.success == true && myHouseModel.houseDetails!=null ) {
        print('house_id successfully......:-${myHouseModel.houseDetails?.sId}');
        print('house_id successfully......:-${userdata.user?.sId.toString()??''}');
        saveDataSharedPreference(userdata,context);
      } else {
        print('failed api.......');
        isLoading.value = true;
        Get.toNamed(Routes.HIGHLIGHTE_REAL,arguments: userdata);
      }

    } catch (e) {
      isLoading.value = true;
      print('Error:-  ${e.toString()}');
      CommonWidgets.showSnackBar(context: context,message:'Some thing is wrong server issue...',status: false);
    }
  }

  saveDataSharedPreference(UserModel userdata,BuildContext context) async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    CommonWidgets.showSnackBar(context: context,message:"Successfully Login Complete");
    String userDataString = jsonEncode(userdata);
    sharedPreferences.setString(StringConstants.userData, userDataString);
    sharedPreferences.setString(ApiKeyConstants.userId, userdata.user?.sId.toString()??'');
    sharedPreferences.setString(ApiKeyConstants.token, userdata.token.toString());
    sharedPreferences.setString(ApiKeyConstants.name,'${ userdata.user!.name.toString()} ');
    sharedPreferences.setString(ApiKeyConstants.profileImage, userdata.user!.profileimage.toString());
    print('Successfully complete.......${userdata.user?.sId.toString()??''}');
    CommonWidgets.showSnackBar(context: context,message:'Registration Successfully complete');
    isLoading.value = false;
    Get.offAllNamed(Routes.EXPLORE);
  }
}
