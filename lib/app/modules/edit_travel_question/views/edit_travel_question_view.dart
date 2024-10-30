import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/edit_travel_question_controller.dart';

class EditTravelQuestionView extends GetView<EditTravelQuestionController> {
  const EditTravelQuestionView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBarView(title: StringConstants.editTravelQuestion),
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      body:Obx((){
        controller.count.value;
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
           Text('What makes you feel home in your city?',style: MyTextStyle.customStyle(fontSize: 16,fontWeight: FontWeight.w700,fontFamily: 'Lora',color:const Color(0xFF606060)),),

            Container(
              padding: EdgeInsets.all(5.px),
              margin: EdgeInsets.only(left: 30.px,right: 30.px,top: 15.px,bottom: 20.px),
              decoration: BoxDecoration(
                  color: primary3Color,
                  borderRadius: BorderRadius.circular(12.px),
                  border: Border.all(color: textGrey,width: 1.px)
              ),
              child: CommonWidgets.commonTextFieldForLoginSignUP(
                  hintText: StringConstants.aboutUS,
                  controller: controller.controller1,
                  autofocus: true,
                  isCard: true,
                  maxLines: 6,
                  contentPadding: EdgeInsets.zero,
                  keyboardType: TextInputType.text,
                  style: MyTextStyle.customStyle(fontWeight: FontWeight.w400,fontFamily: 'Buenard',fontSize: 16,color: textGrey)
              ),
            ),
            Text('What makes you feel home in your city?',style: MyTextStyle.customStyle(fontSize: 16,fontWeight: FontWeight.w700,fontFamily: 'Lora',color:const Color(0xFF606060)),),

            Container(
              padding: EdgeInsets.all(5.px),
              margin: EdgeInsets.only(left: 30.px,right: 30.px,top: 15.px,bottom: 10.px),
              decoration: BoxDecoration(
                  color: primary3Color,
                  borderRadius: BorderRadius.circular(12.px),
                  border: Border.all(color: textGrey,width: 1.px)
              ),
              child: CommonWidgets.commonTextFieldForLoginSignUP(
                  hintText: StringConstants.aboutUS,
                  controller: controller.controller2,
                  autofocus: true,
                  isCard: true,
                  maxLines: 6,
                  contentPadding: EdgeInsets.zero,
                  keyboardType: TextInputType.text,
                  style: MyTextStyle.customStyle(fontWeight: FontWeight.w400,fontFamily: 'Buenard',fontSize: 16,color: textGrey)
              ),
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.px),
                  border: Border.all(width: 2.px,color: textGrey)
              ),
              margin: EdgeInsets.only(left: 30.px,right: 30.px,bottom: 30.px),
              child: CommonWidgets.commonElevatedButton(
                onPressed: (){
                  controller.clickOnSaveButton();
                },
                child: Text(StringConstants.save,style: MyTextStyle.customStyle(fontSize: 18,fontWeight: FontWeight.w700,
                    color: textGrey,fontFamily: 'Lora'),),
                borderRadius: 25.px,
                buttonColor: primary3Color,
              ),
            ),
          ],
        );
      }),
    );
  }
}
