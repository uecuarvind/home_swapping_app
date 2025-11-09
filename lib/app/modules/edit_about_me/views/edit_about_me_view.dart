
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/edit_about_me_controller.dart';

class EditAboutMeView extends GetView<EditAboutMeController> {
  const EditAboutMeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBarView(title: StringConstants.editAboutUs),
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      body:Obx((){
        controller.count.value;
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Container(
              padding: EdgeInsets.all(5.px),
              margin: EdgeInsets.only(left: 30.px,right: 30.px),
              decoration: BoxDecoration(
                color: primary3Color,
                borderRadius: BorderRadius.circular(12.px),
                border: Border.all(color: textGrey,width: 1.px)
              ),
              child: CommonWidgets.commonTextFieldForLoginSignUP(
                  hintText: StringConstants.aboutUS,
                  controller: controller.aboutMeController,
                  autofocus: true,
                  isCard: true,
                  maxLines: 6,
                  contentPadding: EdgeInsets.zero,
                  keyboardType: TextInputType.text,
                  style: MyTextStyle.customStyle(fontWeight: FontWeight.w400,fontFamily: 'Buenard',fontSize: 14,color: textColor)
              ),
            ),
            const Spacer(),
            controller.isLoading.value?
            Padding(
              padding: EdgeInsets.only(bottom: 30.px),
              child: Center(child: CupertinoActivityIndicator(color: primary3Color,radius: 15.px,)),
            ):
            Container(
             decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(25.px),
                 border: Border.all(width: 2.px,color: textGrey)
             ),
              margin: EdgeInsets.only(left: 30.px,right: 30.px,bottom: 30.px),
              child: CommonWidgets.commonElevatedButton(
                onPressed: (){
                  controller.clickOnSaveButton(context);
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
