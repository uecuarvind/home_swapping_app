import 'package:get/get.dart';

class EditDreamDestinationsController extends GetxController {
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
    },
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

  void clickOnSaveButton(){
    Get.back();
  }
}
