import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
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
        //margin: EdgeInsets.only(top: 200.px),
        height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(ImageConstants.imgBackground),fit: BoxFit.cover)
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 200.px),
                child: CommonWidgets.appImagesView(imagePath: IconConstants.icOk,height: 142.px,width: 142.px)),
            SizedBox(height: 10.px,),
            Text('Congrats ${controller.name}',
              style: MyTextStyle.customStyle(fontSize: 24.px,color: primary3Color,fontFamily: 'Coiny'),
            ),
            SizedBox(height: 20.px,),
            Text(StringConstants.welcomeToOurHome,
              style: MyTextStyle.customStyle(fontFamily: 'Lora',fontSize: 18.px,color: primary3Color),
            ),
            Text(StringConstants.thankForEntrusting,
              style: MyTextStyle.customStyle(fontFamily: 'Lora',fontSize: 18.px,color: primary3Color),
            ),
            Text(StringConstants.yourTravelWeKnowHowSpecial,
              style: MyTextStyle.customStyle(fontFamily: 'Lora',fontSize: 18.px,color: primary3Color),
            ),
            Text(StringConstants.thoseMemories,
              style: MyTextStyle.customStyle(fontFamily: 'Lora',fontSize: 18.px,color: primary3Color),
            ),
            SizedBox(height: 20.px,),
            Text(StringConstants.thankYouForChoosing,
              style: MyTextStyle.customStyle(fontFamily: 'Lora',fontSize: 18.px,color: primary3Color),
            ),
            Text(StringConstants.travelSustainably,
              style: MyTextStyle.customStyle(fontFamily: 'Lora',fontSize: 18.px,color: primary3Color),
            ),
            Spacer(),
            GestureDetector(
              onTap: (){
                controller.creditPointAlertDialog(context);
              },
              child: Container(
                margin: EdgeInsets.only(left: 15.px,right: 15.px),
                height: 50.px,width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border.all(color: labelColor,width: 2.px),
                    borderRadius: BorderRadius.circular(100.px),
                    color: primary3Color
                ),
                child: Center(
                  child: Text(StringConstants.explore,
                    style: MyTextStyle.customStyle(color: labelColor,fontSize: 16.px,fontFamily: 'Lora'),),
                ),
              ),
            ),
            SizedBox(height: 30.px,),
          ],
        ),
      )
    );
  }

}
