import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:home_swipping/app/data/api_models/get_simple_response_model.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/api_constants/api_key_constants.dart';
import '../../../data/api_methods/api_methods.dart';
import '../../../data/api_models/get_booking_model.dart';
import '../../../data/api_models/get_house_detail.dart';
import '../../../routes/app_pages.dart';

class SendSwapRequestingController extends GetxController {
Map<String,String?> parameter=Get.parameters;

  final count = 0.obs;
  final isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    sendSwapStayRequest(Get.context!);
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

  // void checkStatus(){
  //   Future.delayed(const Duration(seconds: 2)).then((val) {
  //     Get.toNamed(Routes.REVIEW_YOUR_SEND_REQUEST);
  //   });
  // }
  Future<void> sendSwapStayRequest(BuildContext context) async{
    try {
      Map<String,String> bodyParam={
        ApiKeyConstants.startDate:parameter[ApiKeyConstants.startDate]??'',
        ApiKeyConstants.endDate:parameter[ApiKeyConstants.endDate]??'',
        ApiKeyConstants.personalNote:parameter[ApiKeyConstants.personalNote]??'',
        ApiKeyConstants.lookingFor:parameter[ApiKeyConstants.lookingFor]??'',
      };
      GetBookingModel? houseDetailModel =
      await ApiMethods.sendStaySwapRequestApi(houseId:parameter[ApiKeyConstants.houseId]??'',bodyParams: bodyParam);
      if (houseDetailModel != null && houseDetailModel.success == true ) {
        isLoading.value = false;
        Map<String,String> data={
          ApiKeyConstants.type:'Request'
        };
        Get.offNamed(Routes.REVIEW_YOUR_SEND_REQUEST,arguments: houseDetailModel.data?.bookingRequests?[0],parameters: data);
       // Get.offNamedUntil(Routes.EXPLORE, (value)=>false);
        print('Successfully get:-${houseDetailModel.message}');
      } else {
        print("Failed update.......");
        CommonWidgets.showSnackBar(context: context,message:'Failed  house details...',status: false);
        Get.back();
      }
    }catch(e){
      isLoading.value = false;
      print("Error.......${e.toString()}");
      CommonWidgets.showSnackBar(context: context,message:'Some thing is wrong...',status: false);
      Get.back();
    }
    increment();
}
}
