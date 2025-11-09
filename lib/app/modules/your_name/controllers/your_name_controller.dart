import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:home_swipping/app/data/api_constants/api_key_constants.dart';
import 'package:home_swipping/common/common_widgets.dart';

import '../../../routes/app_pages.dart';

class YourNameController extends GetxController {
  TextEditingController nameController=TextEditingController();
 Map<String,String?> parameter=Get.parameters;
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

  clickOnContinueButton(BuildContext context)async{
    await HapticFeedback.heavyImpact();
    await Haptics.vibrate(HapticsType.heavy);
  if(nameController.text.isNotEmpty){
    Map<String,String> data={
      ApiKeyConstants.phone:parameter[ApiKeyConstants.phone]??'',
      ApiKeyConstants.name:nameController.text,
    };
    Get.toNamed(Routes.ARY_PASSPORT,parameters: data);
  }else{
    CommonWidgets.showSnackBar(context: context,message:'Please enter name...');
  }
  }
}