import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class HouseRuleController extends GetxController {
  //TODO: Implement HouseRuleController


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

  onTapJoin(){
    Get.toNamed(Routes.WELCOME);
  }
}
