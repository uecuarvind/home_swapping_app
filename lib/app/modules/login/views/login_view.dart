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
import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
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
                    Text(StringConstants.whatYourPhoneNumber,style: MyTextStyle.customStyle(
                        fontSize: 28.px,fontWeight: FontWeight.w600,fontFamily: 'Lora',color:primary3Color
                    ),textAlign: TextAlign.center,),
                    SizedBox(height: 20.px,),
                    Padding(
                      padding: EdgeInsets.only(left: 20.px,right: 30.px),
                      child: CommonWidgets.commonTextFieldForLoginSignUP(
                       // hintText: StringConstants.phoneNo,
                        controller: controller.phoneController,
                        autofocus: true,
                        isCard: true,
                        keyboardType: TextInputType.phone,
                        style: MyTextStyle.customStyle(fontWeight: FontWeight.w500,fontFamily: 'Lora',fontSize: 32,
                        color:primary3Color),
              
                        prefixIcon: Container(
                            // width: 100.px,
                            // height: 60.px,
                            constraints: BoxConstraints(maxWidth: 100.px,minWidth: 80.px),
                            margin: EdgeInsets.only(right: 2.px),
                            child: CommonWidgets.countryCodePicker(
                                onChanged: (value) => controller
                                    .clickOnCountryCode(value: value),
                                initialSelection:
                                controller.countryDailCode.value)),
                      ),
                    ),
                    SizedBox(height: 35.px,),
                    controller.isLoading.value?
                    Center(child: CupertinoActivityIndicator(color: primary3Color,radius: 15.px,)):
                    CommonWidgets.gradientButton(
                      onPressed: (){
                      if(controller.phoneController.text.isNotEmpty){

                        controller.clickOnContinueButton(context);
                      }else{
                        CommonWidgets.showSnackBar(context: context,message:'Please enter phone number...',status: false);
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
