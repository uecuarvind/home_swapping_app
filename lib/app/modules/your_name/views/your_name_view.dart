import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/your_name_controller.dart';

class YourNameView extends GetView<YourNameController> {
  const YourNameView({super.key});
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
                  Text(StringConstants.whatYourName,style: MyTextStyle.customStyle(
                      fontSize: 28.px,fontWeight: FontWeight.w600,fontFamily: 'Lora',color:textHeading
                  ),textAlign: TextAlign.center,),
                  SizedBox(height: 20.px,),
                  Padding(
                    padding:EdgeInsets.only(left: 30.px,right: 30.px),
                    child: CommonWidgets.commonTextFieldForLoginSignUP(
                        //hintText: StringConstants.name ,
                        controller: controller.nameController,
                        keyboardType: TextInputType.text,
                        autofocus: true,
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
