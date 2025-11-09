import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/name_would_you_call_controller.dart';

class NameWouldYouCallView extends GetView<NameWouldYouCallController> {
  const NameWouldYouCallView({super.key});
  Widget build(
      BuildContext context) {
    return Obx((){
      controller.count.value;
      return Scaffold(
        backgroundColor: blackColor,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: controller.spaceNameController.text.isNotEmpty?
        CommonWidgets.gradientButton(onPressed: (){
          controller.clickOnContinueButton(context);
        },
            text: StringConstants.continueText
        ):const SizedBox(),
        body:Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(
                  ImageConstants.imgExploreBackground
              ),fit: BoxFit.fill)
          ),
          child: SafeArea(
            child:Column(
              children: [
                SizedBox(height: 30.px,),
                CommonWidgets.typingText(text: 'If your space had a name what would it be?',
                  style: MyTextStyle.customStyle(
                      fontSize: 14.px,
                      color: primary3Color  ,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Lora'
                  ),
                ),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.px,vertical: 20.px),
                  padding: EdgeInsets.symmetric(horizontal: 10.px,vertical: 15.px),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.px),
                      color: Color(0xFFF0F0F01F).withOpacity(0.12),
                      border: Border.all(color: controller.isSpaceName.value?primary3Color.withOpacity(0.3):Colors.transparent,width: 1.px)
                  ),
                  child: TextFormField(

                    controller: controller.spaceNameController,
                    focusNode: controller.spaceNameNode,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration:  InputDecoration(
                      hintText: 'A centrally located airy space.',
                      hintStyle: MyTextStyle.customStyle(
                          fontSize: 14.px,
                          color: hintColor,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Lora'
                      ),
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.only(left: 12.px,right: 12,top: 0,bottom: 0),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                    style: MyTextStyle.customStyle(
                        fontSize: 14.px,
                        color: primary3Color,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Lora'
                    ),
                    onChanged: (value){
                      controller.increment();
                    },
                  ),
                ),
              ],
            ) ,
          ),
        ),
      );
    });
  }
}
