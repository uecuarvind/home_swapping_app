import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:home_swipping/app/data/constants/icons_constant.dart';
import 'package:home_swipping/app/data/constants/image_constants.dart';
import 'package:home_swipping/app/data/constants/string_constants.dart';
import 'package:home_swipping/common/MyTextStyle.dart';
import 'package:home_swipping/common/colors.dart';
import 'package:home_swipping/common/common_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/finding_homes_controller.dart';

class FindingHomesView extends GetView<FindingHomesController> {
  const FindingHomesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
          body:Container(
            height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImageConstants.imgBackground),
                  fit: BoxFit.cover
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(StringConstants.findingHomesWeThink,
                  style: MyTextStyle.customStyle(fontSize: 24.px,fontFamily: 'Lora',color: primary3Color),
                ),
                Text(StringConstants.thinkYouWould,
                  style: MyTextStyle.customStyle(fontSize: 24.px,fontFamily: 'Lora',color: primary3Color),
                ),
                SizedBox(height: 15.px,),
                Container(
                  margin: EdgeInsets.only(right: 120.px),
                  child: CommonWidgets.appImagesView(
                      imagePath: IconConstants.icThinking,fit: BoxFit.cover,
                      height: 65,width: 70
                  ),
                ),
                CommonWidgets.appImagesView(
                    imagePath: IconConstants.icHouseRules,fit: BoxFit.cover,
                    height: 126,width: 120
                ),
              ],),
          )
      );
    });
  }
}
