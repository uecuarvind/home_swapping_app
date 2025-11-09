import 'package:get/get.dart';
import 'package:home_swipping/app/routes/app_pages.dart';

class GetStartController extends GetxController {
  //TODO: Implement GetStartController

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

  clickOnGetStartButton(){
    Get.toNamed(Routes.LOGIN);
  }

  goToNavBar(){
    Get.toNamed(Routes.EXPLORE);
  }
}
