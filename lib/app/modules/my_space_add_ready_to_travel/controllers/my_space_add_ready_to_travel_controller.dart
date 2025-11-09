import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:home_swipping/app/data/api_models/my_house_model.dart';
import 'package:home_swipping/app/routes/app_pages.dart';
import 'package:home_swipping/common/update_house_details.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/api_constants/api_key_constants.dart';
import '../../../data/api_methods/api_methods.dart';

class MySpaceAddReadyToTravelController extends GetxController {
  //TODO: Implement MySpaceAddReadyToTravelController

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

  void clickOnTravelerProfileButton(){
  Get.toNamed(Routes.TRAVELER_PROFILE_PHOTO);
  }

  void clickOnLetsGoButton(BuildContext context) async {
    await HapticFeedback.heavyImpact();
    await Haptics.vibrate(HapticsType.heavy);
    try {
      Map<String, dynamic> bodyParams = {
        // ApiKeyConstants.houseId: UpdateHouseDetails.houseId,
        // ApiKeyConstants.city: UpdateHouseDetails.city,
        // ApiKeyConstants.rules: '',
        // ApiKeyConstants.features:jsonEncode(UpdateHouseDetails.features),
        // ApiKeyConstants.safetyItems: jsonEncode(UpdateHouseDetails.safetyItems),
        // ApiKeyConstants.spaceStyle:jsonEncode(UpdateHouseDetails.spaceStyle),
        // ApiKeyConstants.lat: UpdateHouseDetails.lat,
        // ApiKeyConstants.long: UpdateHouseDetails.long,
        // ApiKeyConstants.spaceQuestionAns: jsonEncode(UpdateHouseDetails.spaceQuestionAns),
        // ApiKeyConstants.relaxingFeatures: jsonEncode(UpdateHouseDetails.relaxingFeatures),
        // ApiKeyConstants.houseRules: jsonEncode(UpdateHouseDetails.houseRules),
        // ApiKeyConstants.homeCare: jsonEncode(UpdateHouseDetails.homeCare),
        // ApiKeyConstants.specificInstructions: UpdateHouseDetails.specificInstructions,
        // ApiKeyConstants.neighborhoodDetails:jsonEncode(UpdateHouseDetails.neighborhoodDetails),
        // ApiKeyConstants.description:UpdateHouseDetails.description,
        // ApiKeyConstants.sharingContext: UpdateHouseDetails.sharingContext,
        // ApiKeyConstants.moreAboutSpace: jsonEncode(UpdateHouseDetails.moreAboutSpace),
        ApiKeyConstants.houseId: UpdateHouseDetails.houseId,
        ApiKeyConstants.city: UpdateHouseDetails.city,
        ApiKeyConstants.country: UpdateHouseDetails.country,
        ApiKeyConstants.rules: '',
        ApiKeyConstants.features:UpdateHouseDetails.features,
        ApiKeyConstants.safetyItems: UpdateHouseDetails.safetyItems,
        ApiKeyConstants.spaceStyle:UpdateHouseDetails.spaceStyle,
        ApiKeyConstants.lat: UpdateHouseDetails.lat,
        ApiKeyConstants.long: UpdateHouseDetails.long,
        ApiKeyConstants.spaceQuestionAns: UpdateHouseDetails.spaceQuestionAns,
        ApiKeyConstants.relaxingFeatures: UpdateHouseDetails.relaxingFeatures,
        ApiKeyConstants.houseRules: UpdateHouseDetails.houseRules,
        ApiKeyConstants.homeCare: UpdateHouseDetails.homeCare,
        ApiKeyConstants.specificInstructions: UpdateHouseDetails.specificInstructions,
        ApiKeyConstants.neighborhoodDetails:UpdateHouseDetails.neighborhoodDetails,
        ApiKeyConstants.description:UpdateHouseDetails.description,
        ApiKeyConstants.sharingContext: UpdateHouseDetails.sharingContext,
        ApiKeyConstants.moreAboutSpace:UpdateHouseDetails.moreAboutSpace,
      };
      isLoading.value = true;
      MyHouseModel? myHouseModel =
      await ApiMethods.updateHousesDetailApi(bodyParams: bodyParams);
      if (myHouseModel != null && myHouseModel.success == true) {
        isLoading.value = false;
        CommonWidgets.showSnackBar(context: context,message:'Successfully updated your space...');
        print("Successfully update.......");
        UpdateHouseDetails.myHouseModel=myHouseModel;
        Get.toNamed(Routes.TRAVELER_PROFILE_CONGRATULATION);
      } else {
        print("Failed update.......");
        CommonWidgets.showSnackBar(context: context,message:'Failed updated your space...',status: false);
      }
      isLoading.value = false;
    }catch(e){
      isLoading.value = false;
      CommonWidgets.showSnackBar(context: context,message:'Some thing is wrong...',status: false);
    }
  }
}
