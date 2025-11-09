import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:home_swipping/app/data/constants/image_constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/my_space_add_ready_to_travel_controller.dart';

class MySpaceAddReadyToTravelView
    extends GetView<MySpaceAddReadyToTravelController> {
  const MySpaceAddReadyToTravelView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: backgroundColor,
      body:Obx((){
        controller.count.value;
        return Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: CommonWidgets.appImagesView(
                  imagePath: ImageConstants.imgReadyToTravelBackground,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Positioned(
                top: 150.px,right: 0.px,left: 0.px,
                child: CommonWidgets.typingText(text: 'Are you ready to\n travel now?',style: MyTextStyle.customStyle(fontSize: 30,fontWeight: FontWeight.w700,fontFamily: 'Lora',color:primary3Color),
                textAlign: TextAlign.center),

            ),
            Positioned(
              top: 400.px,right: 0.px,left: 0.px,
              child: Column(

                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: 80.px,bottom: 10.px),
                    child: CommonWidgets.appImagesView(
                        imagePath: IconConstants.icRobortWithEarth,height: 130.px,width: 80.px),
                  ),
                  Text('Your space is ready!',style: MyTextStyle.customStyle(fontSize: 24,fontWeight: FontWeight.w400,fontFamily: 'Lora',color:primary3Color),),
                ],
              ),

            ),



            Positioned(
              bottom: 30.px, left: 70.px,right: 70.px,
              child: Column(
                children: [
                  CommonWidgets.commonElevatedButton(
                      onPressed: (){
                        controller.clickOnTravelerProfileButton();
                      },
                    child:Text( StringConstants.travelerProfile,
                    style: MyTextStyle.customStyle(fontWeight: FontWeight.w700,color: primary3Color,
                    fontSize: 16,fontFamily: 'Lora'),),
                    borderRadius: 30.px,
                    buttonColor: primary3Color.withOpacity(0.2)

                  ),
                  SizedBox(height: 20.px,),
                  controller.isLoading.value?Center(child: CupertinoActivityIndicator(color: primary3Color,radius: 15.px,)):
                  CommonWidgets.gradientButton(
                      onPressed: (){
                        controller.clickOnLetsGoButton(context);
                      },
                    text: StringConstants.letGo,
                    isLoading: controller.isLoading.value
                  ),
                ],
              )
            ),
          ],
        );
      }),
    );
  }
}
