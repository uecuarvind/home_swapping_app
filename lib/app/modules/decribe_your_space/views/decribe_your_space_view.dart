import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:home_swipping/app/data/constants/image_constants.dart';
import 'package:home_swipping/common/MyTextStyle.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/decribe_your_space_controller.dart';

class DecribeYourSpaceView extends GetView<DecribeYourSpaceController> {
  const DecribeYourSpaceView({super.key});
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   resizeToAvoidBottomInset: false,
    //   appBar: CommonWidgets.appBarView(title: StringConstants.mySpace,color: backgroundColor ),
    //   backgroundColor: backgroundColor,
    //   body:Obx((){
    //     controller.count.value;
    //     return  Container(
    //       margin: EdgeInsets.only(left: 10.px,right: 10.px),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Text(
    //             StringConstants.describeYourSpace,
    //             style: MyTextStyle.customStyle(
    //                 fontSize: 20.px,
    //                 color: text2Color,
    //                 fontWeight: FontWeight.w700,
    //                 fontFamily: 'Lora'
    //             ),
    //           ),
    //           SizedBox(height: 8.px,),
    //           Text(
    //             StringConstants.shareWhatMakesYourSpecial,
    //             style: MyTextStyle.customStyle(
    //                 fontSize: 14.px,
    //                 color: text2Color,
    //                 fontWeight: FontWeight.w600,
    //                 fontFamily: 'Lora'
    //             ),
    //           ),
    //           SizedBox(height: 4.px,),
    //           Stack(
    //             children: [
    //               Container(
    //                 decoration: BoxDecoration(
    //                     color: primary3Color,
    //                     borderRadius: BorderRadius.circular(10.px),
    //                     border: Border.all(
    //                         color: text2Color.withOpacity(0.5), width: 2
    //                     )
    //                 ),
    //                 child: TextFormField(
    //                   maxLines: 7,
    //                   controller: controller.messageController,
    //                   decoration:  InputDecoration(
    //                     hintText: StringConstants.enterHere,
    //                     hintStyle: MyTextStyle.customStyle(
    //                         fontSize: 14.px,
    //                         color: hintColor,
    //                         fontWeight: FontWeight.w400,
    //                         fontFamily: 'Lora'
    //                     ),
    //                     border: InputBorder.none,
    //                     isDense: true,
    //                     contentPadding: EdgeInsets.only(left: 12.px,right: 12,top: 12,bottom: 0),
    //                     focusedBorder: InputBorder.none,
    //                     enabledBorder: InputBorder.none,
    //                     errorBorder: InputBorder.none,
    //                     disabledBorder: InputBorder.none,
    //                   ),
    //                   style: MyTextStyle.customStyle(
    //                     fontSize: 15.px,
    //                     color: hintColor,
    //                     fontWeight: FontWeight.w400,
    //                   ),
    //                 ),
    //               ),
    //               Positioned(
    //                 bottom: 10.px,right: 10.px,
    //                 child: CommonWidgets.appImagesView(
    //                     imagePath: IconConstants.icMicGolden,
    //                     height: 24.px,width: 24.px,
    //                     fit: BoxFit.cover
    //                 ),
    //               )
    //             ],
    //           ),
    //           SizedBox(height: 10.px,),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               SizedBox(),
    //               Text(
    //                 "500",
    //                 style: MyTextStyle.customStyle(
    //                     fontSize: 14.px,
    //                     color: text2Color,
    //                     fontWeight: FontWeight.w600,
    //                     fontFamily: 'Lora'
    //                 ),
    //               ),
    //             ],
    //           ),
    //           Spacer(),
    //           Card(
    //             shape: RoundedRectangleBorder(
    //                 borderRadius: BorderRadius.circular(25.px)
    //             ),
    //             margin: EdgeInsets.only(left: 30.px,right: 30.px),
    //             elevation: 10.px,
    //             child: CommonWidgets.commonElevatedButton(
    //               onPressed: (){
    //                 controller.clickOnContinueButton(context);
    //               },
    //
    //               child: Text(StringConstants.continueText,style: MyTextStyle.customStyle(fontSize: 18,fontWeight: FontWeight.w700,
    //                   color: text2Color,fontFamily: 'Lora'),),
    //               borderRadius: 25.px,
    //               buttonColor: primary3Color,
    //             ),
    //           ),
    //           SizedBox(height: 12.px,),
    //           GestureDetector(
    //             onTap: (){
    //               controller.clickOnSkip();
    //             },
    //             child: Center(
    //               child: Text(
    //                 StringConstants.skipForNow,
    //                 style: MyTextStyle.customStyle(
    //                     fontSize: 16.px,
    //                     color: text2Color,
    //                     fontWeight: FontWeight.w500,
    //                     fontFamily: 'Lora'
    //                 ),
    //               ),
    //             ),
    //           ),
    //           SizedBox(height: 30.px,)
    //         ],
    //       ),
    //     );
    //   })
    // );

    return Obx((){
      controller.count.value;
      return Scaffold(
        backgroundColor: blackColor,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: controller.messageController.text.isNotEmpty?
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
                SizedBox(height: 10.px,),
                CommonWidgets.typingText(text: '       Space       ',
                  style: MyTextStyle.customStyle(
                      fontSize: 18.px,
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
                      border: Border.all(color: controller.isMessage.value?primary3Color.withOpacity(0.3):Colors.transparent,width: 1.px)

                  ),
                  child: TextFormField(
                    focusNode: controller.messageNode,
                    controller: controller.messageController,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration:  InputDecoration(
                      hintText: 'Describe your space and what makes it special to you.',
                      hintStyle: MyTextStyle.customStyle(
                          fontSize: 14.px,
                          color: hintColor,
                          fontWeight: FontWeight.w400,
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
