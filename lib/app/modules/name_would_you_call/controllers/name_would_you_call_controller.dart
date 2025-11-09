import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

import '../../../../common/common_widgets.dart';
import '../../../routes/app_pages.dart';

class NameWouldYouCallController extends GetxController {

  TextEditingController spaceNameController = TextEditingController();
  FocusNode spaceNameNode=FocusNode();
  final isSpaceName=false.obs;

  void startListing(){
    spaceNameNode.addListener(changeFocus);
  }

  void changeFocus(){
    isSpaceName.value=spaceNameNode.hasFocus;
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    startListing();
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

  void clickOnContinueButton(BuildContext context)async{
    await HapticFeedback.heavyImpact();
    await Haptics.vibrate(HapticsType.heavy);
    if(spaceNameController.text.isNotEmpty){
      Get.toNamed(Routes.DECRIBE_YOUR_SPACE);
    }else{
      CommonWidgets.showSnackBar(context: context,message:'Please describe your space....',status: false);
    }
  }
}
