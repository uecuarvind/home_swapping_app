import 'package:get/get.dart';
import 'package:home_swipping/app/routes/app_pages.dart';

class ThatItController extends GetxController {
  //TODO: Implement ThatItController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    pageDuration();
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

  void pageDuration(){
    Future.delayed(const Duration(seconds: 5)).then((val) {
      Get.offNamed(Routes.TRAVELER_PROFILE_COMPLETE);
    });
    }

}
