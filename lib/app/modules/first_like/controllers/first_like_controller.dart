import 'package:get/get.dart';
import 'package:home_swipping/app/routes/app_pages.dart';

import '../../../data/api_constants/api_key_constants.dart';

class FirstLikeController extends GetxController {
  Map<String,String?>parameter=Get.parameters;

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

  void clickOnEnableNotification(){
    Map<String,String> data={
      ApiKeyConstants.houseId:parameter[ApiKeyConstants.houseId]??''
    };
    Get.toNamed(Routes.MATCH_SCREEN,parameters: data);

  }
  void clickOnMayBeLater(){
    Map<String,String> data={
      ApiKeyConstants.houseId:parameter[ApiKeyConstants.houseId]??''
    };
    Get.toNamed(Routes.MATCH_SCREEN,parameters: data);
  }
}
