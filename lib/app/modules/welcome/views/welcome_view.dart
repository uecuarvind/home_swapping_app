import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:home_swipping/common/local_data.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 15.px,vertical: 50.px),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageConstants.imgMaskBackGround),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 150.px),
                child:
                CommonWidgets.appImagesView(imagePath: IconConstants.icRobort,height: 90.px,
                    width: 63.px)
            ),
            SizedBox(height: 10.px,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                CommonWidgets.appImagesView(imagePath: IconConstants.icVerify,height: 28.px,
                    width: 28.px),
                Text('Congrats ${LocalUserData().userName}',
                  style: MyTextStyle.customStyle(fontSize: 24.px,color: primary3Color,fontFamily: 'Lora',fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(height: 80.px,),
            Text(StringConstants.welcomeToOurHome,
              style: MyTextStyle.customStyle(fontFamily: 'Buenard',fontSize: 18.px,color: primary3Color,fontWeight: FontWeight.w700),
            ),
            Text(StringConstants.thankForEntrusting,
                style: MyTextStyle.customStyle(fontFamily: 'Buenard',fontSize: 18.px,color: primary3Color,fontWeight: FontWeight.w700) ),
            Text(StringConstants.yourTravelWeKnowHowSpecial,
                style: MyTextStyle.customStyle(fontFamily: 'Buenard',fontSize: 18.px,color: primary3Color,fontWeight: FontWeight.w700) ),
            Text(StringConstants.thoseMemories,
                style: MyTextStyle.customStyle(fontFamily: 'Buenard',fontSize: 18.px,color: primary3Color,fontWeight: FontWeight.w700)),
            SizedBox(height: 50.px,),
            Text(StringConstants.thankYouForChoosing,
                style: MyTextStyle.customStyle(fontFamily: 'Buenard',fontSize: 16.px,color: primary3Color,fontWeight: FontWeight.w700) ),
            Text(StringConstants.travelSustainably,
                style: MyTextStyle.customStyle(fontFamily: 'Buenard',fontSize: 16.px,color: primary3Color,fontWeight: FontWeight.w700) ),
            Spacer(),
            CommonWidgets.gradientButton(
                onPressed: (){
                  controller.creditPointAlertDialog(context );
                },
                text: StringConstants.explore
            ),
          ],
        ),
      )
    );
  }

}
