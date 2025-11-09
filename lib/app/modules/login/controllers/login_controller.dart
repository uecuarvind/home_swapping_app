import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:home_swipping/app/routes/app_pages.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/api_constants/api_key_constants.dart';
import '../../../data/api_methods/api_methods.dart';
import '../../../data/api_models/send_otp_model.dart';

class LoginController extends GetxController {
  TextEditingController phoneController=TextEditingController();
  FocusNode focusPhone = FocusNode();
  final isPhone = true.obs;
  final count = 0.obs;
  final isLoading = false.obs;
  final countryDailCode = '+91'.obs;
  void startListener() {
    focusPhone.addListener(onFocusChange);
  }
  void onFocusChange() {
    isPhone.value = focusPhone.hasFocus;
  }
  @override
  void onInit() {
    super.onInit();
    startListener();
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
  clickOnCountryCode({required CountryCode value}) {
    countryDailCode.value = value.dialCode.toString();
  }

  clickOnContinueButton(BuildContext context) async{
    await HapticFeedback.heavyImpact();
    await Haptics.vibrate(HapticsType.heavy);
    try {
      Map<String, String> bodyParams = {
        ApiKeyConstants.phone: phoneController.text,
        ApiKeyConstants.countryCode: countryDailCode.value,
      };
      isLoading.value = true;
      Send0tpModel? userModel =
      await ApiMethods.loginApi(bodyParams: bodyParams);
      if (userModel != null && userModel.success == true) {
        CommonWidgets.showSnackBar(context: context,message:userModel.message ?? '');
        Map<String,String> data={
          ApiKeyConstants.phone:phoneController.text
        };
        Get.toNamed(Routes.VERIFICATION_CODE,parameters: data);
      } else {
        CommonWidgets.showSnackBar(context: context,message:userModel!.message ?? '',status: false);
      }
      isLoading.value = false;
    }catch(e){
      isLoading.value = false;
      CommonWidgets.showSnackBar(context: context,message:'Some thing is wrong...',status: false);
    }
  }
}
