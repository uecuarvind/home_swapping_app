import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:home_swipping/common/MyTextStyle.dart';
import 'package:home_swipping/common/colors.dart';
import 'package:home_swipping/common/common_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../data/constants/image_constants.dart';
import '../controllers/that_it_controller.dart';

class ThatItView extends GetView<ThatItController> {
  const ThatItView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: blackColor,
      body: Obx((){
        controller.count.value;
        return  Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.zero,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImageConstants.imgBackgroundStar),
                  fit: BoxFit.fill
              )
          ),
          child: SafeArea(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15.px,vertical: 100.px),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonWidgets.typingText(
                    text: 'That’s it!',
                    style: MyTextStyle.customStyle(fontSize: 36,fontFamily: 'Lora',
                    fontWeight: FontWeight.w500,color: primary3Color),
                  ),
                  CommonWidgets.typingText(
                    text: 'Thanks for being a part of a\n'
                      'community of ary members\n'
                  'helping to build the future\n'
                  'of mindful travel.\n'
                  'Together.',
                    style: MyTextStyle.customStyle(fontSize: 20,fontFamily: 'Lora',
                        fontWeight: FontWeight.w500,color: primary3Color),
                   pause:  const Duration(milliseconds: 500),
                  ),
                ],
              ),
            ),
          ),
        );
      })
    );
  }
}
