import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:home_swipping/app/data/constants/image_constants.dart';
import 'package:home_swipping/app/data/constants/string_constants.dart';
import 'package:home_swipping/common/MyTextStyle.dart';
import 'package:home_swipping/common/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../controllers/highlighte_real_controller.dart';

class HighlighteRealView extends GetView<HighlighteRealController> {
  const HighlighteRealView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: CommonWidgets.appBarView(color: Colors.transparent),
      body: Container(
        height:MediaQuery.of(context).size.height,
        width:MediaQuery.of(context).size.width,
        decoration:  BoxDecoration(
            image: const DecorationImage(
              image: AssetImage(ImageConstants.imgHighlighteReal),
              fit: BoxFit.cover,
            ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.only(left: 20.px,top: 50.px),
              child: InkWell(
                onTap: (){
                  Get.back();
                },
                child: Row(
                  children: [
                    Icon(Icons.arrow_back_ios_new_outlined,color: primary3Color,size: 20.px,),
                    Text(StringConstants.profileCreate,style: MyTextStyle.customStyle(color: primary3Color,fontSize: 14.px,fontFamily: 'Lora'),),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.px,),
            Center(child: Text(StringConstants.createHighLite,
              style: MyTextStyle.customStyle(color: primary3Color,fontSize: 24.px,fontWeight:FontWeight.w800,fontFamily: 'Lora'),),
            ),
            Center(child: Text(StringConstants.ofYourHome,
              style: MyTextStyle.customStyle(color: primary3Color,fontSize: 24.px,fontWeight:FontWeight.w800,fontFamily: 'Lora'),),
            ),
            SizedBox(height: 20.px,),
            GestureDetector(
              onTap: (){
                controller.clickOnSampleVideo();
              },
              child: Container(
                margin: EdgeInsets.only(left: 10.px),
                height: 45.px,width: 120.px,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.px),
                  color: labelColor
                ),
                child: Center(
                  child: Text(StringConstants.sampleVideo,
                    style: MyTextStyle.customStyle(color: primary3Color,fontSize: 12.px,fontFamily: 'Lora'),),
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(left: 15.px,right: 15.px),
              child: Text(StringConstants.youCanEitherFollow,style: MyTextStyle.customStyle(color: primary3Color,fontSize: 12.px,fontFamily: 'Lora'),),
            ),
            GestureDetector(
              onTap: (){
                controller.clickOnCreateSpaceTape();
              },
              child: Container(
                margin: EdgeInsets.only(left: 15.px,right: 15.px),
                height: 50.px,width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(color: text2Color,width: 2.px),
                    borderRadius: BorderRadius.circular(100.px),
                    color: primary3Color
                ),
                child: Center(
                  child: Text(StringConstants.createSpaceTape,
                    style: MyTextStyle.customStyle(color: text2Color,fontSize: 16.px,fontFamily: 'Lora'),),
                ),
              ),
            ),
            SizedBox(height: 10.px,),
            TextButton(
                onPressed: (){}, 
                child: Text(StringConstants.skip,style: MyTextStyle.customStyle(color: primary3Color,fontSize: 18.px,fontFamily: 'Lora'),)
            ),
            SizedBox(height: 10.px,),

          ],
        ),
      ),
    );
  }
}
