import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:home_swipping/common/dateRangeFormate.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/match_screen_controller.dart';

class MatchScreenView extends GetView<MatchScreenController> {
  const MatchScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: blackColor,
        body: Obx((){
          controller.count.value;
          return
            controller.isLoading.value?
            CommonWidgets.commonShimmer(
                shimmerWidget: SizedBox(
                  height:height,
                  width: width,
                  child: Column(
                    children: [
                      SizedBox(height: height*0.1,),
                      Container(
                        height:height*0.25,
                        width:width*0.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.px),
                            color: Colors.grey.withOpacity(0.6)
                        ),
                      ),
                      SizedBox(height: height*0.04,),
                      Container(
                        height:height*0.04,
                        width:width*0.6,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.px),
                            color: Colors.grey.withOpacity(0.6)
                        ),
                      ),
                      SizedBox(height: height*0.02,),
                      Container(
                        height:height*0.04,
                        width:width*0.7,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.px),
                            color: Colors.grey.withOpacity(0.6)
                        ),
                      ),
                      SizedBox(height: height*0.02,),
                      Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(height*0.02),
                                    height:height*0.04,
                                    width:width*0.7,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5.px),
                                        color: Colors.grey.withOpacity(0.6)
                                    ),),
                                  Divider(thickness: 1.px,endIndent:height*0.02,indent: height*0.02 ,),
                                  Container(
                                    margin: EdgeInsets.all(height*0.02),
                                    height:height*0.05,
                                    width:width*0.7,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20.px),
                                        color: Colors.grey.withOpacity(0.6)
                                    ),),
                                  Container(
                                    margin: EdgeInsets.all(height*0.02),
                                    height:height*0.05,
                                    width:width*0.7,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20.px),
                                        color: Colors.grey.withOpacity(0.6)
                                    ),),
                                ],
                              )),
                          Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(height*0.02),
                                    height:height*0.04,
                                    width:width*0.7,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5.px),
                                        color: Colors.grey.withOpacity(0.6)
                                    ),),
                                  Divider(thickness: 1.px,endIndent:height*0.02,indent: height*0.02 ,),
                                  Container(
                                    margin: EdgeInsets.all(height*0.02),
                                    height:height*0.05,
                                    width:width*0.7,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20.px),
                                        color: Colors.grey.withOpacity(0.6)
                                    ),),
                                  Container(
                                    margin: EdgeInsets.all(height*0.02),
                                    height:height*0.05,
                                    width:width*0.7,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20.px),
                                        color: Colors.grey.withOpacity(0.6)
                                    ),),
                                ],
                              ))
                        ],
                      ),
                      SizedBox(height: height*0.01,),
                      Container(
                        margin: EdgeInsets.all(height*0.02),
                        height:height*0.035,
                        width:width*0.9,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.px),
                            color: Colors.grey.withOpacity(0.6)
                        ),),
                      Container(
                        margin: EdgeInsets.all(height*0.02),
                        height:height*0.06,
                        width:width*0.9,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.px),
                            color: Colors.grey.withOpacity(0.6)
                        ),),
                    ],
                  ),
                )
            ):
            Column(
          //  padding: EdgeInsets.zero,
            children: [

              SizedBox(
                height: 400.px,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [

                    CarouselSlider(
                      carouselController:controller.sliderController ,
                      items: List.generate(
                          controller.houseDetails?.houseImagesUrls?.length??0,
                              (index) =>Container(
                            child: CommonWidgets.imageView(
                                image: controller.houseDetails?.houseImagesUrls?[index]??'',
                                height: 400.px,width: MediaQuery.of(context).size.width,
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
                    Positioned(
                      bottom: 0.px,left: 0.px,right: 0.px,
                      child: CommonWidgets.appImagesView(
                          height: 200.px,width: MediaQuery.of(context).size.width,
                          imagePath: ImageConstants.imgBlackBackground,
                          borderRadius: 0.px
                      ),
                    ),
                    Positioned(
                      bottom: 0.px,left: 5.px,right: 5.px,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CommonWidgets.appImagesView(
                              imagePath: IconConstants.icMatch,fit: BoxFit.cover,
                              height: 117.px,width: 117.px
                          ),

                          SizedBox(
                            height: 50.px,
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
                          SizedBox(
                            height: 20.px,
                          ),
                          Obx((){
                            controller.currentIndex.value;
                            return  DotsIndicator(
                              dotsCount: controller.houseDetails?.houseImagesUrls?.length??0,
                              position: controller.currentIndex.value,
                              decorator: DotsDecorator(
                                  color: greyColor, // Inactive color
                                  activeColor: primary3Color,
                                  size: Size(8.px,8.px ),
                                  spacing: EdgeInsets.all(4.px)
                              ),
                            );
                          }),
                          SizedBox(height: 10.px,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  controller.openTravellerProfile();
                                },
                                child: Row(
                                  children: [
                                    CommonWidgets.imageView(
                                        image:controller.houseDetails?.houseOwner?.profileimage??'',
                                        borderRadius: BorderRadius.circular(20.px),
                                      height: 35.px,width: 35.px
                                    ),
                                    SizedBox(width: 5.px,),
                                    Text(controller.houseDetails?.houseOwner?.name??'',
                                      style: MyTextStyle.customStyle(
                                          fontSize: 20.px,
                                          color: primary3Color,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: 'Lora'
                                      ),textAlign: TextAlign.center,
                                    ),
                                    CommonWidgets.appImagesView(
                                        imagePath: IconConstants.icVerify,
                                        height: 10.px,width: 10.px
                                    ),
                                    SizedBox(width: 5.px,),
                                    Stack(
                                      alignment: Alignment.centerLeft,
                                      children: [
                                        Icon(Icons.arrow_forward_ios,size: 20.px,color: primary3Color,),
                                        Icon(Icons.circle,size: 4.px,color: primary3Color,),

                                      ],
                                    ),
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
                        ],
                      ),
                    ),


                    Positioned(
                        top: 50.px,left: 10.px,
                        child: GestureDetector(
                          onTap: (){
                            Get.back();
                          },
                          child: CommonWidgets.appImagesView(
                              imagePath: IconConstants.icBack,
                            height: 40.px,width: 40.px
                          )
                        )
                    ),

                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.px,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding:  EdgeInsets.all(8.0.px),
                          child: Stack(
                            children: [
                              CommonWidgets.appImagesView(
                                  imagePath: ImageConstants.imgBlurFull,
                                height: 180.px,
                                width: MediaQuery.of(context).size.width,
                                borderRadius: 12.px
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.0.px),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(StringConstants.swap,
                                      style: MyTextStyle.customStyle(
                                          fontSize: 18.px,
                                          color: primary3Color,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: 'Lora'
                                      ),textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 130.px,
                                      child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          itemCount: controller.availableSwapList.length??0,
                                          itemBuilder: (context,index){
                                            return   GestureDetector(
                                              onTap: (){
                                                controller.clickOnSwapDate(index);
                                              },
                                              child: Container (
                                                padding: EdgeInsets.symmetric(horizontal: 10.px,vertical: 12.px),
                                                margin: EdgeInsets.only(top: 10.px),
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(12.px),
                                                    border: Border.all(color: primary3Color.withOpacity(0.2),width: 1.px),
                                                    color:controller.swapIndex==index?primary3Color:transparentColor
                                                ),
                                                child: Text(DateRangeFormat.formatDateRange(controller.availableSwapList[index].startDate??'',controller.availableSwapList[index].endDate??''),
                                                  style: MyTextStyle.customStyle(
                                                      fontSize: 14.px,
                                                      color:controller.swapIndex==index?text2Color: primary3Color,
                                                      fontWeight: FontWeight.w600,
                                                      fontFamily: 'Lora'
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            );
                                          }),
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child:  Padding(
                          padding:  EdgeInsets.all(8.0.px),
                          child: Stack(
                            children: [
                              CommonWidgets.appImagesView(
                                  imagePath: ImageConstants.imgBlurFull,
                                  height: 180.px,
                                  width: MediaQuery.of(context).size.width,
                                  borderRadius: 12.px
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.0.px),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(StringConstants.stay,
                                      style: MyTextStyle.customStyle(
                                          fontSize: 20.px,
                                          color: primary3Color,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: 'Lora'
                                      ),textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 130.px,
                                      child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          itemCount: controller.availableStayList.length??0,
                                          itemBuilder: (context,index){
                                            return   GestureDetector(
                                              onTap: (){
                                                controller.clickOnStayDate(index);
                                              },
                                              child: Container (
                                                padding: EdgeInsets.symmetric(horizontal: 10.px,vertical: 12.px),
                                                margin: EdgeInsets.only(top: 10.px),
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(12.px),
                                                    border: Border.all(color: primary3Color.withOpacity(0.2),width: 1.px),
                                                    color: controller.stayIndex==index?primary3Color:transparentColor
                                                ),
                                                child: Text(DateRangeFormat.formatDateRange(controller.availableStayList[index].startDate??'',controller.availableStayList[index].endDate??''),
                                                  style: MyTextStyle.customStyle(
                                                      fontSize: 14.px,
                                                      color: controller.stayIndex==index?text2Color:primary3Color,
                                                      fontWeight: FontWeight.w600,
                                                      fontFamily: 'Lora'
                                                  ),textAlign: TextAlign.center,
                                                ),
                                              ),
                                            );
                                          }),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.px,),
                  Text('You guys have a LOT in common...',style: MyTextStyle.customStyle(
                      fontFamily: 'Lora',fontWeight: FontWeight.bold,fontSize: 20.px,color: primary3Color
                  ),),
                  SizedBox(height: 10.px,),
                  Wrap(
                    children: controller.interestList.map((i) => Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.px,vertical: 8.px),
                      margin: EdgeInsets.symmetric(horizontal: 5.px,vertical: 8.px),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.px),
                          border: Border.all(color:const Color(0xFFC3C3C3),width: 1.px),
                          color: transparentColor
                      ),
                      child:   Text(i,style: MyTextStyle.customStyle(
                          fontFamily: 'Lora',fontWeight: FontWeight.bold,fontSize: 12.px,color: primary3Color
                      ),),
                    )).toList(),
                  )

                ],
              ),
              CommonWidgets.gradientButton(
                wantContentSizeButton: true,
                width: 240.px,
                  height: 48.px,
                  onPressed: (){
                    controller.clickOnContinueButton(context);
                  },
                text: StringConstants.connect,

              ),


            ],
          );
        })
    );
  }
}
