import 'package:get/get.dart';
import 'package:home_swipping/app/routes/app_pages.dart';
import 'package:home_swipping/common/dream_list.dart';
import 'package:home_swipping/common/languageList.dart';
import 'package:home_swipping/common/update_profile_detail.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController

  final count = 0.obs;
  List<Map<String,String>> favoriteThingsList = [
    {
      'name':'🪂 Adventure',
    },
    {
      'name':'📷 Photography',
    },
    {
      'name':'Design',
    },{
      'name':'👜 Shopping',
    },

  ];

  List<Map<String,dynamic>> languagelist = [];
  List<Map<String,dynamic>> dreamList = [];



  @override
  void onInit() {
    super.onInit();
    setLanguage();
    setDream();
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

  void setLanguage(){
    for(int i=0;i<UpdateProfileDetails.getUserModel!.user!.languages!.length;i++){
      Map<String,dynamic>? map=TotalLanguageList.checkLanguage(UpdateProfileDetails.getUserModel!.user!.languages?[i]??'');
      if(map!=null){
        languagelist.add(map);
      }
    }
    increment();
  }

  void setDream(){
    for(int i=0;i<UpdateProfileDetails.getUserModel!.user!.dreamPlace!.length;i++){
      Map<String,dynamic>? map=TotalDreamList.checkDream(UpdateProfileDetails.getUserModel!.user!.dreamPlace?[i]??'');
      if(map!=null){
        dreamList.add(map);
      }
    }
    increment();
  }

  void clickOnConnectButton(){
   Get.toNamed(Routes.MY_SPACE);
  }
}
