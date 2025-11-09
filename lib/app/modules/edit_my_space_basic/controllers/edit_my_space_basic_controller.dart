import 'package:get/get.dart';

class EditMySpaceBasicController extends GetxController {
  //TODO: Implement EditMySpaceBasicController

  final count = 0.obs;
  final guestNumber = 0.obs;
  final bedRoomsNumber = 0.obs;
  final bedNumber = 0.obs;
  final bathRoomNumber = 0.obs;
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



  void increaseNumber(int index){
    switch(index){
      case 0:{
        guestNumber.value++;
        break;
      }
    case 1:{
      bedRoomsNumber.value++;
    break;
    }
    case 2:{
    bedNumber.value++;
    break;
    }
    case 3:{
      bathRoomNumber.value++;
    break;
    }
    }
  }
  void decreaseNumber(int index){
    switch(index){
      case 0:{
        guestNumber.value--;
        break;
      }
      case 1:{
        bedRoomsNumber.value--;
        break;
      }
      case 2:{
        bedNumber.value--;
        break;
      }
      case 3:{
        bathRoomNumber.value--;
        break;
      }
    }
  }


  void clickOnSaveButton(){
    Get.back();
  }
}
