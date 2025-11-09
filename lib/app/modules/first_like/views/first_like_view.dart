import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:home_swipping/app/data/constants/icons_constant.dart';
import 'package:home_swipping/app/data/constants/image_constants.dart';
import 'package:home_swipping/common/common_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/first_like_controller.dart';

class FirstLikeView extends GetView<FirstLikeController> {
  const FirstLikeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
     backgroundColor: blackColor,
      body: Obx((){
        controller.count.value;
        return Container(
          height: height,width: width,
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(ImageConstants.imgRocket,
            ),fit: BoxFit.fill)
          ),
          child: Column(
            children: [
              // SizedBox(
              //   height: height,width: width,
              //   child: CommonWidgets.appImagesView(
              //       imagePath: ImageConstants.imgFirstLikeBackground,
              //   height:height,width: width)
              // ),
              // Positioned(
              //     top: 50.px,left: 20.px,
              //     child: GestureDetector(
              //       onTap: (){
              //         Get.back();
              //       },
              //       child: Container(
              //           height:35.px,width: 35.px,
              //           alignment: Alignment.center,
              //           decoration: BoxDecoration(
              //               color: primary3Color,
              //               borderRadius: BorderRadius.circular(18.px)
              //           ),
              //           child:Icon(Icons.arrow_back_ios_new,size: 25.px,color: textGolden,)
              //       ),
              //     )
              // ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 120.px,),
                  CommonWidgets.appImagesView(
                      imagePath: IconConstants.icRobort,
                  height: 90.px,width: 62.px),
                  SizedBox(height: 12.px,),
                  Center(
                    child: Text(
                      StringConstants.neverMissAChanceToTravel,
                      style: MyTextStyle.customStyle(
                          fontSize: 24.px,
                          color: primary3Color,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Lora'
                      ),textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 30.px,)
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CommonWidgets.gradientButton(
                      onPressed:  (){
                        controller.clickOnEnableNotification();
                      },
                    text: StringConstants.enableNotifications,

                  ),

                  SizedBox(height: 12.px,),
                  Text(
                    StringConstants.maybeLater,
                    style: MyTextStyle.customStyle(
                        fontSize: 18.px,
                        color: primary3Color,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Buenard'
                    ),
                  ),
                  SizedBox(height: 40.px,),
                ],
              ),
            ],
          ),
        );
      })
    );
  }
}
