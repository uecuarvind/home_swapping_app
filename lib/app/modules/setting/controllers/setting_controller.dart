import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class SettingController extends GetxController {
  TextEditingController messageController=TextEditingController();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    messageController.text='Share anything you want to experience as a traveler or host. Our home is only as strong as the people in it too.';
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

  void clickOnLogout() async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.clear();
    Get.offAllNamed(Routes.SPLASH);
  }

  void openBottomSheetFeedback(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: primary3Color,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              height: 500,
              margin: EdgeInsets.all(20.px),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.cancel_outlined,size: 25.px,color: Colors.black87,),
                    ),
                  ),
                  Text(StringConstants.howHasYourHomeSharingExperience,style: MyTextStyle.customStyle(color: text2Color,
                      fontWeight: FontWeight.w700,fontSize: 20,fontFamily: 'Lora',
                  ),textAlign: TextAlign.center,),
                  SizedBox(height: 20.px,),
                  CommonWidgets.appImagesView(
                      imagePath: IconConstants.icHouseRules,
                      height: 120.px,
                      width: 120.px,
                      fit: BoxFit.cover),
                  Container(
                      padding: EdgeInsets.all(12.px),
                      margin: EdgeInsets.only(top: 20.px),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.px),
                          border: Border.all(width: 2.px,color: textGrey),
                          color: primary3Color
                      ),
                      child:TextField(
                        controller: messageController,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        style: MyTextStyle.customStyle(
                            fontFamily: "Buenard",fontWeight: FontWeight.w700,fontSize: 16,color: textGrey
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Enter Answer',
                          disabledBorder: InputBorder.none,
                          border: InputBorder.none,
                          enabledBorder:InputBorder.none,
                        ),
                      )
                  ),

                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.px),
                      border: Border.all(color: textGolden,width: 2.px)
                    ),
                    margin: EdgeInsets.only(top: 20.px),

                    child: CommonWidgets.commonElevatedButton(
                      onPressed: (){
                       Get.back();
                      },

                      child: Text(StringConstants.share,style: MyTextStyle.customStyle(fontSize: 18,fontWeight: FontWeight.w700,
                          color: textGolden,fontFamily: 'Lora'),),
                      borderRadius: 25.px,
                      buttonColor: primary3Color,
                    ),
                  ),

                ],
              ),
            );
          },
        );
      },
    );
  }
}
