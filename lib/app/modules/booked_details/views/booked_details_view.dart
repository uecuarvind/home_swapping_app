import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:home_swipping/app/data/constants/string_constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/dateRangeFormate.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/image_constants.dart';
import '../controllers/booked_details_controller.dart';

class BookedDetailsView extends GetView<BookedDetailsController> {
  const BookedDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: backgroundColor,
        body: Obx((){
          controller.count.value;
          return SizedBox(
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
                      const Duration(milliseconds: 10),
                      autoPlayCurve: Curves.easeInOut,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.01,
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
                  top: 60.px,left: 20.px,right: 20.px,
                  child: Obx((){
                    controller.currentIndex.value;
                    return  DotsIndicator(
                      dotsCount: controller.bookingRequests.house?.houseImagesUrls?.length??0,
                      position: controller.currentIndex.value,
                      decorator: DotsDecorator(
                          color: const Color(0xFFF7F7F73D).withOpacity(0.3), // Inactive color
                          activeColor: primary3Color,
                          size: Size(8.px,8.px ),
                          spacing: EdgeInsets.all(4.px)
                      ),
                    );
                  }),
                ),
                Positioned(
                  top: 55.px,left: 20.px,
                  child: GestureDetector(
                  onTap: (){
                    print('jfjakjkdj.......');
                    controller.clickOnBackIcon();
                  },
                  child: CommonWidgets.appImagesView(imagePath: IconConstants.icBack,
                    height: 40.px,width: 40.px
                  ),
                ),),
                //
                // Positioned(
                //   top: 250.px,left: 20.px,right: 20.px,
                //   child: Column(
                //     children: [
                //       SizedBox(height: 30.px,),
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           Text(controller.bookingRequests.lookingFor??'',style: MyTextStyle.titleStyle18bw,),
                //           SizedBox(width: 5.px,),
                //           CommonWidgets.appImagesView(
                //               imagePath: IconConstants.icSwap,
                //               height: 40.px,width: 40.px)
                //         ],
                //       ),
                //
                //
                //     ],
                //   ),
                // ),
                Positioned(
                  bottom: 80.px,left: 15.px,right: 15.px,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.px,vertical: 15.px),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.px),
                        image: const DecorationImage(
                            image: AssetImage(ImageConstants.imgTripBackground,
                            ),
                          fit: BoxFit.fill
                        )
                    ),
                    clipBehavior: Clip.hardEdge,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Your stay at ${controller.bookingRequests.house?.houseOwner?.name}’ space',style: MyTextStyle.titleStyle20bw,),
                        SizedBox(height: 10.px,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.location_on,size: 20.px,color: primary3Color,),
                            SizedBox(width: 5.px,),
                            Text(controller.bookingRequests.house?.city??"",style: MyTextStyle.customStyle(fontFamily: 'Lora',color:primary3Color,fontSize: 12.px,fontWeight: FontWeight.w400),
                              maxLines: 2,overflow: TextOverflow.ellipsis,),
                          ],
                        ),
                        SizedBox(height: 10.px,),
                        Divider(thickness: 1.px,color: primary3Color.withOpacity(0.2),),
                        SizedBox(height: 10.px,),
                        Text('Check In Details',style: MyTextStyle.titleStyle16bw,),
                        SizedBox(height: 5.px,),
                        Text(controller.bookingRequests.startDate!=null?DateRangeFormat.formatDateRange(controller.bookingRequests.startDate.toString(),controller.bookingRequests.endDate.toString()):"",style: MyTextStyle.titleStyle14bw,),
                        SizedBox(height: 20.px,),
                        Text('Home Rules',style: MyTextStyle.titleStyle16bw,),
                        SizedBox(height: 10.px,),
                        Text("Contrary to popular belief, Lorem Ipsum is not simply random text",style: MyTextStyle.customStyle(
                          fontSize: 12,fontWeight: FontWeight.w400,fontFamily: 'Lora',color: primary3Color
                        ),),
                        SizedBox(height: 10.px,),
                        Divider(thickness: 1.px,color: primary3Color.withOpacity(0.2),),
                        SizedBox(height: 20.px,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Row(
                              children: [
                                CommonWidgets.appImagesView(
                                    imagePath: IconConstants.icKey,
                                    height: 25.px,width: 25.px
                                ),
                                SizedBox(width: 5.px,),
                                Text('Get inside',style: MyTextStyle.titleStyle12bw,),
                              ],
                            ),
                            Row(
                              children: [
                                CommonWidgets.appImagesView(
                                    imagePath: IconConstants.icWifi2,
                                    height: 25.px,width: 25.px,
                                    color: primary3Color
                                ),
                                Text('Wifi',style: MyTextStyle.titleStyle14bw,),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(text: 'Name - ',style: MyTextStyle.titleStyle12w),
                                      TextSpan(
                                        text: 'James model',
                                        style:MyTextStyle.titleStyle12bw,
                                      ),
                                    ],
                                  ),
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(text: 'Password - ',style: MyTextStyle.titleStyle12w),
                                      TextSpan(
                                        text: 'Jame\$@123',
                                        style:MyTextStyle.titleStyle12bw,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 20.px,),
                        Divider(thickness: 1.px,color: primary3Color.withOpacity(0.2),),
                        SizedBox(height: 30.px,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(controller.bookingRequests.house?.houseOwner?.name??"",style: MyTextStyle.titleStyle16bw,),
                            // GestureDetector(
                            //   onTap: (){
                            //     controller.clickOnMessageIcon();
                            //   },
                            //   child: CommonWidgets.appImagesView(
                            //       imagePath: IconConstants.icChat,height: 60.px,width: 60.px),
                            // ),
                            CommonWidgets.gradientButton(
                                wantContentSizeButton: true,
                                width: 120.px,
                                height: 35.px,
                                onPressed:  (){
                                  controller.clickOnMessageIcon();
                                },
                                text: StringConstants.connect
                            )

                          ],
                        ),
                        SizedBox(height: 20.px,),
                        Divider(thickness: 1.px,color: primary3Color.withOpacity(0.2),),
                        SizedBox(height: 20.px,),
                        Align(
                          alignment: Alignment.center,
                          child: Text("Cancel Trip",style: MyTextStyle.customStyle(fontWeight: FontWeight.w700,fontFamily: 'Lora',fontSize: 14.px,
                          color: const Color(0xFFFAAAAA)),),
                        ),
                        SizedBox(height: 10.px,),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        })
    );
  }
}
