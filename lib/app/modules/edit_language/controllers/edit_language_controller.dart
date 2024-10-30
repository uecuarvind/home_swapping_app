import 'package:get/get.dart';

class EditLanguageController extends GetxController {
  List<String>languageList=['English','Bahasa Indonesia','French','German','Dutch','Italian','Portugese','Japanese','Hindi','Mandarin','Swedish',
  'Spanish','Portugese','+ Add Language'];
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
