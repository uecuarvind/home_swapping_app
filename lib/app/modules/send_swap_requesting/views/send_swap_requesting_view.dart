import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:home_swipping/app/data/constants/image_constants.dart';
import 'package:home_swipping/common/colors.dart';
import 'package:home_swipping/common/common_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../controllers/send_swap_requesting_controller.dart';

class SendSwapRequestingView extends GetView<SendSwapRequestingController> {
  const SendSwapRequestingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Obx((){
        controller.count.value;
        return Stack(
          alignment: Alignment.center,
          children: [
            CommonWidgets.appImagesView(
                imagePath: ImageConstants.imgSendRequestLoading,
            height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('submitting request ',style: MyTextStyle.customStyle(fontSize: 30,fontWeight: FontWeight.w500,
                    color:primary3Color,fontFamily: 'Lora'),),
                SizedBox(height: 30.px,),
                CupertinoActivityIndicator(
                  radius: 15.0.px, // Customize the size
                  animating: true, // Control animation
                  color:primary3Color, // Customize color
                )
              ],
            )

          ],
        );
      })
    );
  }
}
