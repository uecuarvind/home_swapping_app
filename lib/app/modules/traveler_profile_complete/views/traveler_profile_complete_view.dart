import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:home_swipping/app/data/constants/icons_constant.dart';
import 'package:home_swipping/app/data/constants/image_constants.dart';
import 'package:home_swipping/common/colors.dart';
import 'package:home_swipping/common/common_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/update_profile_detail.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/traveler_profile_complete_controller.dart';

class TravelerProfileCompleteView
    extends GetView<TravelerProfileCompleteController> {
  const TravelerProfileCompleteView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: blackColor,
      body:Obx((){
        controller.count.value;
        return  Stack(
          children: [
           CommonWidgets.appImagesView(
               imagePath: ImageConstants.imgAcceptSpaceProfileComplete,
           height: MediaQuery.of(context).size.height,
           width: MediaQuery.of(context).size.width,),
            Positioned(
              top: 130.px,left: 20.px,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonWidgets.appImagesView(imagePath: IconConstants.icRobortWithEarth,
                    height: 100.px,width: 80.px),
                    CommonWidgets.typingText(text: 'Congrats ${UpdateProfileDetails.getUserModel?.user?.name}!',style: MyTextStyle.customStyle(fontSize: 36,fontWeight: FontWeight.w600,fontFamily: 'Lora',color:primary3Color),),
                    SizedBox(height: 10.px,),
                    CommonWidgets.typingText(text: 'Your travel profile is completed!',style: MyTextStyle.customStyle(fontSize: 15,fontWeight: FontWeight.w400,fontFamily: 'Lora',color:primary3Color),),
                  ],
                )
            ),
            if(controller.isLoading.value)
              Positioned(
                  bottom: 420.px,right: 0.px,left: 0.px,
                  child: CupertinoActivityIndicator(color: primary3Color,radius: 15.px,)
              ),
            if(!controller.isLoading.value)
            Positioned(
                bottom: 30.px,left: 20.px,right: 20.px,
                child: Column(
                  children: [
                    CommonWidgets.commonElevatedButton(
                      onPressed: (){
                        controller.clickOnExploreButton();
                      },

                      child: Text(StringConstants.explore,style: MyTextStyle.customStyle(fontSize: 18,fontWeight: FontWeight.w700,
                          color: primary3Color,fontFamily: 'Lora'),),
                      borderRadius: 25.px,
                      buttonColor:Colors.transparent,
                    ),
                    SizedBox(height: 20.px,),
                    CommonWidgets.gradientButton(
                      onPressed: (){
                        controller.clickOnSpaceProfileButton();
                      },

                     text: 'Space Profile',

                    ),

             ],
                )
            ),
          ],
        );
      })
    );
  }
}
