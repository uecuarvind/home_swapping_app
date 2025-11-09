import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/space_tape_edit_controller.dart';

class SpaceTapeEditView extends GetView<SpaceTapeEditController> {
  const SpaceTapeEditView({super.key});
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

              Container(
                width: MediaQuery.of(context).size.width,height:500.px,
                margin: EdgeInsets.only(top: 15.px),
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
              ),
              SizedBox(height: 10.px,),
              const Spacer(),
              GestureDetector(
                onTap: (){
                  controller.clickOnShareButton();
                },
                child: Container(
                  height: 50.px,
                  margin: EdgeInsets.symmetric(horizontal: 20.px),
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
              SizedBox(height: 20.px,),
            ],
          ),
        )
    );
  }
}
