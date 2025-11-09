import 'package:get/get.dart';
import 'package:home_swipping/app/routes/app_pages.dart';

import '../../../data/api_models/get_booking_model.dart';

class RequestAcceptController extends GetxController {
  BookingRequests bookingRequests=Get.arguments;

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
  
  void clickOnTripDetailButton(){
    Get.toNamed(Routes.REQUEST_DETAILS,arguments: bookingRequests);
  }
}
