

import 'package:get/get.dart';

class LocalUserData extends GetxController{
  final userId=''.obs;
   final userName=''.obs;
   final userImage=''.obs;
   final userEmail=''.obs;
   final userPhone=''.obs;
   final userAddress=''.obs;
   final loginTypeUser=true.obs;

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

  setUserName(String name){
    userName.value=name;
  }

  /*setUserData(UserData userData){
    userId.value=userData.id??'';
    userName.value='${userData.firstName} ${userData.lastName}';
    userImage.value=userData.image??'';
    userEmail.value=userData.email??'';
    userPhone.value=userData.mobile??'';
    userAddress.value=userData.address??'';
    loginTypeUser.value=userData.type=='User'?true:false;
  }  */

}
