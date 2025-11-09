import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

import '../../../data/api_constants/api_key_constants.dart';
import '../../../data/api_models/get_booking_model.dart';
import '../../../routes/app_pages.dart';

class BookedDetailsController extends GetxController {
  CarouselController sliderController  = CarouselController();

  BookingRequests bookingRequests=Get.arguments;
  final count = 0.obs;
  final currentIndex = 0.obs;
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
  void clickOnBackIcon(){
    Get.back();
  }


  void clickOnMessageIcon(){
    Map<String,String> data={
      ApiKeyConstants.type:'Booked'
    };
    Get.toNamed(Routes.REQUEST_CHAT,arguments: bookingRequests,parameters: data);
  }
}