import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:home_swipping/app/data/api_constants/api_key_constants.dart';
import 'package:home_swipping/common/common_widgets.dart';
import 'package:home_swipping/common/update_house_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../routes/app_pages.dart';

class DecribeYourSpaceController extends GetxController {
  //TODO: Implement DecribeYourSpaceController

  TextEditingController messageController = TextEditingController();
  FocusNode messageNode=FocusNode();
  final isMessage=false.obs;

  void startListing(){
    messageNode.addListener(changeFocus);
  }

  void changeFocus(){
    isMessage.value=messageNode.hasFocus;
  }
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    startListing();
    messageController.text=UpdateHouseDetails.myHouseModel?.houseDetails?.description??'';
    increment();
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
    if(messageController.text.isNotEmpty){
      UpdateHouseDetails.description=messageController.text;
      print("jkjkkjjkkk......${UpdateHouseDetails.description}");
      Get.toNamed(Routes.WANT_TO_SHARE_SPACE);
    }else{
      CommonWidgets.showSnackBar(context: context,message:'Please describe your space....',status: false);
    }
  }

  void clickOnSkip()async{
    SharedPreferences spr=await SharedPreferences.getInstance();
    print('token....${spr.getString(ApiKeyConstants.token)}');
    Get.toNamed(Routes.WANT_TO_SHARE_SPACE);
  }
}
