import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/api_constants/api_key_constants.dart';
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

  splashDuration() async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    Future.delayed(const Duration(seconds: 2)).then((val) {
      if(sharedPreferences.getString(ApiKeyConstants.token)!=null){
        Get.offNamed(Routes.EXPLORE);
       // Get.offNamed(Routes.VERIFICATION_CODE);
       // Get.toNamed(Routes.GET_START);
        //Get.offNamed(Routes.HIGHLIGHTE_REAL);
      }else{
        Get.toNamed(Routes.GET_START);
      }
    });
  }
}