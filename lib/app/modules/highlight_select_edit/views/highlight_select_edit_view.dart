import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/highlight_select_edit_controller.dart';

class HighlightSelectEditView extends GetView<HighlightSelectEditController> {
  const HighlightSelectEditView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:const Color(0xff3E3E3E),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: CommonWidgets.gradientButton(
            onPressed: (){
              controller.onTapNext();
            },
            text: StringConstants.next,
          buttonMargin: EdgeInsets.only(bottom: 20.px)
        ),
      body:Obx(() {
        controller.count.value;
        return SafeArea(
          child: Stack(
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
                  );
                },
              ),
              Positioned(
                top: 10.px,left: MediaQuery.of(Get.context!).size.width/2-(6*controller.selectFiles.length),
                child: SmoothPageIndicator(
                  controller: controller.pageController,
                  count: controller.selectFiles.length,
                  effect: SwapEffect(
                      dotColor: Colors.black,
                      activeDotColor: primary3Color,
                      dotHeight: 8.px,
                      dotWidth: 8.px,
                      spacing: 4.px
                  ),
                ),
              ),
           /*  Positioned(
                top: 5.px,left: 10.px,right: 10.px,
                child: SizedBox(
                  height: 10.px,
                  child: ListView.builder(
                       scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.selectFiles.length,
                      itemBuilder: (BuildContext context,int index){
                        return Container(
                          height: 4.px,width: 4.px,
                           margin: EdgeInsets.all(5.px),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.px),
                            color:controller.currentFile.value==index?greenColor:Colors.red.withOpacity(0.5)
                          ),
                        );
                      }
                  ),
                ),
              ),*/
              Positioned(
                top: 20.px,left: 10.px,right: 10.px,
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
                  /*  Container(
                      height: 35.px,
                      width: 100.px,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18.px),
                        color: primary3Color
                      ),
                      child: Text(StringConstants.editVideo,style: MyTextStyle.titleStyle16grey,),
                    ) */
                  ],
                ),
              ),
            ],
          ),
        );
      })
    );
  }
}
