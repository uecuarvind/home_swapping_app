import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:home_swipping/app/data/constants/string_constants.dart';
import 'package:home_swipping/common/MyTextStyle.dart';
import 'package:home_swipping/common/colors.dart';
import 'package:home_swipping/common/common_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/share_space_tape_controller.dart';

class ShareSpaceTapeView extends GetView<ShareSpaceTapeController> {
  const ShareSpaceTapeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:const Color(0xff3E3E3E),
      body:SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Padding(
              padding:  EdgeInsets.only(top: 10.px,left: 10.px,right: 10.px,),
              child: GestureDetector(
                onTap:(){
                  Get.back();
                },
                child: Container(
                  height: 30.px,
                  width: 30.px,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.px),
                    color: Colors.black,
                  ),
                  child: Icon(Icons.arrow_back_ios_new_outlined,size: 20.px,color: primary3Color,),
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 10.px,bottom: 5.px),
              child: Text(StringConstants.loveYourSpace,
                style: MyTextStyle.customStyle(color: primary3Color,fontFamily: 'Lora',fontSize: 15,fontWeight: FontWeight.w800),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,height:500.px,
              child: CarouselSlider(
                //carouselController:controller.pageController ,
                items: List.generate(
                    controller.selectFiles.length,
                        (index) =>Card(
                      shape:RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(15.px),topLeft: Radius.circular(15.px))
                      ) ,
                      clipBehavior: Clip.hardEdge,
                      margin: EdgeInsets.zero,
                      child: Image.file(
                        controller.selectFiles[index],
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
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 1),
                  autoPlayAnimationDuration:
                  const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.easeInOut,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,

                ),
              ),
              // PageView.builder(
              //     controller: controller.pageController,
              //     itemCount: controller.selectFiles.length,
              //     itemBuilder: (context, index) {
              //       return Container(
              //         width: MediaQuery.of(context).size.width,height:500.px,
              //         decoration: BoxDecoration(
              //             borderRadius: BorderRadius.only(topLeft: Radius.circular(15.px),topRight: Radius.circular(15.px))
              //         ),
              //         clipBehavior: Clip.hardEdge,
              //         child: Image.file(controller.selectFiles[index],
              //           width: MediaQuery.of(context).size.width,height:500.px,
              //           fit: BoxFit.cover,
              //         ),
              //       );
              //     },
              // ),
            ),
            SizedBox(height: 10.px,),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: (){
                      controller.clickOnEditButton();
                    },
                    child: Text(StringConstants.edit,style: MyTextStyle.titleStyle18bw,)
                ),
                GestureDetector(
                  onTap: (){
                    controller.clickOnShareButton();
                  },
                  child: Container(
                    height: 40.px,width: 100.px,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.px),
                        color: primary3Color
                    ),
                    child: Center(
                      child: Text(StringConstants.share,
                        style: MyTextStyle.customStyle(color: labelColor,fontSize: 16.px,fontFamily: 'Lora'),),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.px,),
          ],
        ),
      )
    );
  }
}
