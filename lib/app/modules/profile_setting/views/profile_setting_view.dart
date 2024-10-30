import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:home_swipping/app/data/constants/image_constants.dart';
import 'package:home_swipping/common/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/profile_setting_controller.dart';

class ProfileSettingView extends GetView<ProfileSettingController> {
  const ProfileSettingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageConstants.imgProfileSettingBackground),
                  fit: BoxFit.fill
                )
              ),
        child: CommonWidgets.appImagesView(
        imagePath:ImageConstants.imgBlackBackground,
            height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill
        ),
          ),
            Positioned(
              top: 50.px,left: 10.px,right: 10.px,
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 150.px,
                    height: 52.px,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: primary3Color,
                        border: Border.all(color: primary3Color),
                        borderRadius: BorderRadius.circular(26.px)
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Text(StringConstants.spaceTape,style: MyTextStyle.customStyle(fontSize: 16,
                        fontWeight: FontWeight.w500,color:textGolden,fontFamily: 'Lora'),),
                  ),
                  Container(
                    width: 130.px,
                    height: 44.px,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color:const Color(0xFFFFFBF2),
                        border: Border.all(color: primary3Color),
                        borderRadius: BorderRadius.circular(24.px)
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CommonWidgets.appImagesView(
                            imagePath: IconConstants.icCredit,height: 25.px,width: 25.px
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.px),
                          child: Text('5 Credits',style: MyTextStyle.customStyle(fontSize: 16,
                              fontWeight: FontWeight.w500,color:Colors.black,fontFamily: 'Lora'),),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      controller.openBottomSheetProfileSetting(context);
                    },
                    child: CommonWidgets.appImagesView(
                        imagePath: IconConstants.icSetting,height: 25.px,width: 25.px
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: 120.px,left: 10.px,right: 10.px,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(StringConstants.welcomeToYourProfile,style: MyTextStyle.customStyle(fontSize: 26,
                  fontWeight: FontWeight.w700,color: primary3Color,fontFamily: 'Lora'),),
                  Container(
                    width: 300.px,
                    height: 52.px,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 30.px,bottom: 10.px),
                    decoration: BoxDecoration(
                        color: primary3Color,
                        border: Border.all(color: primary3Color),
                        borderRadius: BorderRadius.circular(26.px)
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Text(StringConstants.continueSpaceProfile,style: MyTextStyle.customStyle(fontSize: 16,
                        fontWeight: FontWeight.w500,color: Colors.black87,fontFamily: 'Lora'),),
                  ),
                  Text(StringConstants.personalProfile,style: MyTextStyle.customStyle(fontSize: 14,
                      fontWeight: FontWeight.w700,color: primary3Color,fontFamily: 'Buenard'),),
                  Container(
                    width: 210.px,
                    height: 42.px,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 50.px,bottom: 20.px),
                    decoration: BoxDecoration(
                        color: transparentColor,
                        border: Border.all(color: const Color(0xFFBDFF9E).withOpacity(0.40),width: 2.px),
                        borderRadius: BorderRadius.circular(21.px)
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Text('20% of profile completed',style: MyTextStyle.customStyle(fontSize: 16,
                        fontWeight: FontWeight.w700,color:primary3Color,fontFamily: 'Buenard'),),
                  ),

                  Text(StringConstants.completedProfilesTravelMore,style: MyTextStyle.customStyle(fontSize: 20,
                      fontWeight: FontWeight.w700,color: primary3Color,fontFamily: 'Buenard'),),
                ],
              )
            ),
            Positioned(
              bottom: 10.px,right: 10.px,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      controller.clickOnEditProfile();
                    },
                    child: CommonWidgets.appImagesView(
                        imagePath: IconConstants.icProfileEdit,
                        height: 48.px,width: 48.px
                    ),
                  ),
                  SizedBox(height: 5.px,),
                  CommonWidgets.appImagesView(
                      imagePath: IconConstants.icPerson,
                      height: 48.px,width: 48.px
                  ),
                  Text('4',style: MyTextStyle.titleStyle12bw,),
                  SizedBox(height: 5.px,),
                  CommonWidgets.appImagesView(
                      imagePath: IconConstants.icBed,
                      height: 48.px,width: 48.px
                  ),
                  Text('2',style: MyTextStyle.titleStyle12bw,),
                  SizedBox(height: 5.px,),
                  CommonWidgets.appImagesView(
                      imagePath: IconConstants.icBathTub,
                      height: 48.px,width: 48.px
                  ),
                  Text('2',style: MyTextStyle.titleStyle12bw,),
                ],
              ),
            ),
            Positioned(
              bottom: 30.px,left: 20.px,
                child: Text(StringConstants.aboutMySpaceInfoHere,style: MyTextStyle.customStyle(fontSize: 14,
                    fontWeight: FontWeight.w500,color: primary3Color,fontFamily: 'Lora'),),
            )
          ],
        )
    );
  }
}
