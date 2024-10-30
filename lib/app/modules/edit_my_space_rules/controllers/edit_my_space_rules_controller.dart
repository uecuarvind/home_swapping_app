import 'package:get/get.dart';

class EditMySpaceRulesController extends GetxController {
  List<Map<String,dynamic>> rulesList=[
    {
      'title':'No Smoking',
      'status':false
    },
    {
      'title':'No Pets',
      'status':false
    },
    {
      'title':'No Parties',
      'status':true
    }
    , {
      'title':'No shoes inside',
      'status':false
    },
    {
      'title':'No children',
      'status':false
    }
  ];

  final count = 0.obs;
  final checkBoxValue = false.obs;
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

  void changeValue(int index,bool value){
    rulesList[index]['status']=value;
    increment();
  }

  void clickOnSaveButton(){
    Get.back();
  }
}
