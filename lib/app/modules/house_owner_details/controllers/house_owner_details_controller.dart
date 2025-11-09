import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_swipping/app/data/api_constants/api_key_constants.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/dream_list.dart';
import '../../../../common/languageList.dart';
import '../../../../common/update_profile_detail.dart';
import '../../../data/api_methods/api_methods.dart';
import '../../../data/api_models/get_user_model.dart';
import '../../../routes/app_pages.dart';

class HouseOwnerDetailsController extends GetxController {
  GetUserModel? houseOwnerDetail;
  final count = 0.obs;
  final isLoading = true.obs;
  List<Map<String,String>> favoriteThingsList = [
    {
      'name':'Adventure',
    },
    {
      'name':'Photography',
    },
    {
      'name':'Design',
    },{
      'name':'Shopping',
    },
    {
      'name':'Sustainability',
    },

  ];

  List<Map<String,dynamic>> languagelist = [];
  List<Map<String,dynamic>> dreamList = [];
  Map<String,String?>parameter=Get.parameters;



  @override
  void onInit() {
    super.onInit();
    callingGetHouseOwnerDetailApi(Get.context!);

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


  void callingGetHouseOwnerDetailApi(BuildContext context) async {
    try {
      GetUserModel? getUserModel =
      await ApiMethods.getHouseOwnerDetailsApi(userId: parameter[ApiKeyConstants.userId]??'');
      if (getUserModel != null && getUserModel.success == true  ) {
        print('successfully......');
        houseOwnerDetail=getUserModel;
        setLanguage();
        setDream();
        isLoading.value = false;
        increment();
      } else {
        print('failed api.......');
        CommonWidgets.showSnackBar(context: context,message:'Get User Profile Details Failed...',status: false);
      }
    } catch (e) {
      print('Error:-  ${e.toString()}');
      CommonWidgets.showSnackBar(context: context,message:'Some thing is wrong server issue...',status: false);
    }
  }

  void setLanguage(){
    for(int i=0;i<houseOwnerDetail!.user!.languages!.length;i++){
      Map<String,dynamic>? map=TotalLanguageList.checkLanguage(houseOwnerDetail!.user!.languages?[i]??'');
      if(map!=null){
        languagelist.add(map);
      }
    }
    increment();
  }

  void setDream(){
    for(int i=0;i<houseOwnerDetail!.user!.dreamPlace!.length;i++){
      Map<String,dynamic>? map=TotalDreamList.checkDream(houseOwnerDetail!.user!.dreamPlace?[i]??'');
      if(map!=null){
        dreamList.add(map);
      }
    }
    increment();
  }

  void clickOnConnectButton(){
   // Get.toNamed(Routes.MY_SPACE);
  }
}