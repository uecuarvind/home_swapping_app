import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/request_accept_controller.dart';

class RequestAcceptView extends GetView<RequestAcceptController> {
  const RequestAcceptView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton:Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.px)
          ),
          margin: EdgeInsets.only(left: 30.px,right: 30.px),
          elevation: 10.px,
          child: CommonWidgets.commonElevatedButton(
            onPressed: (){
              controller.clickOnTripDetailButton();
            },

            child: Text(StringConstants.tripDetails,style: MyTextStyle.customStyle(fontSize: 16,fontWeight: FontWeight.w700,
                color: textGolden,fontFamily: 'Lora'),),
            borderRadius: 25.px,
            buttonColor: primary3Color,
          ),
        ),
        body: Obx((){
          controller.count.value;
          return Stack(
            alignment: Alignment.center,
            children: [
              CommonWidgets.appImagesView(
                imagePath: ImageConstants.imgSampleVideo9,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonWidgets.appImagesView(
                      imagePath: ImageConstants.imgAcceptRequest,
                    height: 256.px,width: 256.px
                  ),
                  Text('Congrats! ',style: MyTextStyle.customStyle(fontSize: 36,fontWeight: FontWeight.w400,
                      color:primary3Color,fontFamily: 'Lora'),),
                  SizedBox(height: 50.px,),
                  Text('Your trip is booked!',style: MyTextStyle.customStyle(fontSize: 24,fontWeight: FontWeight.w700,
                      color:primary3Color,fontFamily: 'Lora'),),
                  SizedBox(height: 100.px,),
                ],
              )

            ],
          );
        })
    );
  }
}
