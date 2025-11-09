import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:home_swipping/app/data/constants/image_constants.dart';
import 'package:home_swipping/app/data/constants/string_constants.dart';
import 'package:home_swipping/common/MyTextStyle.dart';
import 'package:home_swipping/common/colors.dart';
import 'package:home_swipping/common/common_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../data/constants/icons_constant.dart';
import '../controllers/house_rule_controller.dart';

class HouseRuleView extends GetView<HouseRuleController> {
  const HouseRuleView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        backgroundColor: blackColor,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: controller.isLoading.value?
        CupertinoActivityIndicator(color: primary3Color,radius: 15.px,):
        CommonWidgets.gradientButton(
            onPressed: (){
              controller.onTapJoin(context);
            },
            text: StringConstants.join,
        ),
        body: Container(

          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 15.px,vertical: 50.px),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageConstants.imgMaskBackGround),
              fit: BoxFit.cover,
              opacity: 0.6
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.px,vertical: 10.px),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Center(child: CommonWidgets.typingText(text:StringConstants.ourHouseRule,
                    style: MyTextStyle.customStyle(fontWeight: FontWeight.w700,
                        color: primary3Color, fontSize: 24.px, fontFamily: 'Lora'),
                  ),),
                  SizedBox(height: 20.px,),
                  Column(
                    children: [
                      CommonWidgets.typingText(text:'1: ${StringConstants.rule1}\n\n'
                          '2: ${StringConstants.rule2}\n\n 3: ${StringConstants.rule3}\n\n 4: ${StringConstants.rule4}\n\n 5: ${StringConstants.rule5}\n\n 6: ${StringConstants.rule6}',
                        style: MyTextStyle.customStyle(color: primary3Color,
                            fontSize: 14.px,
                            fontFamily: 'Lora',fontWeight: FontWeight.w500,),),
                      SizedBox(height: 10.px,),
                     /* Row(
                        children: [
                          Container(
                              width: 40.px,
                              height: 40.px,
                              margin: EdgeInsets.only(right: 10.px),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.px),
                                  color: primary3Color.withOpacity(0.2),
                                  border: Border.all(color: primary3Color.withOpacity(0.5))
                              ),
                              child: Text('2', style: MyTextStyle.customStyle(
                                  color: primary3Color,fontWeight: FontWeight.w700,
                                  fontSize: 20.px,
                                  fontFamily: 'Lora'),)
                          ),
                          Expanded(child: CommonWidgets.typingText(text:StringConstants.rule2,
                            style: MyTextStyle.customStyle(color: primary3Color,
                              fontSize: 14.px,
                              fontFamily: 'Lora',fontWeight: FontWeight.w500,),)),
                        ],
                      ),
                      SizedBox(height: 10.px,),
                      Row(
                        children: [
                          Container(
                              width: 40.px,
                              height: 40.px,
                              margin: EdgeInsets.only(right: 10.px),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.px),
                                  color: primary3Color.withOpacity(0.2),
                                  border: Border.all(color: primary3Color.withOpacity(0.5))
                              ),
                              child: Text('3', style: MyTextStyle.customStyle(
                                  color: primary3Color,fontWeight: FontWeight.w700,
                                  fontSize: 20.px,
                                  fontFamily: 'Lora'),)
                          ),
                          Expanded(child: CommonWidgets.typingText(text:StringConstants.rule3,
                            style: MyTextStyle.customStyle(color: primary3Color,
                              fontSize: 14.px,
                              fontFamily: 'Lora',fontWeight: FontWeight.w500,),)),
                        ],
                      ),
                      SizedBox(height: 10.px,),
                      Row(
                        children: [
                          Container(
                              width: 40.px,
                              height: 40.px,
                              margin: EdgeInsets.only(right: 10.px),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.px),
                                  color: primary3Color.withOpacity(0.2),
                                  border: Border.all(color: primary3Color.withOpacity(0.5))
                              ),
                              child: Text('4', style: MyTextStyle.customStyle(
                                  color: primary3Color,fontWeight: FontWeight.w700,
                                  fontSize: 20.px,
                                  fontFamily: 'Lora'),)
                          ),
                          Expanded(child:CommonWidgets.typingText(text:StringConstants.rule4,
                            style: MyTextStyle.customStyle(color: primary3Color,
                              fontSize: 14.px,
                              fontFamily: 'Lora',fontWeight: FontWeight.w500,),)),
                        ],
                      ),
                      SizedBox(height: 10.px,),
                      Row(
                        children: [
                          Container(
                              width: 40.px,
                              height: 40.px,
                              margin: EdgeInsets.only(right: 10.px),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.px),
                                  color: primary3Color.withOpacity(0.2),
                                  border: Border.all(color: primary3Color.withOpacity(0.5))
                              ),
                              child: Text('5', style: MyTextStyle.customStyle(
                                  color: primary3Color,fontWeight: FontWeight.w700,
                                  fontSize: 20.px,
                                  fontFamily: 'Lora'),)
                          ),
                          Expanded(child: CommonWidgets.typingText(text:StringConstants.rule5,
                            style: MyTextStyle.customStyle(color: primary3Color,
                              fontSize: 14.px,
                              fontFamily: 'Lora',fontWeight: FontWeight.w500,),)),
                        ],
                      ),
                      SizedBox(height: 10.px,),
                      Row(
                        children: [
                          Container(
                              width: 40.px,
                              height: 40.px,
                              margin: EdgeInsets.only(right: 10.px),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.px),
                                  color: primary3Color.withOpacity(0.2),
                                  border: Border.all(color: primary3Color.withOpacity(0.5))
                              ),
                              child: Text('6', style: MyTextStyle.customStyle(
                                  color: primary3Color,fontWeight: FontWeight.w700,
                                  fontSize: 20.px,
                                  fontFamily: 'Lora'),)
                          ),
                          Expanded(child: CommonWidgets.typingText(text:StringConstants.rule6,
                            style: MyTextStyle.customStyle(color: primary3Color,
                              fontSize: 14.px,
                              fontFamily: 'Lora',fontWeight: FontWeight.w500,),)),
                        ],
                      ), */
                    ],
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 50.px),
                    padding: EdgeInsets.symmetric(horizontal: 20.px,vertical: 25.px),
                    decoration: BoxDecoration(
                      color: primary3Color.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(20.px),
                      border: Border.all(color: primary3Color.withOpacity(0.2))
                    ),
                      child: Row(
                    children: [
                      Expanded(
                        child: Text(StringConstants.weHopeToYouFeelAtHome,
                          style: MyTextStyle.customStyle(
                            fontWeight: FontWeight.w600,
                              color:primary3Color, fontSize: 20.px, fontFamily: 'Lora'),
                        ),
                      ),
                      CommonWidgets.appImagesView(
                          imagePath: IconConstants.icRobort,
                          height: 109.px,
                          width: 75.px,
                          fit: BoxFit.cover)
                    ],
                  )
                  ),
                  SizedBox(height: 15.px,),



                  SizedBox(height: 20.px,),
                ],
              ),
            ),
          ),
        ),
      );
    });
   }
  }