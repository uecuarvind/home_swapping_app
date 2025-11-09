import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:home_swipping/app/data/constants/icons_constant.dart';
import 'package:home_swipping/common/common_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';
import '../controllers/my_space_controller.dart';

class MySpaceView extends GetView<MySpaceController> {
  const MySpaceView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBarView(title: StringConstants.mySpace,color: primary3Color ),
        backgroundColor: primary3Color,
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.px,vertical: 5.px),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.px,),

                  Container(
                    height: 50.px,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 7.px,vertical: 0.px),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.px),
                      border: Border.all(color: textGrey,width: 1.px)
                    ),
                    child: Text('Spacious studio in the heart of the city.',
                        style: MyTextStyle.customStyle(
                            fontFamily: "Buenard",fontWeight: FontWeight.w700,fontSize: 20,color: textGrey
                        ),overflow: TextOverflow.ellipsis,)
                  ),
                  SizedBox(height: 20.px,),
                  Text(StringConstants.location,
                    style: MyTextStyle.customStyle(
                        fontFamily: "Lora",fontWeight: FontWeight.w600,fontSize: 20,color: textGrey
                    ),
                  ),

                  Container(
                      height: 50.px,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 7.px,vertical: 0.px),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.px),
                          border: Border.all(color: textGrey,width: 1.px)
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.location_on_rounded,size: 20.px,color: Colors.grey,),
                          Expanded(
                            child: Text('New York',
                              style: MyTextStyle.customStyle(
                                  fontFamily: "Lora",fontWeight: FontWeight.w700,fontSize: 16,color: textGrey
                              ),overflow: TextOverflow.ellipsis,),
                          ),
                          CommonWidgets.appImagesView(
                              imagePath: IconConstants.icEdit,height: 35.px,width: 35.px
                          )
                        ],
                      )
                  ),
                  SizedBox(height: 10.px,),
                  Text(StringConstants.basic,
                    style: MyTextStyle.customStyle(
                        fontFamily: "Lora",fontWeight: FontWeight.w700,fontSize: 20,color: labelColor
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.px)
                    ),
                    color: primary3Color,
                    surfaceTintColor: primary3Color,
                    elevation: 2.px,
                    child: Stack(
                      children: [
                        Container(
                          height: 115.px,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CommonWidgets.appImagesView(
                                      imagePath: IconConstants.icCardPersions,
                                    width: 50.px,height: 50.px
                                  ),
                                  SizedBox(height: 10.px,),
                                  Text('4',style: MyTextStyle.titleStyle14blb,)
                                ],
                              ),
                              SizedBox(width: 20.px,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CommonWidgets.appImagesView(
                                      imagePath: IconConstants.icCardBed,
                                    width: 50.px,height: 50.px
                                  ),
                                  SizedBox(height: 10.px,),
                                  Text('2',style: MyTextStyle.titleStyle14blb,)
                                ],
                              ),
                              SizedBox(width: 20.px,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CommonWidgets.appImagesView(
                                      imagePath: IconConstants.icCardTub,
                                      width: 50.px,height: 50.px
                                  ),
                                  SizedBox(height: 10.px,),
                                  Text('2',style: MyTextStyle.titleStyle14blb,)
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 10.px,right: 10.px,
                            child: GestureDetector(
                              onTap: (){
                                controller.clickOnBasicEdit();
                              },
                              child: CommonWidgets.appImagesView(
                                  imagePath: IconConstants.icEdit,
                                height: 40.px,width: 40.px
                              ),
                            )
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10.px,),
                  Text(StringConstants.aboutMySpace,
                    style: MyTextStyle.customStyle(
                        fontFamily: "Lora",fontWeight: FontWeight.w700,fontSize: 20,color: labelColor
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                       height: 140.px,
                        padding: EdgeInsets.all(15.px),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.px),
                          border: Border.all(width: 1.px,color: textGrey)
                        ),
                        child:Text('A nice home in the city near multiple train stations and in a great area for restaurants and tourist attractions.', style: MyTextStyle.customStyle(
                            fontFamily: "Buenard",fontWeight: FontWeight.w700,fontSize: 16,color: textGrey
                        ),
                        )
                      ),
                      Positioned(
                          bottom: 10.px,right: 10.px,
                          child: CommonWidgets.appImagesView(
                              imagePath: IconConstants.icEdit,
                              height: 40.px,width: 40.px
                          )
                      )
                    ],
                  ),
                  SizedBox(height: 12.px,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(StringConstants.spaceQuestion,
                        style: MyTextStyle.customStyle(
                            fontFamily: "Lora",fontWeight: FontWeight.w700,fontSize: 20,color: labelColor
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          controller.clickOnSpaceQuestionEdit();
                        },
                        child: CommonWidgets.appImagesView(
                            imagePath: IconConstants.icEdit,
                            height: 40.px,width: 40.px
                        ),
                      )
                    ],
                  ),
                  Card(
                    elevation: 5,
                    color: primary3Color,
                    surfaceTintColor: primary3Color,
                    child: Padding(
                      padding:  EdgeInsets.all(10.px),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonWidgets.appImagesView(
                              imagePath: IconConstants.icComma,height: 25.px,width: 25.px,
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
                    elevation:1,
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
                        Positioned(
                          bottom: 10.px,right: 10.px,
                          child: GestureDetector(
                            onTap: (){
                              controller.clickOnLocationEdit();
                            },
                            child: CommonWidgets.appImagesView(
                                imagePath: IconConstants.icEdit,height: 40.px,width: 40.px,
                                fit: BoxFit.cover
                            ),
                          ),
                        ),
                      ],
                    ) ,
                  ),
                  SizedBox(height: 16.px,),
                  Container(
                    padding: EdgeInsets.only(left: 14.px,right: 14.px,top: 12.px),
                    color: const Color(0xffFFFBF3),
                    height: 500.px,width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(StringConstants.spaceFeatures,
                                  style: MyTextStyle.customStyle(
                                      fontFamily: "Lora",fontWeight: FontWeight.w700,fontSize: 20,color: text2Color
                                  ),
                                ),
                                Text(StringConstants.work,
                                  style: MyTextStyle.customStyle(
                                      fontFamily: "Lora",fontWeight: FontWeight.w600,fontSize: 13,color: Colors.black
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: (){
                                controller.clickOnEssentialEdit();
                              },
                              child: CommonWidgets.appImagesView(
                                  imagePath: IconConstants.icEdit,
                                  height: 40.px,width: 40.px
                              ),
                            )
                          ],
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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

                        SizedBox(height: 20..px,),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.px,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(StringConstants.warmWelcome,
                        style: MyTextStyle.customStyle(
                            fontFamily: "Lora",fontWeight: FontWeight.w700,fontSize: 20,color: labelColor
                        ),
                      ),
                      CommonWidgets.appImagesView(
                          imagePath: IconConstants.icEdit,
                          height: 40.px,width: 40.px
                      )
                    ],
                  ),
                  Container(
                      height: 90.px,
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.symmetric(horizontal: 7.px,vertical: 7.px),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.px),
                          border: Border.all(color: textGolden,width: 1.px)
                      ),
                      child: Text('Check in details',
                        style: MyTextStyle.customStyle(
                            fontFamily: "Lora",fontWeight: FontWeight.w500,fontSize: 14,color: textGrey
                        ),overflow: TextOverflow.ellipsis,)
                  ),
                  SizedBox(height: 10.px,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                      GestureDetector(
                        onTap: (){
                          controller.clickOnSpaceRulesEdit();
                        },
                        child: CommonWidgets.appImagesView(
                            imagePath: IconConstants.icEdit,
                            height: 40.px,width: 40.px
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 50.px,)
                ],
              ),
            ),
          ),
        )
    );
  }
}
