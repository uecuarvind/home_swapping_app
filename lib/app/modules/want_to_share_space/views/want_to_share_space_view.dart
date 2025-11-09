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
import '../controllers/want_to_share_space_controller.dart';

class WantToShareSpaceView extends GetView<WantToShareSpaceController> {
  const WantToShareSpaceView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
          backgroundColor: blackColor,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton:
          CommonWidgets.gradientButton(onPressed: (){
            controller.clickOnContinueButton();
          },
              text: StringConstants.continueText
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageConstants.imgExploreBackground),
                fit: BoxFit.fill
              )
            ),
            child: SafeArea(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 15.px,vertical: 0.px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            Get.back();
                          },
                          child: CommonWidgets.appImagesView(
                              imagePath: IconConstants.icBack,
                            height: 35.px,width: 35.px
                          ),
                        ),
                        SizedBox(width: 10.px,),
                        CommonWidgets.typingText(text: 'What kind of space will you share?',style: MyTextStyle.customStyle(
                          fontFamily: 'Lora',fontSize: 18,fontWeight: FontWeight.w500,color: primary3Color
                        ),)
                      ],
                    ),

                    SizedBox(height: 70.px,),
                    GestureDetector(
                      onTap: (){
                        controller.changeTabIndex(0);
                      },
                      child: Column(
                        crossAxisAlignment:CrossAxisAlignment.start ,
                        children: [
                          Text(
                            StringConstants.entireSpace,
                            style: MyTextStyle.customStyle(
                                fontSize: 16.px,
                                color: controller.selectedTabIndex.value==0 ? primary3Color : const Color(0xFF8B8A8C),
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Lora'
                            ),
                          ),
                          SizedBox(height: 6.px,),

                        ],
                      ),
                    ),
                    SizedBox(height: 20.px,),
                    GestureDetector(
                      onTap: (){
                        controller.changeTabIndex(1);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            StringConstants.sharedSpace,
                            style: MyTextStyle.customStyle(
                                fontSize: 16.px,
                                color: controller.selectedTabIndex.value==1 ? primary3Color : const Color(0xFF8B8A8C),
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Lora'
                            ),
                          ),

                        ],
                      ),
                    ),



                  ],
                ),
              ),
            ),
          )
      );;
    });
  }
}
