import 'package:get/get.dart';

class EditPodController extends GetxController {
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

  final count = 0.obs;
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

  clickOnSaveButton(){
    Get.back();
  }
  void clickOnCross(int index){
    travellerList.removeAt(index);
    increment();
  }

}
