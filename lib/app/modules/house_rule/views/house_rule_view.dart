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
        appBar: CommonWidgets.appBarView(color: Colors.white),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Center(child: Text(StringConstants.ourHouseRule,
                style: MyTextStyle.customStyle(
                    color: textGolden, fontSize: 30.px, fontFamily: 'Coiny'),
              ),),
              SizedBox(height: 10.px,),
              Container(
                margin: EdgeInsets.only(left: 10.px, right: 10.px),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                            width: 30.px,
                            child: Text('1', style: MyTextStyle.customStyle(
                                color: textGolden,
                                fontSize: 30.px,
                                fontFamily: 'Coiny'),)
                        ),
                        Expanded(child: Text(StringConstants.rule1,
                          style: MyTextStyle.customStyle(color: labelColor,
                              fontSize: 14.px,
                              fontFamily: 'Lora'),)),
                      ],
                    ),
                    SizedBox(height: 10.px,),
                    Row(
                      children: [
                        Container(
                            width: 30.px,
                            child: Text('2', style: MyTextStyle.customStyle(
                                color: textGolden,
                                fontSize: 30.px,
                                fontFamily: 'Coiny'),)
                        ),
                        Expanded(child: Text(StringConstants.rule2,
                          style: MyTextStyle.customStyle(color: labelColor,
                              fontSize: 14.px,
                              fontFamily: 'Lora'),)),
                      ],
                    ),
                    SizedBox(height: 10.px,),
                    Row(
                      children: [
                        Container(
                            width: 30.px,
                            child: Text('3', style: MyTextStyle.customStyle(
                                color: textGolden,
                                fontSize: 30.px,
                                fontFamily: 'Coiny'),)
                        ),
                        Expanded(child: Text(StringConstants.rule3,
                          style: MyTextStyle.customStyle(color: labelColor,
                              fontSize: 14.px,
                              fontFamily: 'Lora'),)),
                      ],
                    ),
                    SizedBox(height: 10.px,),
                    Row(
                      children: [
                        Container(
                            width: 30.px,
                            child: Text('4', style: MyTextStyle.customStyle(
                                color: textGolden,
                                fontSize: 30.px,
                                fontFamily: 'Coiny'),)
                        ),
                        Expanded(child: Text(StringConstants.rule4,
                          style: MyTextStyle.customStyle(color: labelColor,
                              fontSize: 14.px,
                              fontFamily: 'Lora'),)),
                      ],
                    ),
                    SizedBox(height: 10.px,),
                    Row(
                      children: [
                        Container(
                            width: 30.px,
                            child: Text('5', style: MyTextStyle.customStyle(
                                color: textGolden,
                                fontSize: 30.px,
                                fontFamily: 'Coiny'),)
                        ),
                        Expanded(child: Text(StringConstants.rule5,
                          style: MyTextStyle.customStyle(color: labelColor,
                              fontSize: 14.px,
                              fontFamily: 'Lora'),)),
                      ],
                    ),
                    SizedBox(height: 10.px,),
                    Row(
                      children: [
                        Container(
                            width: 30.px,
                            child: Text('6', style: MyTextStyle.customStyle(
                                color: textGolden,
                                fontSize: 30.px,
                                fontFamily: 'Coiny'),)
                        ),
                        Expanded(child: Text(StringConstants.rule6,
                          style: MyTextStyle.customStyle(color: labelColor,
                              fontSize: 14.px,
                              fontFamily: 'Lora'),)),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.px,),
              Center(child: Text(StringConstants.weHopeToYou,
                style: MyTextStyle.customStyle(
                    color: textGolden, fontSize: 30.px, fontFamily: 'Coiny'),)),
              Center(child: Text(StringConstants.feelAtHome,
                style: MyTextStyle.customStyle(
                    color: textGolden, fontSize: 30.px, fontFamily: 'Coiny'),)),
              Center(child: Text(StringConstants.awayFromHome,
                style: MyTextStyle.customStyle(
                    color: textGolden, fontSize: 30.px, fontFamily: 'Coiny'),)),
              SizedBox(height: 10.px,),
              Center(child: CommonWidgets.appImagesView(
                  imagePath: IconConstants.icHouseRules,
                  height: 94.px,
                  width: 92.px,
                  fit: BoxFit.cover)),
              SizedBox(height: 10.px,),
              GestureDetector(
                onTap: () {
                  controller.onTapJoin();
                },
                child: Container(
                  margin: EdgeInsets.only(left: 15.px, right: 15.px),
                  height: 50.px,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border: Border.all(color: labelColor, width: 2.px),
                      borderRadius: BorderRadius.circular(100.px),
                      color: primary3Color
                  ),
                  child: Center(
                    child: Text(StringConstants.join,
                      style: MyTextStyle.customStyle(color: labelColor,
                          fontSize: 16.px,
                          fontFamily: 'Lora'),),
                  ),
                ),
              ),
              SizedBox(height: 20.px,),
            ],
          ),
        ),
      );
    });
   }
  }