import 'package:get/get.dart';
import 'package:home_swipping/app/data/api_constants/api_key_constants.dart';
import 'package:home_swipping/app/routes/app_pages.dart';

class EditPodController extends GetxController {

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
    Get.back(result: true);
  }
  void clickOnCross(int index){
    increment();
  }

  void clickOnAddTraveler() async{
    Map<String,String> data={
      ApiKeyConstants.other:'Yes'
    };
    dynamic result=await Get.toNamed(Routes.TRAVELER_PROFILE_POD,parameters: data);
    if(result!=null && result){
      increment();
    }
  }

}
