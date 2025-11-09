import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:home_swipping/app/data/constants/image_constants.dart';
import 'package:home_swipping/common/colors.dart';
import 'package:home_swipping/common/common_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class WelcomeController extends GetxController {
  //TODO: Implement WelcomeController
  final name='John Deo'.obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  onClickExplore(){
    Get.toNamed(Routes.SWAP_STAYS);
  }

 creditPointAlertDialog(BuildContext context){
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            content: Container(
              height: MediaQuery.of(context).size.height/2,width: MediaQuery.of(context).size.width-20.px,
              padding: EdgeInsets.all(20.px),
              decoration: BoxDecoration(
                color: primary3Color,
                borderRadius:  BorderRadius.circular(24.px),
              ),
              clipBehavior: Clip.hardEdge,
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 30.px,vertical: 15.px),
                        child: CommonWidgets.appImagesView(
                            imagePath: ImageConstants.imgTicket,
                          height: 120.px,width: 120.px
                        ),
                      ),
                      Positioned(
                          top: 20.px,right: 0.px,
                          child: Text('x7',style: MyTextStyle.customStyle(fontWeight: FontWeight.w600,
                          fontFamily: 'Lora',fontSize: 30.px,color: textGolden),)
                      )
                    ],
                  ),
                  Text(StringConstants.areYourBagsPackedYetHere7Credits,style: MyTextStyle.customStyle(fontWeight: FontWeight.w700,
                      fontFamily: 'Buenard',fontSize: 24.px,color: textGrey),textAlign: TextAlign.center,),
                 SizedBox(height: 20.px,),

                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.px)
                    ),
                    margin: EdgeInsets.only(left: 10.px,right: 10.px),
                    elevation: 10.px,
                    child: CommonWidgets.commonElevatedButton(
                      onPressed: (){
                        onClickExplore();
                      },

                      child: Text(StringConstants.explore,style: MyTextStyle.customStyle(fontSize: 18,fontWeight: FontWeight.w700,
                          color: text2Color,fontFamily: 'Lora'),),
                      borderRadius: 25.px,
                      buttonColor: primary3Color,
                    ),
                  ),
                  TextButton(
                      onPressed: (){
                        Get.toNamed(Routes.CREDIT_SYSTEM);
                      },
                      child: Text(
                        StringConstants.learnMore,
                        style: MyTextStyle.customStyle(color: labelColor,fontSize: 16.px,fontFamily: 'Lora',fontWeight: FontWeight.w700),
                      )
                  )
                ],
              ),
            ),
          );
        },
    );
 }
}
