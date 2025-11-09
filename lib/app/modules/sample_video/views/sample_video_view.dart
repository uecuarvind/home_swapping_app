import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:home_swipping/common/common_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/sample_video_controller.dart';

class SampleVideoView extends GetView<SampleVideoController> {
  const SampleVideoView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:backgroundColor,
        body:Obx(() {
          controller.count.value;
          return Stack(
            children: [
              /*
            CarouselSlider(
              carouselController:controller.pageController ,
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
                autoPlay: false,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration:
                const Duration(milliseconds: 2000),
                autoPlayCurve: Curves.easeInOut,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,

              ),
            ),
            */
              PageView.builder(
                controller: controller.pageController,
                itemCount: controller.selectFiles.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.zero,
                    child: CommonWidgets.appImagesView(
                      imagePath:controller.selectFiles[index],
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      fit: BoxFit.cover,
                      borderRadius:0.px
                    ),
                  );
                },
              ),
              Positioned(
                top: 70.px,left: MediaQuery.of(Get.context!).size.width/2-(6*controller.selectFiles.length),
                child: SmoothPageIndicator(
                  controller: controller.pageController,
                  count: controller.selectFiles.length,
                  effect: SwapEffect(
                      dotColor: primary3Color.withOpacity(0.5),
                      activeDotColor: primary3Color,
                      dotHeight: 8.px,
                      dotWidth: 8.px,
                      spacing: 5.px
                  ),
                ),
              ),
              Positioned(
                top: 30.px,left: 10.px,right: 10.px,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
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

                  ],
                ),
              ),
            ],
          );
        })
    );
  }
}
