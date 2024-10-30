import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    splashDuration();
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

  splashDuration() {
    Future.delayed(const Duration(seconds: 2)).then((val) {
      Get.toNamed(Routes.GET_START);
    });
  }
}