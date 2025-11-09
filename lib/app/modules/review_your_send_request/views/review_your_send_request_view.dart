import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:home_swipping/app/data/api_constants/api_key_constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/dateRangeFormate.dart';
import '../../../data/api_constants/api_url_constants.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/review_your_send_request_controller.dart';

class ReviewYourSendRequestView
    extends GetView<ReviewYourSendRequestController> {
  const ReviewYourSendRequestView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: blackColor,

        body: Obx((){
          controller.count.value;
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImageConstants.imgExploreBackground),
                    fit: BoxFit.fill
                )
            ),
            child: SafeArea(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 15.px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                        onTap: () {
                          controller.clickOnBackIcon();
                        },
                        child:Container(
                          height: 35.px,width: 35.px,
                          child: CommonWidgets.appImagesView(
                              imagePath: IconConstants.icBack,height: 35.px,width: 35.px,
                              fit: BoxFit.fill,
                            borderRadius: 20.px
                          ),
                        )),
                   SizedBox(height: 40.px,),
                   Align(
                     alignment: Alignment.center,
                     child: Text(StringConstants.yourTripRequestWasSent,style: MyTextStyle.customStyle(
                       fontSize: 24,fontFamily: 'Lora',color: primary3Color,fontWeight: FontWeight.w700
                     ),),
                   ),
                    SizedBox(height: 30.px,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 410.px,
                      margin: EdgeInsets.all(5.px),
                      padding: EdgeInsets.all(3.px),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.px),
                          color: primary3Color
                      ),
                      child: Stack(
                        children: [
                          CommonWidgets.appImagesView(
                              imagePath: ImageConstants.imgTrip,
                              height: 410.px,
                              width: MediaQuery.of(context).size.width,
                              borderRadius: 15.px
                          ),

                          Positioned(
                            top: 10.px,left: 10.px,right: 10.px,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 15.px,vertical: 8.px),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25.px),
                                      color: Colors.black.withOpacity(0.4)
                                  ),
                                  child: Text(DateRangeFormat.formatDateRange(controller.bookingRequests.startDate.toString(), controller.bookingRequests.endDate.toString()),style: MyTextStyle.titleStyle12bw,),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 15.px,vertical: 8.px),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25.px),
                                      color: Colors.black.withOpacity(0.4)
                                  ),
                                  child: Text('In ${DateRangeFormat.dateRangeCount(controller.bookingRequests.startDate.toString(), controller.bookingRequests.endDate.toString())} days',style: MyTextStyle.titleStyle12bw,),
                                ),
                                // CommonWidgets.appImagesView(
                                //     imagePath: IconConstants.icSwap,
                                //     height: 25.px,
                                //     width: 25.px
                                // ),

                              ],
                            ),

                          ),
                          Positioned(
                            bottom: 20.px,left: 10.px,right: 10.px,
                            child: Container(
                              height: 200.px,
                              padding: EdgeInsets.all(15.px),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.px),
                                  image: const DecorationImage(
                                      image: AssetImage(ImageConstants.imgTripBackground,
                                      ))
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CommonWidgets.imageView(
                                          image:controller.bookingRequests.user?.profileimage??'',
                                          height: 32.px,width: 32.px,
                                          borderRadius: BorderRadius.circular(16.px),
                                          defaultNetworkImage: ApiUrlConstants.defaultUserProfile
                                      ),
                                      SizedBox(width: 10.px,),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(controller.bookingRequests.user?.name??'',style: MyTextStyle.customStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Lora',color: primary3Color),
                                              overflow: TextOverflow.ellipsis,),
                                            Text('Entire dome hosted by katrin',style: MyTextStyle.customStyle(fontSize: 12,fontWeight: FontWeight.normal,fontFamily: 'Lora',color: primary3Color),
                                              overflow: TextOverflow.ellipsis,),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(thickness: 1.px,color: primary3Color.withOpacity(0.20),),
                                  Padding(
                                    padding:  EdgeInsets.symmetric(vertical: 5.px),
                                    child: Row(
                                      children: [
                                        Icon(Icons.location_on,size: 25.px,color: primary3Color,),
                                        Expanded(
                                          child: Text(controller.bookingRequests.house?.city??'',style: MyTextStyle.customStyle(fontSize: 12,fontWeight: FontWeight.normal,fontFamily: 'Lora',color: primary3Color),
                                            overflow: TextOverflow.ellipsis,),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(thickness: 1.px,color: primary3Color.withOpacity(0.10),),
                                  Text(controller.bookingRequests.personalNote??'',style: MyTextStyle.titleStyle12w,overflow: TextOverflow.ellipsis,
                                    maxLines: 1,),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    )
                /*   Container(
                      height: 460.px,width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(8.px),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.px),
                        color: primary3Color
                      ),
                      child: Stack(
                        children: [


                          CarouselSlider(
                            carouselController:controller.sliderController ,
                            controller.bookingRequestss: List.generate(
                                controller.bookingRequests.house?.houseImagesUrls?.length??0,
                                    (index) =>Container(
                                  child: CommonWidgets.imageView(
                                      image: controller.bookingRequests.house?.houseImagesUrls![index]??'',
                                      height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,
                                      fit: BoxFit.cover,
                                    borderRadius: BorderRadius.circular(20.px)
                                  ),
                                )
                            ),
                            options: CarouselOptions(
                                height:460.px,
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

                          Positioned(
                            top: 20.px,left: 20.px,right: 20.px,
                            child: Obx((){
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
                          ),
                          Positioned(
                            top: 20.px,right: 20.px,
                            child:  CommonWidgets.appImagesView(
                                imagePath: IconConstants.icSwap,height: 30.px,width: 30.px
                            ),
                          ),
                          Positioned(
                            bottom: 5.px,left: 20.px,right: 20.px,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(controller.bookingRequests.house?.houseOwner?.name??"",style: MyTextStyle.customStyle(fontFamily: 'Buenard',fontSize: 24.px,color:primary3Color,fontWeight: FontWeight.w700),),

                                SizedBox(height: 10.px,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(horizontal: 15.px,vertical: 8.px),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(30.px),
                                            color: primary3Color.withOpacity(0.3)
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Icon(Icons.location_on,size: 20.px,color: primary3Color,),
                                            Flexible(
                                              child: Text(controller.bookingRequests.house?.city??"",style: MyTextStyle.customStyle(fontFamily: 'Lora',color:primary3Color,
                                                  fontSize: 12.px,fontWeight: FontWeight.w700),overflow: TextOverflow.ellipsis,
                                              maxLines: 2,),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 15.px,vertical: 8.px),
                                      margin: EdgeInsets.only(left: 10.px),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30.px),
                                          color: primary3Color.withOpacity(0.3)
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          CommonWidgets.appImagesView(imagePath: IconConstants.icCalender,
                                          height: 20.px,width: 20.px,color: primary3Color),
                                          SizedBox(width: 5.px,),
                                          Text(controller.bookingRequests.startDate!=null?DateRangeFormat.formatDateRange(controller.bookingRequests.startDate.toString(),controller.bookingRequests.endDate.toString()):"",style: MyTextStyle.customStyle(fontFamily: 'Lora',color:primary3Color,fontSize: 14.px,fontWeight: FontWeight.w700),),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.px,),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.px,),

                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.px),
                      ),
                      color: primary3Color,
                      surfaceTintColor: primary3Color,
                      margin: EdgeInsets.symmetric(horizontal: 5.px,vertical: 10.px),
                      elevation: 10.px,
                      child: Container(
                       width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(15.px),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Your Travel Pod',
                              style: MyTextStyle.customStyle(
                                  fontFamily: "Lora",fontWeight: FontWeight.w700,fontSize: 20,color: textGolden
                              ),
                            ),
                            SizedBox(height: 10.px,),
                            SizedBox(
                              height: 148.px,width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                controller.bookingRequestsCount: controller.bookingRequests.travellingPartners?.length??0,
                                scrollDirection: Axis.horizontal,
                                padding: EdgeInsets.zero,
                                controller.bookingRequestsBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 10,right: 10),
                                    child: Container(
                                      height: 148.px,width: 96.px,
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          color: textGolden.withOpacity(0.2),
                                          borderRadius: BorderRadius.circular(100.px),
                                          border: Border.all(
                                              color: textGolden, width: 3.px
                                          )
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            decoration:BoxDecoration(
                                            borderRadius: BorderRadius.circular(25.px),
                                              border: Border.all(color: primary3Color,width: 4.px)
                                          ),
                                            child: CommonWidgets.imageView(
                                                image:controller.bookingRequests.travellingPartners?[index].imageUrl??'',fit: BoxFit.cover,
                                                width: 50.px, height: 50.px,borderRadius:BorderRadius.circular(100)
                                            ),
                                          ),
                                          SizedBox(width: 5.px,),
                                          Text(
                                            controller.bookingRequests.travellingPartners?[index].name??'',
                                            style: MyTextStyle.customStyle(color: labelColor,fontSize: 14.px,fontFamily: 'Lora',fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            controller.bookingRequests.travellingPartners?[index].relation??'',
                                            style: MyTextStyle.customStyle(color: labelColor,fontSize: 12.px,fontFamily: 'Lora',),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.px),
                    side: BorderSide(color: textGolden,width: 1.px)
                  ),
                  color: primary3Color,
                  surfaceTintColor: primary3Color,
                  margin: EdgeInsets.symmetric(horizontal: 5.px,vertical: 10.px),
                  elevation: 5.px,
                  child: Padding(
                    padding: EdgeInsets.all(15.px),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Personal Note',style: MyTextStyle.titleStyle16b,),
                        SizedBox(height: 10.px,),
                        Text(controller.bookingRequests.personalNote??'',style: MyTextStyle.titleStyle14b,),
                      ],
                    ),
                  ),
                ),
                    SizedBox(height: 10.px,),
                      controller.isLoading.value?
                      Padding(
                        padding: EdgeInsets.only(bottom: 30.px),
                        child: Center(child: CupertinoActivityIndicator(color: primaryColor,radius: 30.px,)),
                      ):
                    GestureDetector(
                      onTap: (){
                        //controller.showAlertBox(context);
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.px),
                        ),
                        color: primary3Color,
                        surfaceTintColor: primary3Color,
                        margin: EdgeInsets.symmetric(horizontal: 5.px,vertical: 10.px),
                        elevation: 10.px,
                        child: Container(
                          padding: EdgeInsets.all(20.px),
                          alignment: Alignment.center,
                          child: Text(StringConstants.youHostHas48HoursToConfirm,style: MyTextStyle.titleStyle14bb,),
                        ),
                      ),
                    ),*/,
                   SizedBox(height: 50.px,)
                  ],
                ),
              ),
            ),
          );
        })
    );
  }
}
