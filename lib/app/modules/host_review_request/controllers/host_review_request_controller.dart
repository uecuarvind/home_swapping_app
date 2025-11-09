import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/api_constants/api_key_constants.dart';
import '../../../data/api_methods/api_methods.dart';
import '../../../data/api_models/get_booking_model.dart';
import '../../../data/api_models/get_simple_response_model.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';
import '../../trips/controllers/trips_controller.dart';

class HostReviewRequestController extends GetxController {
  CarouselController sliderController  = CarouselController();
  final count = 0.obs;
  final currentIndex = 0.obs;
  final isLoading = false.obs;
  BookingRequests bookingRequests=Get.arguments;
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

  void clickOnViewProfile(){

  }


  void clickOnBackIcon(){
    Get.back();
  }
  void openTravellerProfile(){
    //Get.toNamed(Routes.PROFILE);
    Map<String,String> data={
      ApiKeyConstants.userId:bookingRequests.house?.houseOwner?.sId??''
    };
    Get.toNamed(Routes.HOUSE_OWNER_DETAILS,parameters: data);
  }
  //
  // void showAlertBox(BuildContext context) {
  //   showCupertinoDialog(
  //     context: context,
  //     barrierDismissible: true,
  //     builder: (BuildContext context) {
  //       return CupertinoAlertDialog(
  //         title: Text(StringConstants.request,style: MyTextStyle.titleStyle16bb,),
  //         content: Text(StringConstants.doYouWantToAcceptRequest,style: MyTextStyle.titleStyle14b,),
  //         actions: [
  //           CupertinoDialogAction(
  //             child:Text(StringConstants.no,style: MyTextStyle.titleStyle16bb,),
  //             onPressed: () {
  //               Get.back();
  //             },
  //           ),
  //           CupertinoDialogAction(
  //             child:Text(StringConstants.yes,style: MyTextStyle.titleStyle16bb,),
  //             isDestructiveAction: true, // Highlights this action in red
  //             onPressed: () {
  //
  //               clickOnSaveButton(context);
  //               Get.back();
  //
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }


  void clickOnSaveButton(BuildContext context) async {
    await HapticFeedback.heavyImpact();
    await Haptics.vibrate(HapticsType.heavy);
    try {
      Map<String, dynamic> bodyParams = {
        ApiKeyConstants.houseId: bookingRequests.house?.sId,
        ApiKeyConstants.bookingId: bookingRequests.sId,

      };
      isLoading.value = true;
      SimpleResponseModel? simpleResponseModel =
      await ApiMethods.acceptRequestApi(bodyParams: bodyParams);
      if (simpleResponseModel != null && simpleResponseModel.success == true) {
        isLoading.value = false;
        print("Booking accepted successfully.......");
        tripRequestChange.value=true;
        bookingRequests.status='Accepted';
        bookingRequests.isAccepted=true;

        Get.offNamed(Routes.BOOKED_DETAILS, arguments:bookingRequests);


      } else {
        print("Failed update.......");
        CommonWidgets.showSnackBar(context: context,message:'Failed updated your profile...',status: false);
      }
      isLoading.value = false;
    }catch(e){
      isLoading.value = false;
      CommonWidgets.showSnackBar(context: context,message:'Some thing is wrong...',status: false);
    }
    increment();
  }

}
