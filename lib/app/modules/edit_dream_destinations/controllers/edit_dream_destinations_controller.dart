import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:home_swipping/common/dream_list.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/update_profile_detail.dart';
import '../../../data/api_constants/api_key_constants.dart';
import '../../../data/api_methods/api_methods.dart';
import '../../../data/api_models/get_user_model.dart';

class EditDreamDestinationsController extends GetxController {
  List<Map<String,dynamic>> dreamList = [

  ];

  final count = 0.obs;
  final isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    dreamList=TotalDreamList.dreamList;
    checkSelectedDreamGo();
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
  void checkSelectedDreamGo(){
    for(int i=0;i<dreamList.length;i++){
      if(UpdateProfileDetails.getUserModel?.user?.dreamPlace?.contains(dreamList[i]['place'])??false){
        dreamList[i]['status']=true;
      }
    }
    increment();
  }

  void changeSelected(int index){
    dreamList[index]['status']=!(dreamList[index]['status']);
    increment();
  }

  List <String> clickOnContinueButton(){
    List<String> selectedList=[];
    for(int i=0;i<dreamList.length;i++){
      if(dreamList[i]['status']){
        selectedList.add(dreamList[i]['place']);
      }
    }
    return selectedList;
  }

  void clickOnSaveButton(BuildContext context) async {
    try {
      Map<String, dynamic> bodyParams = {
        ApiKeyConstants.dreamPlace: clickOnContinueButton(),

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
