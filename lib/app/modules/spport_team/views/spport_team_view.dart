import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:home_swipping/app/data/constants/icons_constant.dart';
import 'package:home_swipping/app/data/constants/image_constants.dart';
import 'package:home_swipping/common/MyTextStyle.dart';
import 'package:home_swipping/common/colors.dart';
import 'package:home_swipping/common/common_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/spport_team_controller.dart';

class SpportTeamView extends GetView<SpportTeamController> {
  const SpportTeamView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: blackColor,
      appBar: CommonWidgets.appBarView(
        color: blackColor,
        title: 'Concierge',centerTitle: true,textStyle: MyTextStyle.customStyle(
          fontFamily: 'Lora',fontSize: 18,color: primary3Color,fontWeight: FontWeight.w700
      ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.px),
        height: 60.px,
        child: Row(
          children: [
            SizedBox(width: 30.px,),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.px,),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.px),
                  color: primary3Color.withOpacity(0.27),
                  border: Border.all(color: Colors.grey.withOpacity(0.8),width: 1.px)
                ),
                child: TextFormField(
                  style: MyTextStyle.customStyle(fontFamily: 'Lora',
                      fontSize: 16,fontWeight: FontWeight.w500,color: primary3Color),
                  decoration: InputDecoration(
                    hintText: 'write a message',
                    hintStyle: MyTextStyle.customStyle(fontFamily: 'Lora',
                    fontSize: 14,fontWeight: FontWeight.w500,color: primary3Color),
                    disabledBorder: InputBorder.none,
                    border: InputBorder.none,
                    enabledBorder:InputBorder.none,

                  ),
                ),
              ),
            ),
            SizedBox(width: 8.px,),
            CommonWidgets.appImagesView(
                imagePath: IconConstants.icRectangularGallery,
                height:34.px,width: 34.px,color: primary3Color
            ),
            SizedBox(width: 8.px,),
            CommonWidgets.appImagesView(
                imagePath: IconConstants.icBlackMic,
                height: 40.px,width: 40.px
            ),
          ],
        ),
      ),

      body: Stack(
        children: [
          SizedBox(width: MediaQuery.of(context).size.width),
          Positioned(
            bottom: 0.px,left: 0.px,right: 0.px,
              child: CommonWidgets.appImagesView(
                  imagePath: ImageConstants.imgBackgroundSpace,
                width: MediaQuery.of(context).size.width
              )
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 15.px,vertical: 10.px),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonWidgets.appImagesView(
                        imagePath: IconConstants.icConnectRobort,
                        height:40.px,width: 40.px),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(15.px),
                        margin: EdgeInsets.only(left: 5.px),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(16.px),
                            bottomRight: Radius.circular(16.px),
                            bottomLeft: Radius.circular(16.px),
                          ),
                          color: primary3Color.withOpacity(0.27),
                          border: Border.all(width: 1.px,color: primary3Color.withOpacity(0.2))
                        ),
                        child: Text('hi I\'m the traveling terrestrial here to take you on your adventures. ask me for any help you need. We’re always here if you need help on your adventures.',
                        style: MyTextStyle.titleStyle14w,),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
