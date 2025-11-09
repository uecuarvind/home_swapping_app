import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' as math;
import 'package:get/get.dart';
import 'package:home_swipping/app/data/constants/image_constants.dart';
import 'package:home_swipping/app/data/constants/string_constants.dart';
import 'package:home_swipping/common/MyTextStyle.dart';
import 'package:home_swipping/common/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../controllers/highlighte_real_controller.dart';

class HighlighteRealView extends GetView<HighlighteRealController> {
  const HighlighteRealView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: CommonWidgets.appBarView(color: Colors.transparent),
      body: Obx((){
        controller.count.value;
        return Stack(
          alignment: Alignment.center,
          children: [
            CarouselSlider(
              carouselController:controller.sliderController ,
              items: List.generate(
                  controller.simpleImages.length,
                      (index) =>Card(
                    shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(15.px),topLeft: Radius.circular(15.px))
                    ) ,
                    clipBehavior: Clip.hardEdge,
                    margin: EdgeInsets.zero,
                    child: CommonWidgets.appImagesView(
                      imagePath:controller.simpleImages[controller.currentIndex.value],
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      fit: BoxFit.fill,
                    ),
                  )
              ),
              options: CarouselOptions(
                  height: MediaQuery.of(context).size.height,
                  viewportFraction:1.0,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: controller.autoPlay.value,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration:
                  const Duration(milliseconds: 10),
                  autoPlayCurve: Curves.easeInOut,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.1,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (val, _) {
                    controller.currentIndex.value=val;
                  }

              ),
            ),
            Positioned(
              bottom: 0.px,
              child:Opacity(
                opacity: 0.8,
                child: CommonWidgets.appImagesView(imagePath: ImageConstants.imgBlackBackground,
                    height:450.px ,width: MediaQuery.of(context).size.width),
              ),
            ), Positioned(
              top: 0.px,
              child:  Transform.rotate(
                angle: math.pi,
                child: Opacity(
                  opacity: 0.7,
                  child: CommonWidgets.appImagesView(
                      imagePath: ImageConstants.imgBlackBackground,
                      height: 400.px,width: MediaQuery.of(context).size.width
                  ),
                ),
              ),
            ),
            if(!controller.autoPlay.value)
            GestureDetector(
              onTap: (){
                controller.autoPlay.value=true;
                controller.increment();
              },
              child: CommonWidgets.appImagesView(
                  imagePath: IconConstants.icPlay,
                  height: 85.px,width: 85.px),
            ),

            Padding(
              padding:  EdgeInsets.only(left: 25.px,right: 25.px,top: 70.px),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  SizedBox(height: 20.px,),
                  Center(child: CommonWidgets.typingText(text:StringConstants.createHighLite,
                    style: MyTextStyle.customStyle(color: primary3Color,fontSize: 30.px,fontWeight:FontWeight.w500,fontFamily: 'Lora'),),
                  ),
                  Center(child: CommonWidgets.typingText(text:StringConstants.ofYourHome,
                    style: MyTextStyle.customStyle(color: primary3Color,fontSize: 30.px,fontWeight:FontWeight.w500,fontFamily: 'Lora'),),
                  ),
                  SizedBox(height: 20.px,),
                  DotsIndicator(
                    dotsCount: controller.simpleImages.length,
                    position: controller.currentIndex.value,
                    decorator: DotsDecorator(
                        color: primary3Color.withOpacity(0.3), // Inactive color
                        activeColor: primary3Color,
                        size: Size(8.px,8.px ),
                        spacing: EdgeInsets.all(4.px)
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      controller.clickOnSampleVideo();
                    },
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        margin: EdgeInsets.only(left: 10.px,top: 15.px),
                        height: 45.px,width: 120.px,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.px),
                            color: primary3Color.withOpacity(0.3)
                        ),
                        child: Center(
                          child: Text(StringConstants.sampleVideo,
                            style: MyTextStyle.customStyle(color: primary3Color,fontSize: 16.px,fontFamily: 'Lora',fontWeight: FontWeight.w500),),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),

                  Align(
                    alignment: Alignment.centerRight,
                    child: CommonWidgets.gradientButton(
                        width: 170.px,wantContentSizeButton: true,height: 48.px,
                        onPressed: (){
                          controller.clickOnCreateSpaceTape();
                        },
                        text: 'Create mine'
                    ),
                  ),
                  SizedBox(height: 20.px,),
                  SizedBox(
                    height: 90.px,
                    child: ListView.builder(
                        itemCount: controller.simpleImages.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index){
                          return GestureDetector(
                            onTap: (){
                              controller.currentIndex.value=index;
                              controller.autoPlay.value=false;
                              controller.increment();
                            },
                            child: Container(
                              height: 82.px,
                              width: 60.px,
                              margin: EdgeInsets.symmetric(horizontal: 5.px),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.px)
                              ),
                              clipBehavior: Clip.hardEdge,
                              child: CommonWidgets.appImagesView(imagePath: controller.simpleImages[index],
                                height: 82.px,
                                width: 60.px,),
                            ),
                          );
                        }),
                  ),

                  SizedBox(height: 30.px,),

                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
