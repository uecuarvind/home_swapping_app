import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBarView(),
      body:Obx((){
        controller.count.value;
        return Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            padding: EdgeInsets.all(15.px),
            decoration: const BoxDecoration(
             color: backgroundColor
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(StringConstants.whatYourPhoneNumber,style: MyTextStyle.customStyle(
                      fontSize: 28.px,fontWeight: FontWeight.w600,fontFamily: 'Lora',color:textHeading
                  ),textAlign: TextAlign.center,),
                  SizedBox(height: 20.px,),
                  Padding(
                    padding: EdgeInsets.only(left: 30.px,right: 30.px),
                    child: CommonWidgets.commonTextFieldForLoginSignUP(
                     // hintText: StringConstants.phoneNo,
                      controller: controller.phoneController,
                      autofocus: true,
                      isCard: true,
                      keyboardType: TextInputType.phone,
                      style: MyTextStyle.titleStyle30blb
                    ),
                  ),
                  SizedBox(height: 25.px,),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.px)
                    ),
                    margin: EdgeInsets.only(left: 30.px,right: 30.px),
                    elevation: 10.px,
                    child: CommonWidgets.commonElevatedButton(
                      onPressed: (){
                      controller.clickOnContinueButton();
                      },

                      child: Text(StringConstants.continueText,style: MyTextStyle.customStyle(fontSize: 18,fontWeight: FontWeight.w700,
                      color: text2Color,fontFamily: 'Lora'),),
                      borderRadius: 25.px,
                      buttonColor: primary3Color,
                    ),
                  ),
                ],
              ),
            )

        );
      }),
    );
  }
}
