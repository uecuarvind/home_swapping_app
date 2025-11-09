import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:home_swipping/app/data/constants/icons_constant.dart';
import 'package:home_swipping/app/data/constants/string_constants.dart';
import 'package:home_swipping/common/MyTextStyle.dart';
import 'package:home_swipping/common/colors.dart';
import 'package:home_swipping/common/common_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../data/constants/image_constants.dart';
import '../controllers/get_start_controller.dart';

class GetStartView extends GetView<GetStartController> {
  const GetStartView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Obx((){
        controller.count.value;
        return Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.all(15.px),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageConstants.imgGetStartBackground),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Padding(
                padding: EdgeInsets.only(top: 40.px),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CommonWidgets.appImagesView(
                        imagePath: IconConstants.icRobort,
                        width: 38.px,height: 55.px
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.px,left: 5.px),
                      child: CommonWidgets.appImagesView(
                          imagePath: IconConstants.icAny,
                        width: 80.px,height: 65.px
                      ),
                    ),
                  ],
                ),
              ),

              Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      controller.goToNavBar();
                    },
                    child: Text(StringConstants.designedForALifeFullOfTravel,style: MyTextStyle.customStyle(
                      fontSize: 32.px,fontWeight: FontWeight.w700,fontFamily: 'Lora',color: primary3Color
                    ),textAlign: TextAlign.start,),
                  ),
                  SizedBox(height: 50.px,),
                  CommonWidgets.gradientButton(
                      onPressed: (){
                        controller.clickOnGetStartButton();
                      },
                      text: StringConstants.getStarted
                  ),
                  SizedBox(height: 30.px,),
                ],
              )
            ],
          )

        );
      }),
    );
  }
}
