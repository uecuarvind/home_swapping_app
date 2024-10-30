import 'package:get/get.dart';
import 'package:home_swipping/app/routes/app_pages.dart';

class EditMyProfileController extends GetxController {

  final count = 0.obs;

  List<Map<String,String>> travellerList = [
    {
      'image':'assets/images/img_traveler.png',
      'name':'James',
      'profile':'Traveler'
    },
    {
      'image':'assets/images/Img_partner.png',
      'name':'Paula',
      'profile':'Partner'
    },
    {
      'image':'assets/images/img_traveler.png',
      'name':'James',
      'profile':'Traveler'
    },
    {
      'image':'assets/images/Img_partner.png',
      'name':'Paula',
      'profile':'Partner'
    },
  ];

  List<Map<String,String>> dreamList = [
    {
      'image':'assets/images/img_barcelona.png',
      'place':'Barcelona'
    },
    {
      'image':'assets/images/img_lisbon.png',
      'place':'Lisbon'
    },
    {
      'image':'assets/images/img_miami.png',
      'place':'Miami'
    }
  ];
  List<String> travelInterest=['Adventure','Pizza','Music','Books','Mountain Hiking','Caving','Road Trip','Wildlife'];
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

  void clickOnAboutEditButton(){
    Get.toNamed(Routes.EDIT_ABOUT_ME);
  }
  void clickOnAboutPodButton(){
    Get.toNamed(Routes.EDIT_POD);
  }
  void clickOnTravelQuestionButton(){
    Get.toNamed(Routes.EDIT_TRAVEL_QUESTION);
  }
  void clickOnTravelInterestButton(){
    Get.toNamed(Routes.EDIT_TRAVEL_INTEREST);
  }
  void clickOnLanguageEditButton(){
    Get.toNamed(Routes.EDIT_LANGUAGE);
  }
  void clickOnDreamEditButton(){
    Get.toNamed(Routes.EDIT_DREAM_DESTINATIONS);
  }
  void clickOnFavoriteEditButton(){
    Get.toNamed(Routes.EDIT_FAVORITE_DESTINATIONS);
  }
}
