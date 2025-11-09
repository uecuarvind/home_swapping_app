import 'package:get/get.dart';
import 'package:home_swipping/common/dream_list.dart';
import 'package:home_swipping/common/update_profile_detail.dart';

import '../../../../common/update_house_details.dart';
import '../../../routes/app_pages.dart';

class TravelerProfileDreamingGoController extends GetxController {
  List<Map<String,dynamic>> dreamList = [
  ];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    dreamList=TotalDreamList.dreamList;
    checkSelectedDreamGo();
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

  void checkSelectedDreamGo(){
    for(int i=0;i<dreamList.length;i++){
      if(UpdateProfileDetails.getUserModel?.user?.dreamPlace?.contains(dreamList[i]['place'])??false){
        dreamList[i]['status']=true;
      }
    }
    increment();
  }

  void changeSelected(int index){
    dreamList[index]['status']=!(dreamList[index]['status']);
    increment();
  }

  void clickOnContinueButton(){
    List<String> selectedList=[];
    for(int i=0;i<dreamList.length;i++){
      if(dreamList[i]['status']){
        selectedList.add(dreamList[i]['place']);
      }
    }
    UpdateProfileDetails.dreamPlace=selectedList;
    Get.toNamed(Routes.TRAVELER_PROFILE_COMPLETE);
  }
}
