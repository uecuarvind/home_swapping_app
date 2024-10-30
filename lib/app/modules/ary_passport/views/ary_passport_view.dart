import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:home_swipping/app/data/constants/icons_constant.dart';
import 'package:home_swipping/app/data/constants/image_constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/ary_passport_controller.dart';

class AryPassportView extends GetView<AryPassportController> {
  const AryPassportView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CommonWidgets.appBarView(),
      body:Obx((){
        controller.count.value;
        return Container(
            height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.only(left:15.px,right: 15.px),
            decoration:  const BoxDecoration(
                color: backgroundColor
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(StringConstants.aryPassport,style: MyTextStyle.customStyle(
                    fontSize: 24.px,fontWeight: FontWeight.w700,fontFamily: 'Lora',color:text2Color
                ),textAlign: TextAlign.center,),
               Text(StringConstants.youWillNeedPassport,style: MyTextStyle.customStyle(fontSize: 16,fontFamily: 'Lora',fontWeight: FontWeight.w400,color:text2Color)),
                SizedBox(height: 25.px,),
                Container(
                  height: 360.px,
                  margin: EdgeInsets.only(left: 50.px,right: 50.px),
                  padding: EdgeInsets.only(left:30.px,right: 30.px,top: 50.px),
                  decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(150.px) ,
                    color: primary3Color,
                    border: Border.all(color: textGolden,width: 3.px)
                  ),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          controller.profileImage.value!=null?
                          ClipRRect(
                            borderRadius: BorderRadius.circular(83.px),
                            child: Image.file(
                              height: 166.px,width: 166.px,
                              fit: BoxFit.fill,
                              File(
                                controller.profileImage.value!.path.toString(),
                              ),
                            ),
                          ):
                          Container(
                            height: 166.px,width: 166.px,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(color: primary3Color,width: 3.px),
                              borderRadius: BorderRadius.circular(83.px),
                              color: Colors.grey.withOpacity(0.5)
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: Icon(
                              Icons.person,size: 70.px,color: Colors.grey,
                            ),
                          ),
                          Positioned(
                            bottom: 0.px,right: 0.px,
                              child: GestureDetector(
                                onTap: (){
                                  controller.openBottomSheet();
                                },
                                child: CommonWidgets.appImagesView(imagePath: IconConstants.icCamera,
                                  height: 65.px,width: 65.px,),
                              )
                          )
                        ],
                      ),
                      Text('Mithun Sharma',style: MyTextStyle.customStyle(fontSize: 24,fontWeight: FontWeight.w700,
                          color: text2Color,fontFamily: 'Lora'),textAlign: TextAlign.center,),
                      Text(StringConstants.member,style: MyTextStyle.customStyle(fontSize: 16,fontWeight: FontWeight.w400,
                          color: text2Color,fontFamily: 'Lora'),),
                    ],
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.px)
                  ),
                  margin: EdgeInsets.only(left: 20.px,right: 20.px,top: 50.px),
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
            )

        );
      }),
    );
  }
}
