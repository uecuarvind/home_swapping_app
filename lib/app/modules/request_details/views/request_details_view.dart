import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:home_swipping/app/data/constants/string_constants.dart';
import 'package:home_swipping/common/dateRangeFormate.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/image_constants.dart';
import '../controllers/request_details_controller.dart';

class RequestDetailsView extends GetView<RequestDetailsController> {
  const RequestDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: backgroundColor,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Text("Cancel Trip",style: MyTextStyle.titleStyle16bw,),
        body: Obx((){
          controller.count.value;
          return ListView(
            padding: EdgeInsets.zero,
            children: [

              SizedBox(
                height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [


                    CarouselSlider(
                      carouselController:controller.sliderController ,
                      items: List.generate(
                          controller.bookingRequests.house?.houseImagesUrls?.length??0,
                              (index) =>Container(
                            child: CommonWidgets.imageView(
                                image:controller.bookingRequests.house?.houseImagesUrls?[index]??'',
                                height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover
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
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration:
                          const Duration(milliseconds: 2000),
                          autoPlayCurve: Curves.easeInOut,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.3,
                          scrollDirection: Axis.horizontal,
                          onPageChanged: (val, _) {
                            controller.currentIndex.value=val;
                          }

                      ),
                    ),

                    CommonWidgets.appImagesView(
                        height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,
                        imagePath: ImageConstants.imgBlackBackground,
                        borderRadius: 0.px
                    ),
                    Positioned(
                      top: 50.px,left: 20.px,right: 20.px,
                      child: Column(
                        children: [
                          SizedBox(height: 10.px,),

                          Obx((){
                            controller.currentIndex.value;
                            return  DotsIndicator(
                              dotsCount: controller.bookingRequests.house?.houseImagesUrls?.length??0,
                              position: controller.currentIndex.value,
                              decorator: DotsDecorator(
                                  color: Colors.black, // Inactive color
                                  activeColor: primary3Color,
                                  size: Size(8.px,8.px ),
                                  spacing: EdgeInsets.all(4.px)
                              ),
                            );
                          }),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Get.back();
                                },
                                child: Container(
                                    height:35.px,width: 35.px,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: primary3Color,
                                        borderRadius: BorderRadius.circular(18.px)
                                    ),
                                    child:Icon(Icons.arrow_back_ios_new,size: 25.px,color: textGolden,)
                                ),
                              ),

                            ],
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      top: 320.px,left: 20.px,right: 20.px,
                      child: Column(
                        children: [
                          SizedBox(height: 10.px,),
                          Text("Paris 8th Arrondissement",style: MyTextStyle.titleStyle16bw,),
                          SizedBox(height: 30.px,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(controller.bookingRequests.lookingFor??'',style: MyTextStyle.titleStyle18bw,),
                              SizedBox(width: 5.px,),
                              CommonWidgets.appImagesView(
                                  imagePath: IconConstants.icSwap,
                              height: 40.px,width: 40.px)
                            ],
                          ),


                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 100.px,left: 20.px,right: 20.px,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.px,vertical: 15.px),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.px),
                          color: primary3Color.withOpacity(0.3)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(controller.bookingRequests.startDate!=null?DateRangeFormat.formatDateRange(controller.bookingRequests.startDate.toString(),controller.bookingRequests.endDate.toString()):"",style: MyTextStyle.titleStyle16bw,),
                            Divider(thickness: 1.px,color: primary3Color.withOpacity(0.5),),
                            Text('Address',style: MyTextStyle.titleStyle16w,),
                            SizedBox(height: 10.px,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.location_on,size: 20.px,color: primary3Color,),
                                SizedBox(width: 5.px,),
                                Text(controller.bookingRequests.house?.city??"",style: MyTextStyle.customStyle(fontFamily: 'Lora',color:primary3Color,fontSize: 12.px,fontWeight: FontWeight.w500),
                                maxLines: 2,overflow: TextOverflow.ellipsis,),
                              ],
                            ),
                            Divider(thickness: 1.px,color: primary3Color.withOpacity(0.5),),
                            Text('Home Rules',style: MyTextStyle.titleStyle16w,),
                            SizedBox(height: 10.px,),
                            Text("Contrary to popular belief, Lorem Ipsum is not simply random text",style: MyTextStyle.titleStyle12w,),
                            SizedBox(height: 10.px,),
                            Divider(thickness: 1.px,color: primary3Color.withOpacity(0.5),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(controller.bookingRequests.house?.houseOwner?.name??"",style: MyTextStyle.titleStyle16bw,),
                                GestureDetector(
                                  onTap: (){
                                    controller.clickOnMessageIcon();
                                  },
                                  child: CommonWidgets.appImagesView(
                                      imagePath: IconConstants.icChat,height: 60.px,width: 60.px),
                                )

                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.px,),

            ],
          );
        })
    );
  }
}
