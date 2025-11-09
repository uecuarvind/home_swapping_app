import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/your_name_controller.dart';

class YourNameView extends GetView<YourNameController> {
  const YourNameView({super.key});
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
                    Text(StringConstants.whatYourName,style: MyTextStyle.customStyle(
                        fontSize: 28.px,fontWeight: FontWeight.w600,fontFamily: 'Lora',color:primary3Color
                    ),textAlign: TextAlign.center,),
                    SizedBox(height: 20.px,),
                    Padding(
                      padding:EdgeInsets.only(left: 30.px,right: 30.px),
                      child: CommonWidgets.commonTextFieldForLoginSignUP(
                          //hintText: StringConstants.name ,
                          controller: controller.nameController,
                          keyboardType: TextInputType.text,
                          autofocus: true,
                          style: MyTextStyle.customStyle(fontWeight: FontWeight.w700,fontFamily: 'Buenard',fontSize: 36,
                              color:primary3Color)
                      ),
                    ),
                    SizedBox(height: 25.px,),
                    CommonWidgets.gradientButton(
                        onPressed: (){
                          controller.clickOnContinueButton(context);
                        },
                        text: StringConstants.continueText
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
