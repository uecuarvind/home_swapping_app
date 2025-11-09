import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:home_swipping/app/data/constants/icons_constant.dart';
import 'package:home_swipping/app/data/constants/string_constants.dart';
import 'package:home_swipping/common/MyTextStyle.dart';
import 'package:home_swipping/common/colors.dart';
import 'package:home_swipping/common/common_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/credit_system_controller.dart';

class CreditSystemView extends GetView<CreditSystemController> {
  const CreditSystemView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: primary3Color,
        backgroundColor: primary3Color,
        leading: InkWell(
          onTap: (){
            Get.back();
          },
            child: Icon(Icons.arrow_back_ios_new_outlined,size: 25.px,color: labelColor)
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(Icons.more_vert_outlined,size: 25.px,color: labelColor),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20.px,right: 20.px),
        child: Column(
          children: [
            SizedBox(height: 30.px,),
            Row(
              children: [
                CommonWidgets.appImagesView(
                    imagePath: IconConstants.icCredit,height: 66.px,width: 66.px,
                  fit: BoxFit.cover
                ),
                SizedBox(width: 10.px,),
                Text(StringConstants.creditSystem,
                  style: MyTextStyle.customStyle(fontSize: 20.px,fontWeight: FontWeight.w700,fontFamily: 'Lora'),
                )
              ],
            ),
            SizedBox(height: 15.px,),
            Text(StringConstants.creditSystemText,
              style: MyTextStyle.customStyle(fontFamily: 'Lora',fontWeight: FontWeight.w700,fontSize: 14.px,color: labelColor),
            ),
          ],
        ),
      )
    );
  }
}
