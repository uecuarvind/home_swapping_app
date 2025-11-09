import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:get/get.dart';
import 'package:home_swipping/common/common_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/highlight_select_media_controller.dart';

class HighlightSelectMediaView extends GetView<HighlightSelectMediaController> {
  const HighlightSelectMediaView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:blackColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CommonWidgets.gradientButton(
          onPressed: (){
    if(controller.selectedFile.isNotEmpty){
              controller.onTapCreate();
            }else{
              CommonWidgets.showSnackBar(context: context,message:'Please select image at least one image...',status: false);
            }
          },
          text: StringConstants.continueText
      ),
      body: Obx(() {
        controller.count.value;
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.px,vertical: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                    leading: GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: Icon(Icons.close,size: 25.px,color: primary3Color,),
                    ),
                    title:Padding(
                      padding:  EdgeInsets.only(right: 50.px),
                      child: Center(
                        child: CommonWidgets.typingText(text: 'Select Media',style: MyTextStyle.customStyle(
                            fontFamily: 'Lora',fontSize: 24,fontWeight: FontWeight.w700,color: primary3Color
                        ),),
                      ),
                    )
                ),
                Text('Recents',style: MyTextStyle.titleStyle20bw,),

                Text(StringConstants.youHaveGivenAryAccessToASelectNumberOf,style: MyTextStyle.titleStyle13w,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(StringConstants.photoVideo,style: MyTextStyle.titleStyle16bw,),
                    // GestureDetector(
                    //   onTap: (){
                    //    // controller.clickOnManage();
                    //   },
                    //     child: Text(StringConstants.manage,style: MyTextStyle.titleStyle16bw,))
                  ],
                ),
                SizedBox(height: 10.px,),
                Expanded(
                  // child:Platform.isAndroid?showRecentImages():
                  // showSelectedImage(),
                  child:showRecentImages() ,

                ),
              ],
            ),
          ),
        );
      })
    );
  }

  Widget showRecentImages(){
    return
      GridView.builder(
          //controller: widget.scrollCtr,
          itemCount: controller.mediaList.length,
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){
                controller.changeSelected(index,context);
              },
              child: Container(
                  decoration: const BoxDecoration(
                      //borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: primary3Color
                  ),
                  clipBehavior: Clip.hardEdge,
                  margin: const EdgeInsets.all(1),
                  child:Stack(
                    children: [
                      controller.mediaList[index],
                      Positioned(
                          top: 5,right: 5,
                          child:Icon(controller.imageSelected(index)?Icons.check_circle:Icons.circle_outlined,size: 20.px,
                          color: primary3Color,)

                      ),
                    ],
                  )
                //child: _mediaList[index]
              ),
            );
          });
  }
  /*
  Widget showSelectedImage(){
    return
      GridView.builder(
        //controller: widget.scrollCtr,
          itemCount: controller.mediaList.length,
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){
                controller.changeSelected(index);
              },
              child: Container(
                  decoration: const BoxDecoration(
                    //borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: primary3Color
                  ),
                  clipBehavior: Clip.hardEdge,
                  margin: const EdgeInsets.all(1),
                  child:Stack(
                    children: [
                      controller.mediaList[index],
                      Positioned(
                          top: 5,right: 5,
                          child:Icon(controller.imageSelected(index)?Icons.check_circle:Icons.circle_outlined,size: 20.px,
                            color: primary3Color,)

                      ),
                    ],
                  )
                //child: _mediaList[index]
              ),
            );
          });
  } */
}
