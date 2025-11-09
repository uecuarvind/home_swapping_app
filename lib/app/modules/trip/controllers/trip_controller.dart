import 'package:get/get.dart';

import '../../../data/api_constants/api_key_constants.dart';
import '../../../data/api_models/get_booking_model.dart';
import '../../../routes/app_pages.dart';

class TripController extends GetxController {
  List<BookingRequests> bookedList=Get.arguments;

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


  void clickOnBookedUser(int index){
    Map<String,String> data={
      ApiKeyConstants.type:'Booked'
    };
    Get.offNamed(Routes.BOOKED_DETAILS, arguments: bookedList[index],parameters: data);
  }
}
