import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:home_swipping/app/data/api_models/get_user_model.dart';
import 'package:home_swipping/app/routes/app_pages.dart';
import 'package:home_swipping/common/update_house_details.dart';
import 'package:home_swipping/common/update_profile_detail.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/api_constants/api_key_constants.dart';
import '../../../data/api_methods/api_methods.dart';

class TravelerProfileCompleteController extends GetxController {
  //TODO: Implement TravelerProfileCompleteController

  final count = 0.obs;
  final isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
   callingUpdateProfile(Get.context!);
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

  void clickOnSpaceProfileButton() async{
    await HapticFeedback.heavyImpact();
    await Haptics.vibrate(HapticsType.heavy);
    Get.offNamed(Routes.DECRIBE_YOUR_SPACE);
  }
  void clickOnExploreButton(){
    //Get.toNamed(Routes.TRAVELER_PROFILE_CONGRATULATION);
    Get.toNamed(Routes.PROFILE_PERCENTAGE );
  }

  void callingUpdateProfile(BuildContext context) async {
    try {
      Map<String, dynamic> bodyParams = {
        ApiKeyConstants.yourPartner: UpdateProfileDetails.your_partner,
        ApiKeyConstants.description: UpdateProfileDetails.description,
        ApiKeyConstants.spaceQuestionAns: UpdateProfileDetails.spaceQuestionAns,
        ApiKeyConstants.whatYouLove: UpdateProfileDetails.what_you_love,
        ApiKeyConstants.languages: UpdateProfileDetails.languages,
        ApiKeyConstants.favoritePlace: UpdateProfileDetails.favoritePlace,
        ApiKeyConstants.dreamPlace: UpdateProfileDetails.dreamPlace,

      };
      isLoading.value = true;
      GetUserModel? getUserModel =
      await ApiMethods.updateUserDetailApi(bodyParams: bodyParams);
      if (getUserModel != null && getUserModel.success == true) {
        isLoading.value = false;
        CommonWidgets.showSnackBar(context: context,message:'Successfully updated your profile...',status: true);
        print("Successfully update.......");
        UpdateProfileDetails.getUserModel=getUserModel;
      } else {
        print("Failed update.......");
        CommonWidgets.showSnackBar(context: context,message:'Failed updated your profile...',status: false);
      }
      isLoading.value = false;
    }catch(e){
      isLoading.value = false;
      CommonWidgets.showSnackBar(context: context,message:'Some thing is wrong...',status: false);
    }
  }
}
