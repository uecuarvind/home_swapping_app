import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:get/get.dart';
import 'package:home_swipping/app/data/constants/image_constants.dart';
import 'package:home_swipping/common/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/traveler_profile_congratulation_controller.dart';

class TravelerProfileCongratulationView
    extends GetView<TravelerProfileCongratulationController> {
  const TravelerProfileCongratulationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: blackColor,

        body:Obx((){
          controller.count.value;
          return  Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImageConstants.imgProfileCongratulation),
                    fit: BoxFit.fill,
                )
            ),
            child: Stack(
              children: [
                Transform.rotate(
                  angle: math.pi,
                  child: CommonWidgets.appImagesView(
                      imagePath: ImageConstants.imgBlackBackground,
                      height: 400.px,width: MediaQuery.of(context).size.width
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.px,vertical: 0.px),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 80.px,),
                        CommonWidgets.typingText(text: 'Congratulations James!',style: MyTextStyle.customStyle(fontSize: 24,fontWeight: FontWeight.w700,fontFamily: 'Lora',color:primary3Color),),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.px,vertical: 5.px),
                          child: CommonWidgets.typingText(text: 'We are designed for travelers, by travelers.\n\n'

                              'We believe by opening up our own worlds we not only expand our own, but expand the world of others.\n\n'
                              'So thank you for sharing yours.',style: MyTextStyle.customStyle(fontSize: 14,fontWeight: FontWeight.w600,fontFamily: 'Lora',color:primary3Color),),
                        ),
                        SizedBox(height: 50.px,),
                        Align(
                          alignment: Alignment.centerRight,
                            child: Container(

                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.all(40.px),
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage(ImageConstants.imgBlurFull),
                                  fit: BoxFit.fill,
                                  opacity: 0.8
                                ),

                                borderRadius: BorderRadius.circular(12.px)
                              ),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                      child: Text('The creators,',style: MyTextStyle.customStyle(fontSize: 20,fontWeight: FontWeight.w700,fontFamily: 'Buenard',color:primary3Color),)),

                                  Text('James & Josh',style: MyTextStyle.customStyle(fontSize: 32,fontWeight: FontWeight.w500,fontFamily: 'Lora',color:primary3Color),),
                                  SizedBox(height: 20.px,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CommonWidgets.appImagesView(
                                          imagePath: IconConstants.icRobort,fit: BoxFit.fill,
                                          height: 105,width: 65
                                      ),
                                      SizedBox(width: 1.px,),
                                      CommonWidgets.appImagesView(
                                          imagePath: IconConstants.icRobortWithEarth,fit: BoxFit.fill,
                                          height: 105,width: 85
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20.px,),
                                  CommonWidgets.gradientButton(onPressed: (){
                                    controller.clickOnExploreButton();
                                  },
                                      text: StringConstants.explore
                                  )
                                ],
                              ),
                            )),


                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        })
    );
  }
}
