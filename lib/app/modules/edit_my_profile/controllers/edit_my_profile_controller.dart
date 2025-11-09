import 'package:get/get.dart';
import 'package:home_swipping/app/routes/app_pages.dart';
import 'package:home_swipping/common/common_widgets.dart';

import '../../../../common/dream_list.dart';
import '../../../../common/update_profile_detail.dart';

class EditMyProfileController extends GetxController {

  final count = 0.obs;


  List<Map<String,dynamic>> dreamList = [];
  List<Map<String,dynamic>> favoritesList = [];
  List<String> travelInterest=['Adventure','Pizza','Music','Books','Mountain Hiking','Caving','Road Trip','Wildlife'];
  @override
  void onInit() {
    super.onInit();
    setDream();
    setFavorites();
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
  void setDream(){
    dreamList.clear();
    for(int i=0;i<UpdateProfileDetails.getUserModel!.user!.dreamPlace!.length;i++){
      Map<String,dynamic>? map=TotalDreamList.checkDream(UpdateProfileDetails.getUserModel!.user!.dreamPlace?[i]??'');
      if(map!=null){
        dreamList.add(map);
      }
    }
    increment();
  }
  void setFavorites(){
    favoritesList.clear();
    for(int i=0;i<UpdateProfileDetails.getUserModel!.user!.favoritePlace!.length;i++){
      Map<String,dynamic>? map=TotalDreamList.checkDream(UpdateProfileDetails.getUserModel!.user!.favoritePlace?[i]??'');
      if(map!=null){
        favoritesList.add(map);
      }
    }
    increment();
  }

  void clickOnAboutEditButton() async{
    dynamic result=await Get.toNamed(Routes.EDIT_ABOUT_ME);
    if(result!=null && result){
      increment();
    }
  }
  void clickOnAboutPodButton() async{
   dynamic result=await Get.toNamed(Routes.EDIT_POD);
   if(result!=null && result){
     increment();
   }
  }
  void clickOnTravelQuestionButton() async{
    dynamic result= await Get.toNamed(Routes.EDIT_TRAVEL_QUESTION);
    if(result!=null && result){
      increment();
    }
  }
  void clickOnTravelInterestButton(){

    CommonWidgets.showSnackBar(message: 'ajfakkjdfakljfjkajk', context: Get.context!,status: false);
   // Get.toNamed(Routes.EDIT_TRAVEL_INTEREST);
  }
  void clickOnLanguageEditButton() async{
    dynamic result=await Get.toNamed(Routes.EDIT_LANGUAGE);
    if(result!=null && result){
      increment();
    }
  }
  void clickOnDreamEditButton() async{
    dynamic result=await Get.toNamed(Routes.EDIT_DREAM_DESTINATIONS);
    if(result!=null && result){
      onInit();
    }
  }
  void clickOnFavoriteEditButton() async{
    dynamic result=await Get.toNamed(Routes.EDIT_FAVORITE_DESTINATIONS);
    if(result!=null && result){
      onInit();
    }
  }
}
