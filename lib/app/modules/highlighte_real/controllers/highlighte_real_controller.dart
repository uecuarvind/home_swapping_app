import 'package:get/get.dart';
import 'package:home_swipping/app/routes/app_pages.dart';

class HighlighteRealController extends GetxController {
  //TODO: Implement HighlighteRealController

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


  clickOnCreateSpaceTape(){
    Get.toNamed(Routes.HIGHLIGHT_SELECT_MEDIA);
  }
  clickOnSampleVideo(){
    Get.toNamed(Routes.SAMPLE_VIDEO);
  }
}
