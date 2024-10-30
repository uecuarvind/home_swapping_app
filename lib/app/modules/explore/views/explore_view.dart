
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:home_swipping/app/data/constants/icons_constant.dart';
import 'package:home_swipping/app/data/constants/image_constants.dart';
import 'package:home_swipping/app/data/constants/string_constants.dart';
import 'package:home_swipping/app/modules/trips/views/trips_view.dart';
import 'package:home_swipping/common/MyTextStyle.dart';
import 'package:home_swipping/common/colors.dart';
import 'package:home_swipping/common/common_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../routes/app_pages.dart';
import '../controllers/explore_controller.dart';

class ExploreView extends GetView<ExploreController> {
  const ExploreView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height-70.px,width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
             /*   PageView.builder(
                  itemCount: controller.houseList.length,
                    controller: controller.pageController,
                    itemBuilder: (context, index) {
                      return Container(
                        child: CommonWidgets.appImagesView(
                            imagePath: controller.houseList[index]['image']??'',
                          height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover
                        ),
                      );
                    },
                ),
                */
            CarouselSlider(
              carouselController:controller.sliderController ,
              items: List.generate(
                  controller.houseList.length,
                      (index) =>Container(
                        child: CommonWidgets.appImagesView(
                            imagePath: controller.houseList[index]['image']??'',
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap:() {
                              //controller.onTapWhereWeGo();
                            },
                            child: Container(
                                height: 48.px,width: MediaQuery.of(context).size.width-100.px,
                                decoration: BoxDecoration(
                                  //color: ,
                                    borderRadius: BorderRadius.circular(100.px),
                                    border: Border.all(color: primary3Color)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CommonWidgets.appImagesView(
                                        imagePath: IconConstants.icEarth,
                                        width: 20.px,height: 20.px,fit: BoxFit.cover
                                    ),
                                    SizedBox(width: 10.px,),
                                    Text("New York . June 15-18th",
                                      //'${StringConstants.whereShouldWeGo} ${controller.name}?',
                                      style: MyTextStyle.customStyle(fontSize: 14.px,fontFamily: 'Lora',color: primary3Color),
                                    ),
                                  ],
                                )
                            ),
                          ),
                          CommonWidgets.appImagesView(imagePath: IconConstants.icLogo,height: 50.px,width: 30.px),
                        ],
                      ),
                      SizedBox(height: 10.px,),
                      // SmoothPageIndicator(
                      //   controller: controller.pageController,
                      //   count: controller.houseList.length,
                      //   effect: SwapEffect(
                      //       dotColor: Colors.black,
                      //       activeDotColor: primary3Color,
                      //       dotHeight: 8.px,
                      //       dotWidth: 8.px,
                      //       spacing: 4.px
                      //   ),
                      // ),
                      Obx((){
                        controller.currentIndex.value;
                        return  DotsIndicator(
                          dotsCount: controller.houseList.length,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonWidgets.appImagesView(
                              imagePath: IconConstants.icRefresh,height: 40.px,width: 40.px
                          ),
                          CommonWidgets.appImagesView(
                              imagePath: IconConstants.icSwap,height: 40.px,width: 40.px
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 5.px,left: 10.px,right: 10.px,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  CommonWidgets.appImagesView(
                                    imagePath: ImageConstants.imgHouseOwner,borderRadius: 100.px,
                                    height: 50.px,width: 50.px
                                  ),
                                  SizedBox(width:5.px,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Albert Flores",style: MyTextStyle.customStyle(fontFamily: 'Lora',fontSize: 16.px,color:primary3Color,fontWeight: FontWeight.w800),),
                                      Text("Mediterranean Style Villa",style: MyTextStyle.customStyle(fontFamily: 'Lora',fontSize: 12.px,color:primary3Color,),),

                                    ],
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.location_on,size: 20.px,color: primary3Color,),
                                      Text("Miami",style: MyTextStyle.customStyle(fontFamily: 'Lora',color:primary3Color,fontSize: 14.px,fontWeight: FontWeight.w700),),
                                    ],
                                  ),
                                  SizedBox(width: 20.px,),
                                  Container(
                                    padding: const EdgeInsets.all(4),
                                    height: 28.px,width: 103.px,
                                    decoration: BoxDecoration(
                                      color: text2Color,
                                      border: Border.all(color: text2Color),
                                      borderRadius: BorderRadius.circular(8.px)
                                    ),
                                    clipBehavior: Clip.hardEdge,
                                    child: Center(
                                      child: Row(
                                        children: [
                                          CommonWidgets.appImagesView(
                                              imagePath: IconConstants.icPet,
                                            height: 20.px,width: 20.px
                                          ),
                                          SizedBox(width: 5.px,),
                                          Text(StringConstants.petFriendly,style: MyTextStyle.titleStyle12bw,),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          CommonWidgets.appImagesView(
                              imagePath: IconConstants.icChat,height: 64.px,width: 64.px
                          )
                        ],
                      ),
                      SizedBox(height: 10.px,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: text2Color,
                                border: Border.all(color: primary3Color),
                                borderRadius: BorderRadius.circular(8.px)
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: Center(
                              child: Text(StringConstants.creativeSpace,style: MyTextStyle.titleStyle12bw,),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: text2Color,
                                border: Border.all(color: primary3Color),
                                borderRadius: BorderRadius.circular(8.px)
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: Center(
                              child: Text(StringConstants.remoteWorker,style: MyTextStyle.titleStyle12bw,),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: text2Color,
                                border: Border.all(color: primary3Color),
                                borderRadius: BorderRadius.circular(8.px)
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: Center(
                              child: Text(StringConstants.greatWorkspace,style: MyTextStyle.titleStyle12bw,),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 125.px,right: 20.px,
                  child: Column(
                    children: [
                      CommonWidgets.appImagesView(
                          imagePath: IconConstants.icPerson,
                        height: 48.px,width: 48.px
                      ),
                      Text('4',style: MyTextStyle.titleStyle12bw,),
                      SizedBox(height: 5.px,),
                      CommonWidgets.appImagesView(
                          imagePath: IconConstants.icBed,
                          height: 48.px,width: 48.px
                      ),
                      Text('2',style: MyTextStyle.titleStyle12bw,),
                      SizedBox(height: 5.px,),
                      CommonWidgets.appImagesView(
                          imagePath: IconConstants.icBathTub,
                          height: 48.px,width: 48.px
                      ),
                      Text('2',style: MyTextStyle.titleStyle12bw,),
                    ],
                  ),
                )
              ],
            ),
          ),
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.px,),
              Padding(
                padding:  EdgeInsets.only(left: 16.px),
                child: Text(StringConstants.travelPlans,
                  style: MyTextStyle.customStyle(
                      fontFamily: "Lora",fontWeight: FontWeight.w700,fontSize: 20,color: labelColor
                  ),
                ),
              ),
              SizedBox(height: 20.px,),
              Stack(
                children: [
                  Center(
                    child: CommonWidgets.appImagesView(
                        imagePath: ImageConstants.imgTravelCard,height: 165.px,
                        width: 335.px,
                        fit: BoxFit.cover
                    ),
                  ),
                  Positioned(
                    top: 10.px,left: 50.px,
                    child: Row(
                      children: [
                        Text(StringConstants.travelPlans,
                          style: MyTextStyle.customStyle(
                              fontFamily: "Lora",fontWeight: FontWeight.w700,fontSize: 18,color: primary3Color
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width*0.5-50.px,),
                        GestureDetector(
                          onTap: (){
                            controller.clickOnTravelPlan();
                          },
                          child: CommonWidgets.appImagesView(
                              imagePath: IconConstants.icForwardWhite,height:32.px,width: 32.px
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 30.px,left: 50.px,right: 70.px,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.px,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('New York',
                              style: MyTextStyle.customStyle(
                                  fontFamily: "Lora",fontWeight: FontWeight.w700,fontSize: 15,color: primary3Color
                              ),
                            ),
                            Text('Dec 6-15',
                              style: MyTextStyle.customStyle(
                                  fontFamily: "Lora",fontWeight: FontWeight.w700,fontSize: 15,color: primary3Color
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.px,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Paris',
                              style: MyTextStyle.customStyle(
                                  fontFamily: "Lora",fontWeight: FontWeight.w700,fontSize: 15,color: primary3Color
                              ),
                            ),
                            Text('May 2-6',
                              style: MyTextStyle.customStyle(
                                  fontFamily: "Lora",fontWeight: FontWeight.w700,fontSize: 15,color: primary3Color
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 30.px,bottom: 15.px,
                    child: CommonWidgets.appImagesView(
                        imagePath: IconConstants.icFlight,height:32.px,width: 32.px
                    ),
                  )
                ],
              ),
              SizedBox(height: 16.px,),
              Container(
                padding: EdgeInsets.only(left: 10.px,right: 10.px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(StringConstants.meetTheTraveller,
                      style: MyTextStyle.customStyle(
                          fontFamily: "Lora",fontWeight: FontWeight.w700,fontSize: 15,color: labelColor
                      ),
                    ),
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.px)
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Stack(
                        children: [
                          Container(
                            decoration:BoxDecoration(
                                border: Border.all(color: primary3Color,width: 1.px)
                            ),
                            child: CommonWidgets.appImagesView(
                                imagePath: "assets/images/img_travellers.png",height:270.px,
                                width: MediaQuery.of(context).size.width
                            ),
                          ),
                          Positioned(
                              top: 15.px,right: 15.px,
                              child: Container(
                                height: 36.px,
                                width: 36.px,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18.px),
                                    border: Border.all(width: 2.px,color:primary3Color)
                                ),
                                child: Text('8',style: MyTextStyle.customStyle(
                                    fontFamily: "Lora",fontWeight: FontWeight.w700,fontSize: 16,color: primary3Color
                                ),),
                              )
                          ),
                          Positioned(
                            left: 14.px,bottom: 14.px,right: 10.px,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text('James & Paula',
                                      style: MyTextStyle.customStyle(
                                          fontFamily: "Lora",fontWeight: FontWeight.w700,fontSize: 20,color: primary3Color
                                      ),
                                    ),
                                    SizedBox(width: 5.px,),
                                    CommonWidgets.appImagesView(
                                        imagePath: IconConstants.icBlueTick,height: 23.px,width: 23.px,
                                        fit: BoxFit.cover
                                    )
                                  ],
                                ),
                                Text('Tell us who you are and what you love to do.',
                                  style: MyTextStyle.customStyle(
                                      fontFamily: "Lora",fontWeight: FontWeight.w400,fontSize: 14,color: primary3Color
                                  ),
                                ),
                                Text(StringConstants.readMore,
                                  style: MyTextStyle.customStyle(
                                      fontFamily: "Lora",fontWeight: FontWeight.w700,fontSize: 14,color: primary3Color
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Card(
                      elevation: 5,
                      color: const Color(0xffFFFBF3),
                      surfaceTintColor: const Color(0xffFFFBF3),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(StringConstants.aboutMySpace,
                              style: MyTextStyle.customStyle(
                                  fontFamily: "Lora",fontWeight: FontWeight.w700,fontSize: 20,color: labelColor
                              ),
                            ),
                            Text("A nice home in the city near multiple train stations and in a great area for restaurants and tourist attractions.",
                              style: MyTextStyle.customStyle(
                                  fontFamily: "Lora",fontWeight: FontWeight.w400,fontSize: 14,color: text2Color
                              ),
                            ),
                            Text(StringConstants.learnMore,
                              style: MyTextStyle.customStyle(
                                  fontFamily: "Lora",fontWeight: FontWeight.w700,fontSize: 14,color: text2Color
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 12.px,),
                    Card(
                      elevation: 5,
                      color: const Color(0xffFFFBF3),
                      surfaceTintColor: const Color(0xffFFFBF3),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonWidgets.appImagesView(
                                imagePath: IconConstants.icComma,height: 18.px,width: 22.px,
                                fit: BoxFit.cover
                            ),
                            SizedBox(height: 6.px,),
                            Text("What makes me feel at home in my \nhome?",
                              style: MyTextStyle.customStyle(
                                  fontFamily: "Lora",fontWeight: FontWeight.w700,fontSize: 14,color: textGolden
                              ),
                            ),
                            SizedBox(height: 6.px,),
                            Text("The users favorite thing to do in their home they think someone else in their space would enjoy",
                              style: MyTextStyle.customStyle(
                                  fontFamily: "Lora",fontWeight: FontWeight.w500,fontSize: 14,color: labelColor
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10.px,),
                    Text(StringConstants.neighborhood,
                      style: MyTextStyle.customStyle(
                          fontFamily: "Lora",fontWeight: FontWeight.w700,fontSize: 20.px,color: labelColor
                      ),
                    ),
                    Card(
                      elevation:5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.px),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child:Stack(
                        children: [
                          CommonWidgets.appImagesView(
                              imagePath: "assets/images/img_location.png",height: 198.px,width: 391.px,
                              fit: BoxFit.cover
                          ),
                          Positioned(
                            left: MediaQuery.of(context).size.width/2-60.px,top: 80.px,
                            child: CommonWidgets.appImagesView(
                                imagePath: IconConstants.icMapPin,height: 69.px,width: 69.px,
                                fit: BoxFit.cover
                            ),
                          ),
                        ],
                      ) ,
                    ),
                    Container(
                      color: primary3Color,
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(StringConstants.theSoulOfNeighbor,
                            style: MyTextStyle.customStyle(
                                fontFamily: "Lora",fontWeight: FontWeight.w700,fontSize: 20,color: labelColor
                            ),
                          ),
                          Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since  read more",
                            style: MyTextStyle.customStyle(
                                fontFamily: "Lora",fontWeight: FontWeight.w400,fontSize: 14,color: text2Color
                            ),
                          ),
                          Text(StringConstants.readMore,
                            style: MyTextStyle.customStyle(
                                fontFamily: "Lora",fontWeight: FontWeight.w700,fontSize: 14,color: text2Color
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 14.px,right: 14.px,top: 12.px),
                color: const Color(0xffFFFBF3),
                height: 600.px,width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(StringConstants.spaceFeatures,
                      style: MyTextStyle.customStyle(
                          fontFamily: "Lora",fontWeight: FontWeight.w700,fontSize: 20,color: text2Color
                      ),
                    ),
                    Text(StringConstants.inCommon,
                      style: MyTextStyle.customStyle(
                          fontFamily: "Lora",fontWeight: FontWeight.w600,fontSize: 13,color: Colors.black
                      ),
                    ),
                    SizedBox(height: 20.px,),
                    SizedBox(
                      height: 350.px,width: MediaQuery.of(context).size.width,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10.px,
                            mainAxisSpacing: 10.px
                        ),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.spaceCommonFeaturesList.length,
                        itemBuilder:  (context, index) {
                          return Container(
                            padding: const EdgeInsets.all(8),
                            height: 90.px,width: 100.px,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.px),
                                border: Border.all(color: textGolden),
                                color: primary3Color
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CommonWidgets.appImagesView(
                                    imagePath: controller.spaceCommonFeaturesList[index]['featureIcon']??'',
                                    fit: BoxFit.fill,height: 24.px,width: 24.px
                                ),
                                Text(controller.spaceCommonFeaturesList[index]['featureName']??'',
                                  style: MyTextStyle.customStyle(
                                      fontFamily: "Lora",fontWeight: FontWeight.w500,fontSize: 14.px,
                                      color: textGolden
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(Routes.ALL_AMENITIES);
                      },
                      child: Container(
                        height: 40.px,width: 144.px,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.px),
                            border: Border.all(color: textGolden),
                            color: primary3Color
                        ),
                        child: Center(
                          child: Text(StringConstants.seeAllAmenities,
                            style: MyTextStyle.customStyle(
                                fontFamily: "Lora",fontWeight: FontWeight.w500,fontSize: 14.px,
                                color: text2Color
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.px,),
                    Container(
                      height: 40.px,width: 144.px,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.px),
                          border: Border.all(color: textGolden),
                          color: const Color(0xffFFFBF3)
                      ),
                      child: Center(
                        child: Text(StringConstants.houseRules,
                          style: MyTextStyle.customStyle(
                              fontFamily: "Lora",fontWeight: FontWeight.w600,fontSize: 14.px,
                              color: text2Color
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20..px,),
                    Obx(() {
                      controller.count.value;
                      return Padding(
                        padding:  EdgeInsets.only(left: 12.px),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                controller.selectModernDesign();
                              },
                              child: Stack(
                                children: [
                                  Icon(Icons.circle_outlined,size: 30.px,color: Colors.black,),
                                  Positioned(
                                    left:4.3.px,top:4.3.px,
                                    child: Icon(Icons.circle,size: 21.px,
                                      color: controller.isModernDesignSelected.value==false ? primary3Color:Colors.black,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(width: 10.px,),
                            Text(StringConstants.modernDesign,
                              style: MyTextStyle.customStyle(
                                  fontFamily: "Lora",fontWeight: FontWeight.w600,fontSize: 14.px,
                                  color: labelColor
                              ),)
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
              Container(
                color: primary3Color,
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.px,),
                    InkWell(
                      onTap: () {
                        Get.toNamed(Routes.NEXT_PAGE);
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 30.px,right: 30.px,bottom: 15.px),
                        height: 50.px,width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.px),
                            color: primary3Color,
                            border: Border.all(color: text2Color)
                        ),
                        child: Center(
                          child: Text(StringConstants.connect,
                            style: MyTextStyle.customStyle(color: labelColor,fontSize: 16.px,fontFamily: 'Lora'),),
                        ),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: 30.px),
                      child: CommonWidgets.appImagesView(
                          imagePath: IconConstants.icAry,width: 50.px,height: 50.px,fit: BoxFit.cover
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      )
    );
  }
}
