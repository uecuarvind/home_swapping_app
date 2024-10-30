import 'package:get/get.dart';

class EditTravelInterestController extends GetxController {
  List<String> travelInterest=['Adventure','Pizza','Music','Books','Mountain Hiking','Caving','Road Trip','Wildlife'];

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
}
