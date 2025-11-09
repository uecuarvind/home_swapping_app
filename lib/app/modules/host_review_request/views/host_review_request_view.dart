import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:home_swipping/common/map_container.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/dateRangeFormate.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/host_review_request_controller.dart';

class HostReviewRequestView extends GetView<HostReviewRequestController> {
  const HostReviewRequestView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        body: Obx((){
          controller.count.value;
          return ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                height: 300.px,width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.px),
                    color: primary3Color
                ),
                child: Stack(
                  children: [
                    CarouselSlider(
                      carouselController:controller.sliderController ,
                      items: List.generate(
                          controller.bookingRequests.house?.houseImagesUrls?.length??0,
                              (index) =>Container(
                            child: CommonWidgets.imageView(
                                image: controller.bookingRequests.house?.houseImagesUrls![index]??'',
                                height: 300.px,width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover,
                                borderRadius: BorderRadius.circular(0.px)
                            ),
                          )
                      ),
                      options: CarouselOptions(
                          height:300.px,
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
                    Positioned(
                      top: 50.px,left: 20.px,right: 20.px,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: (){
                              controller.clickOnBackIcon();
                            },
                            child: Container(
                                height:35.px,width: 35.px,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.8),
                                    borderRadius: BorderRadius.circular(18.px)
                                ),
                                child:Icon(Icons.arrow_back_ios_new,size: 20.px,color: primary3Color,)
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              controller.clickOnViewProfile();
                            },
                            child: Container(
                                height:40.px,width: 100.px,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color:greyColor.withOpacity(0.60),
                                    borderRadius: BorderRadius.circular(20.px),
                                    border: Border.all(color: primary3Color.withOpacity(0.2),width: 1.px)
                                ),
                                child:Text(StringConstants.viewProfile,style: MyTextStyle.titleStyle12bw,)
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 20.px,left: 20.px,right: 20.px,
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
                      bottom: 40.px,left: 20.px,right: 20.px,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("${controller.bookingRequests.house?.houseOwner?.name} Has Requested A ${controller.bookingRequests.lookingFor}",style: MyTextStyle.customStyle(fontFamily: 'Lora',fontSize: 20.px,color:primary3Color,fontWeight: FontWeight.w700),),

                          SizedBox(height: 10.px,),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15.px,vertical: 5.px),
                child:   Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap:(){
                        controller.openTravellerProfile();
                  },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CommonWidgets.imageView(
                              image: controller.bookingRequests.house?.houseOwner?.profileimage??'',
                          height: 35.px,width: 35.px,
                          borderRadius: BorderRadius.circular(18.px)
                          ),
                          SizedBox(width: 10.px,),
                          Text(controller.bookingRequests.house?.houseOwner?.name??'',
                            style: MyTextStyle.customStyle(fontFamily: 'Lora',fontWeight: FontWeight.w700,color: primary3Color),),

                          CommonWidgets.appImagesView(imagePath: IconConstants.icVerify,
                          height: 10.px,width: 10.px),
                          Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              Icon(Icons.arrow_forward_ios,size: 20.px,color: primary3Color,),
                              Padding(
                                padding:  EdgeInsets.only(left: 2.px),
                                child: Icon(Icons.circle,color: primary3Color,size: 4.px,),
                              )
                            ],
                          )

                        ],
                      ),
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CommonWidgets.appImagesView(
                            imagePath: ImageConstants.imgMap,
                            height: 50.px,
                            width: 150.px
                        ),
                        Positioned(
                          left: 10.px,right: 10.px,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 35.px,
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(horizontal: 10.px,vertical: 5.px
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.px),
                                    color: greyColor
                                ),
                                child: Text('New York',style: MyTextStyle.titleStyle14bw,),
                              ),
                              Icon(Icons.circle,size: 10.px,color: primary3Color,)
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 30.px,
                    width: 55.px,
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 5.px),
                    decoration: BoxDecoration(
                      color:primary3Color.withOpacity(0.20),
                      borderRadius: BorderRadius.circular(20.px),
                    ),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CommonWidgets.appImagesView(imagePath: IconConstants.icPerson1,
                            height: 18.px,width: 18.px),
                        SizedBox(width: 2.px,),
                        Text("3",style:
                        MyTextStyle.customStyle(fontFamily: 'Lora',color:primary3Color,fontSize: 16.px,fontWeight: FontWeight.w500),),
                      ],
                    ),

                  ),
                  Container(
                    height: 30.px,
                    width: 55.px,
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 5.px),
                    decoration: BoxDecoration(
                      color:primary3Color.withOpacity(0.20),
                      borderRadius: BorderRadius.circular(20.px),
                    ),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CommonWidgets.appImagesView(imagePath: IconConstants.icBed1,
                        height: 18.px,width: 18.px),
                        SizedBox(width: 2.px,),
                        Text("4",style:
                        MyTextStyle.customStyle(fontFamily: 'Lora',color:primary3Color,fontSize: 16.px,fontWeight: FontWeight.w500),),
                      ],
                    ),

                  ),
                  Container(
                    height: 30.px,
                    width: 55.px,
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 5.px),
                    decoration: BoxDecoration(
                      color:primary3Color.withOpacity(0.20),
                      borderRadius: BorderRadius.circular(20.px),
                    ),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CommonWidgets.appImagesView(imagePath: IconConstants.icBathTub1,
                            height: 18.px,width: 18.px),
                        SizedBox(width: 2.px,),
                        Text("2",style:
                        MyTextStyle.customStyle(fontFamily: 'Lora',color:primary3Color,fontSize: 16.px,fontWeight: FontWeight.w500),),
                      ],
                    ),

                  ),
                ],
              ),
              SizedBox(height: 10.px,),
              Container(
                height: 50.px,
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 80.px),
                padding: EdgeInsets.symmetric(horizontal: 40.px),
                decoration: BoxDecoration(
                    color:primary3Color.withOpacity(0.20),
                    borderRadius: BorderRadius.circular(30.px),
                      ),
                child:  Text("Spacious Studio",style:
                MyTextStyle.customStyle(fontFamily: 'Lora',color:primary3Color,fontSize: 16.px,fontWeight: FontWeight.w500),),

              ),
              Container(
                height: 50.px,
                margin: EdgeInsets.only(top: 15.px,bottom: 15.px,
                left: 10.px,right: 10.px),
                padding: EdgeInsets.symmetric(horizontal: 15.px),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color:primary3Color.withOpacity(0.20),
                    borderRadius: BorderRadius.circular(30.px),
                    border: Border.all(color: primary3Color.withOpacity(0.25),width: 1.px)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CommonWidgets.appImagesView(imagePath: IconConstants.icCalender,
                            height: 25.px,width: 25.px,color: primary3Color),
                        SizedBox(width: 5.px,),
                        Text(controller.bookingRequests.startDate!=null?DateRangeFormat.formatDateRange(controller.bookingRequests.startDate.toString(),controller.bookingRequests.endDate.toString()):"",style:
                        MyTextStyle.customStyle(fontFamily: 'Buenard',color:primary3Color,fontSize: 16.px,fontWeight: FontWeight.w700),),
                      ],
                    ),
                    Container(
                      height: 35.px,width:80.px,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color:Colors.black,
                          borderRadius: BorderRadius.circular(15.px),
                          border: Border.all(color: primary3Color.withOpacity(0.55),width: 1.px)
                      ),
                      child: Text(
                        StringConstants.edit,style: MyTextStyle.titleStyle12bw,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10.px),
                child: Text(StringConstants.travelers,
                  style: MyTextStyle.customStyle(
                      fontFamily: "Lora",fontWeight: FontWeight.w700,fontSize: 20,color: primary3Color
                  ),
                ),
              ),
              Container(
                height: 50.px,
                margin: EdgeInsets.only(top: 15.px,bottom: 15.px,
                left: 10.px,right: 10.px),
                padding: EdgeInsets.symmetric(horizontal: 15.px),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                color:primary3Color.withOpacity(0.20),
                  borderRadius: BorderRadius.circular(30.px),
                  border: Border.all(color: primary3Color.withOpacity(0.25),width: 1.px)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Wrap(
                      direction: Axis.horizontal,
                      spacing: -12.0, // Negative spacing for overlap
                      children: controller.bookingRequests.travellingPartners!.map((travellingPartners) {
                        return Container(
                          height: 31.px,width: 31.px,
                          decoration: BoxDecoration(
                            border: Border.all(color: primary3Color,width: 1.5.px),
                            borderRadius: BorderRadius.circular(16.px)
                          ),
                          child: CommonWidgets.imageView(
                              image: travellingPartners.imageUrl??'',
                            borderRadius: BorderRadius.circular(15.px)
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),

              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.px),
                    side: BorderSide(color: Colors.black.withOpacity(0.80),width: 1.px)
                ),
                color:primary3Color.withOpacity(0.15),
                surfaceTintColor: primary3Color,
                margin: EdgeInsets.symmetric(horizontal: 5.px,vertical: 5.px),
                elevation: 5.px,
                child: Container(
                  height: 100.px,
                  padding: EdgeInsets.all(15.px),
                  child: Text(controller.bookingRequests.personalNote??'',style: MyTextStyle.titleStyle12bw,
                  overflow: TextOverflow.ellipsis,),
                ),
              ),
              SizedBox(height: 10.px,),
              controller.isLoading.value?
              Padding(
                padding: EdgeInsets.only(bottom: 30.px),
                child: Center(child: CupertinoActivityIndicator(color: primary3Color,radius: 15.px,)),
              ):
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.px),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        child: Center(child: Text(StringConstants.newDates,style: MyTextStyle.customStyle(
                          fontSize: 16,fontWeight: FontWeight.w700,fontFamily: 'Lora',color: primary3Color
                        ),)),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: CommonWidgets.gradientButton(
                          onPressed: (){
                            if( controller.bookingRequests.isAccepted??false){
                              CommonWidgets.showSnackBar(message:'This request already accepted', context: context,status: false);
                            }else{
                              controller.clickOnSaveButton(context);
                            }
                          },
                          text: StringConstants.accept
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50.px,)
            ],
          );
        })
    );
  }
}
