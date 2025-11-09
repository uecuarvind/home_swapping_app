import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:get/get.dart';
import 'package:home_swipping/app/data/constants/icons_constant.dart';
import 'package:home_swipping/app/data/constants/string_constants.dart';
import 'package:home_swipping/common/MyTextStyle.dart';
import 'package:home_swipping/common/colors.dart';
import 'package:home_swipping/common/common_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../data/constants/image_constants.dart';
import '../controllers/share_space_tape_controller.dart';

class ShareSpaceTapeView extends GetView<ShareSpaceTapeController> {
  const ShareSpaceTapeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:const Color(0xff3E3E3E),
      body:Obx((){
        controller.count.value;
        return Stack(
          alignment: Alignment.center,
          children: [
            // Image.file(
            //   controller.selectFiles[controller.currentIndex.value],
            //   width: MediaQuery.of(context).size.width,
            //   height: MediaQuery.of(context).size.height,
            //   fit: BoxFit.cover,
            // ),
            CarouselSlider(
              carouselController:controller.sliderController ,
              items: List.generate(
                  controller.selectFiles.length,
                      (index) =>Card(
                    shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(15.px),topLeft: Radius.circular(15.px))
                    ) ,
                    clipBehavior: Clip.hardEdge,
                    margin: EdgeInsets.zero,
                    child: Image.file(
                      controller.selectFiles[controller.currentIndex.value],
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      fit: BoxFit.cover,
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
            ),
            Positioned(
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
            Positioned(
              right: 20.px,top: 60.px,
              child:  GestureDetector(
              onTap: (){
                // controller.clickOnSampleVideo();
              },
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: EdgeInsets.only(left: 10.px,top: 15.px),
                  height: 45.px,width: 150.px,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(23.px),
                      color: primary3Color.withOpacity(0.3)
                  ),
                  child: Center(
                    child: Text('Set Cover Photo',
                      style: MyTextStyle.customStyle(color: primary3Color,fontSize: 16.px,fontFamily: 'Lora',fontWeight: FontWeight.w500),),
                  ),
                ),
              ),
            ),),
            Positioned(
              bottom: 0.px,left: 15.px,right: 15.px,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  Align(
                    alignment: Alignment.centerRight,
                    child: CommonWidgets.gradientButton(
                      width: 150.px,
                      height: 50.px,
                      wantContentSizeButton: true,
                      onPressed: (){
                        controller.clickOnShareButton();
                      },
                      text: StringConstants.share,

                    ),
                  ),
                  Text('drag + drop to rearrange',style: MyTextStyle.customStyle(
                    fontWeight: FontWeight.w700,fontSize: 14,fontFamily: 'Lora',color: primary3Color
                  ),),
                  SizedBox(height: 10.px,),
                  SizedBox(
                    height: 100.px,
                    child: ReorderableListView.builder(
                      itemCount: controller.selectFiles.length+1,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context,index){
                          return index==0?GestureDetector(
                            key: Key('add_icon'),
                            onTap: (){
                              controller.pickGallery();
                            },
                            child: Container(
                              width: 55.px,
                              height: 82.px,
                              alignment: Alignment.center,
                              margin:EdgeInsets.symmetric(horizontal: 5.px,vertical: 5.px),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.px),
                                color:  const Color(0xFFDADADA).withOpacity(0.4),
                                border: Border.all(color: primary3Color.withOpacity(0.5))
                              ),
                              child: Container(
                                height: 24.px,width: 24.px,

                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.px),
                                    border: Border.all(color: primary3Color,width: 2)
                                  ),
                                  child: Icon(Icons.add,size: 20.px,color: primary3Color,)),
                            ),
                          ):
                          GestureDetector(
                            key: Key('$index'),
                            onTap: (){
                              controller.currentIndex.value=index-1;
                              controller.autoPlay.value=false;
                              controller.increment();
                            },
                            child: Container(
                              margin:EdgeInsets.symmetric(horizontal: 5.px,vertical: 5.px),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.px)
                              ),
                              clipBehavior: Clip.hardEdge,
                              child: Image.file(
                                controller.selectFiles[index-1],
                                width: 55.px,
                                height: 82.px,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );

                        },
                      onReorder: (int oldIndex, int newIndex) {
                        controller.changeSelectedImageOrder(oldIndex-1,newIndex-1);

                      },

                    ),
                  ),

                  SizedBox(height: 20.px,),
                ],
              ),
            ),
          ],
        );
      })
    );
  }
}
