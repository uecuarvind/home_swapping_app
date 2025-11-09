import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/verification_code_controller.dart';

class VerificationCodeView extends GetView<VerificationCodeController> {
  const VerificationCodeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body:Obx((){
        controller.count.value;
        return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImageConstants.imgExploreBackground),
                    fit: BoxFit.fill
                )
            ),
            child: SafeArea(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 15.px),
                            child: CommonWidgets.appImagesView(
                              imagePath: IconConstants.icBack,height: 35.px,width: 35.px,
                            ),
                          )
                      ),
                    ),
                    SizedBox(height: 150.px,),
                    Text(StringConstants.enterYourVerificationCode,style: MyTextStyle.customStyle(
                        fontSize: 28.px,fontWeight: FontWeight.w600,fontFamily: 'Lora',color:primary3Color
                    ),textAlign: TextAlign.center,),
                    SizedBox(height: 20.px,),
                    // Padding(
                    //   padding: EdgeInsets.only(left: 30.px,right: 30.px),
                    //   child: CommonWidgets.commonTextFieldForLoginSignUP(
                    //      // hintText: StringConstants.otp ,
                    //       controller: controller.otpController,
                    //       autofocus: true,
                    //       keyboardType: TextInputType.number,
                    //       style: MyTextStyle.customStyle(fontWeight: FontWeight.w500,fontFamily: 'Lora',fontSize: 32,
                    //           color: primary3Color)
                    //   ),
                    // ),
                    Padding(
                      padding: EdgeInsets.only(left: 30.px,right: 30.px),
                      child: CommonWidgets.commonOtpView(
                        // hintText: StringConstants.otp ,
                        autoFocus: true,
                          controller: controller.otpController,
                          width: 60.px, height: 70.px,
                          enablePinAutofill:true
                      ),
                    ),
                    SizedBox(height: 50.px,),
                    controller.isLoading.value?
                    Center(child: CupertinoActivityIndicator(color: primary3Color,radius: 15.px,)):
                    CommonWidgets.gradientButton(
                        onPressed: (){
                          if(controller.otpController.text.isNotEmpty){
                            controller.clickOnContinueButton(context);
                          }else{
                            CommonWidgets.showSnackBar(context: context,message:'Please enter OTP...',status: false);
                          }
                        },
                        text: StringConstants.continueText,
                    ),
              
                  ],
                ),
              ),
            )

        );
      }),
    );
  }
}
