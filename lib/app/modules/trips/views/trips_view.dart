import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:home_swipping/app/data/constants/image_constants.dart';
import 'package:home_swipping/app/data/constants/string_constants.dart';
import 'package:home_swipping/app/routes/app_pages.dart';
import 'package:home_swipping/common/MyTextStyle.dart';
import 'package:home_swipping/common/colors.dart';
import 'package:home_swipping/common/common_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../data/constants/icons_constant.dart';
import '../controllers/trips_controller.dart';

class TripsView extends GetView<TripsController> {
  const TripsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
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
                            controller.openBottomSheetCrossDateCalender(context);
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
        ),
      )
    );
  }
}
