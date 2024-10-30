import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:home_swipping/app/data/constants/image_constants.dart';
import 'package:home_swipping/common/colors.dart';
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
              decoration: BoxDecoration(
                //color: primary3Color,
                image: const DecorationImage(
                    image: AssetImage(ImageConstants.imgCreditPoints),
                  fit: BoxFit.cover
                ),
                borderRadius:  BorderRadius.circular(24.px),
              ),
              clipBehavior: Clip.hardEdge,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 10.px,left: 10.px,right: 10.px,
                    child: Column(
                      children: [
                        InkWell(
                          onTap: (){
                            onClickExplore();
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 30.px,right: 30.px),
                            height: 40.px,width: MediaQuery.of(context).size.width/2-10.px,
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
                ],
              ),
            ),
          );
        },
    );
 }
}
