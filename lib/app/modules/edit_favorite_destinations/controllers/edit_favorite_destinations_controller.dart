import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/dream_list.dart';
import '../../../../common/update_profile_detail.dart';
import '../../../data/api_constants/api_key_constants.dart';
import '../../../data/api_methods/api_methods.dart';
import '../../../data/api_models/get_user_model.dart';

class EditFavoriteDestinationsController extends GetxController {
  List<Map<String,dynamic>> favoriteList = [

  ];

  final count = 0.obs;
  final isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    favoriteList=TotalDreamList.dreamList;
    checkSelectedFavorites();
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

  void checkSelectedFavorites(){
    for(int i=0;i<favoriteList.length;i++){
      if(UpdateProfileDetails.getUserModel?.user?.favoritePlace?.contains(favoriteList[i]['place'])??false){
        favoriteList[i]['status']=true;
      }
    }
    increment();
  }

  void changeSelected(int index){
    favoriteList[index]['status']=!(favoriteList[index]['status']);
    increment();
  }

  List <String> clickOnContinueButton(){
    List<String> selectedList=[];
    for(int i=0;i<favoriteList.length;i++){
      if(favoriteList[i]['status']){
        selectedList.add(favoriteList[i]['place']);
      }
    }
    return selectedList;
  }

  void clickOnSaveButton(BuildContext context) async {
    try {
      Map<String, dynamic> bodyParams = {
        ApiKeyConstants.favoritePlace: clickOnContinueButton(),

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
