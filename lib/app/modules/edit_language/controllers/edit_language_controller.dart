import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:home_swipping/common/languageList.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/update_profile_detail.dart';
import '../../../data/api_constants/api_key_constants.dart';
import '../../../data/api_methods/api_methods.dart';
import '../../../data/api_models/get_user_model.dart';

class EditLanguageController extends GetxController {

  List<Map<String,dynamic>>languageList=[];
  final count = 0.obs;
  final isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    languageList=TotalLanguageList.languageList;
    checkSelectedLanguages();
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
  void checkSelectedLanguages(){
    for(int i=0;i<languageList.length;i++){
      if(UpdateProfileDetails.getUserModel?.user?.languages?.contains(languageList[i]['name'])??false){
        languageList[i]['status']=true;
      }
    }
    increment();
  }

  void changeSelectLanguage(int index){
    languageList[index]['status']=!languageList[index]['status'];
    increment();
  }

  List<String> clickOnContinueButton(){
    List<String> selectedLanguageList=[];
    for(int i=0;i<languageList.length;i++){
      if(languageList[i]['status']){
        selectedLanguageList.add(languageList[i]['name']);
      }
    }
    return selectedLanguageList;
  }

  void clickOnSaveButton(BuildContext context) async {
    try {
      Map<String, dynamic> bodyParams = {
        ApiKeyConstants.languages: clickOnContinueButton(),

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
