import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:home_swipping/app/data/api_models/get_simple_response_model.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/api_constants/api_key_constants.dart';
import '../../../data/api_methods/api_methods.dart';
import '../../../routes/app_pages.dart';

class HouseRuleController extends GetxController {
  List<File> selectFiles=Get.arguments;
  final count = 0.obs;
  final isLoading = false.obs;
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



  void onTapJoin(BuildContext context) async{
    await HapticFeedback.lightImpact();
    await Haptics.vibrate(HapticsType.light);
    try {
      Map<String, String> bodyParams = {
        ApiKeyConstants.city:'London',
        ApiKeyConstants.rules:'["Respect someones home as you would your own."]',
      };
      isLoading.value = true;
      SimpleResponseModel? simpleResponseModel =
      await ApiMethods.addHouseApi(
        bodyParams: bodyParams,
        images:selectFiles,);
      if (simpleResponseModel != null && simpleResponseModel.success == true) {
        isLoading.value = false;
        print('Successfully add house.......');
        Get.toNamed(Routes.WELCOME);
      } else {
        print('failed api.......');
        CommonWidgets.showSnackBar(context: context,message:
            simpleResponseModel!.message ?? 'Add House Failed...',status: false);
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      print('Error:-  ${e.toString()}');
      CommonWidgets.showSnackBar(context: context,message:'Some thing is wrong server issue...',status: false);
    }
    increment();
  }
}
