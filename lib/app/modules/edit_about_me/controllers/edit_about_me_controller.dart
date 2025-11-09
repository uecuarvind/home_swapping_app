import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_swipping/common/update_profile_detail.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/api_constants/api_key_constants.dart';
import '../../../data/api_methods/api_methods.dart';
import '../../../data/api_models/get_user_model.dart';

class EditAboutMeController extends GetxController {
  TextEditingController aboutMeController=TextEditingController();
  FocusNode focusAboutMe = FocusNode();
  final isAboutMe = true.obs;
  final count = 0.obs;
  final isLoading = false.obs;

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
    aboutMeController.text=UpdateProfileDetails.getUserModel?.user?.description??'';
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



  void clickOnSaveButton(BuildContext context) async {
    try {
      Map<String, dynamic> bodyParams = {
        ApiKeyConstants.description: aboutMeController.text.toString()

      };
      isLoading.value = true;
      GetUserModel? getUserModel =
      await ApiMethods.updateUserDetailApi(bodyParams: bodyParams);
      if (getUserModel != null && getUserModel.success == true) {
        isLoading.value = false;
        CommonWidgets.showSnackBar(context: context,message:'Successfully updated your profile...');
        print("Successfully update.......");
        UpdateProfileDetails.getUserModel=getUserModel;
        Get.back(result: true);
      } else {
        print("Failed update.......");
        CommonWidgets.showSnackBar(context: context,message:'Failed updated your profile...',status: false);
      }
      isLoading.value = false;
    }catch(e){
      isLoading.value = false;
      CommonWidgets.showSnackBar(context: context,message:'Some thing is wrong...',status: false);
    }
  }
}
