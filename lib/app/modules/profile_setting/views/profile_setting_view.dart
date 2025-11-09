import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:home_swipping/app/data/api_constants/api_url_constants.dart';
import 'package:home_swipping/app/data/constants/image_constants.dart';
import 'package:home_swipping/common/colors.dart';
import 'package:home_swipping/common/update_house_details.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/update_profile_detail.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/profile_setting_controller.dart';

class ProfileSettingView extends GetView<ProfileSettingController> {
  const ProfileSettingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: blackColor,
        body: Obx((){
          controller.count.value;
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 380.px,
                            decoration: const BoxDecoration(
                                image: DecorationImage(

                                    image: AssetImage(ImageConstants.imgProfileSettingBackground),
                                    fit: BoxFit.fill
                                )
                            ),
                            // child: CommonWidgets.appImagesView(
                            //     imagePath:ImageConstants.imgBlackBackground,
                            //     height:380.px,width: MediaQuery.of(context).size.width,
                            //     fit: BoxFit.fill
                            // ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height-380.px,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(ImageConstants.imgBackgroundSpace),
                                    fit: BoxFit.fill
                                )
                            )

                          ),
                        ],
                      ),
                      Positioned(
                        top: 65.px,left: 20.px,right: 20.px,
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    //controller.clickOnSpaceTape();
                                    controller.clickOn5Credits();
                                  },
                                  child: Container(
                                    width:100.px,
                                    height:40.px,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: primary3Color.withOpacity(0.2),
                                        border: const GradientBoxBorder(
                                          gradient: LinearGradient(colors:
                                          [Color(0xFF371A45), Color(0xFF415A99),Color(0xFFB7B8BE),
                                          Color(0xFF4A99ED)]),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(26.px)
                                    ),
                                    clipBehavior: Clip.hardEdge,
                                    child: Text('5 credits',style: MyTextStyle.customStyle(fontSize: 14,
                                        fontWeight: FontWeight.w600,color:primary3Color,fontFamily: 'Lora'),),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    controller.clickOnMyTravelPlan(context);
                                  },
                                  child: Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 10.px),
                                    child: CommonWidgets.appImagesView(
                                        imagePath: IconConstants.icCalender,
                                      height: 40.px,width: 40.px,
                                      color: primary3Color.withOpacity(0.85)
                                    ),
                                  ),
                                ),

                                GestureDetector(
                                  onTap: (){
                                    controller.clickOnSpaceTape();
                                  },
                                  child: Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 10.px),
                                    child: CommonWidgets.appImagesView(
                                        imagePath: IconConstants.icPlay,
                                        height: 50.px,width: 50.px,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            // GestureDetector(
                            //   onTap: (){
                            //     controller.clickOn5Credits();
                            //   },
                            //   child: Container(
                            //     width: 130.px,
                            //     height: 44.px,
                            //     alignment: Alignment.center,
                            //     decoration: BoxDecoration(
                            //         color:const Color(0xFFFFFBF2),
                            //         border: Border.all(color: primary3Color),
                            //         borderRadius: BorderRadius.circular(24.px)
                            //     ),
                            //     clipBehavior: Clip.hardEdge,
                            //     child: Row(
                            //       mainAxisAlignment: MainAxisAlignment.center,
                            //       children: [
                            //         CommonWidgets.appImagesView(
                            //             imagePath: IconConstants.icCredit,height: 25.px,width: 25.px
                            //         ),
                            //         Padding(
                            //           padding: EdgeInsets.only(left: 5.px),
                            //           child: Text('5 Credits',style: MyTextStyle.customStyle(fontSize: 16,
                            //               fontWeight: FontWeight.w500,color:Colors.black,fontFamily: 'Lora'),),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            GestureDetector(
                              onTap: (){
                                controller.clickOnSettingIcon();
                              },
                              child: CommonWidgets.appImagesView(
                                  imagePath: IconConstants.icSetting,height: 35.px,width: 35.px
                              ),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                          top: 180.px,left: 10.px,right: 10.px,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Hi ${UpdateProfileDetails.getUserModel?.user?.name}',style: MyTextStyle.customStyle(fontSize: 36,
                                  fontWeight: FontWeight.w500,color: primary3Color,fontFamily: 'Lora'),),
                              Container(
                               // width: 100.px,
                                height: 35.px,
                                margin: EdgeInsets.only(top: 20.px,bottom: 50.px),
                                padding: EdgeInsets.symmetric(horizontal: 10.px,vertical: 5.px),
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(8.px)
                                ),
                                clipBehavior: Clip.hardEdge,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CommonWidgets.imageView(
                                        image: UpdateProfileDetails.getUserModel?.user?.profileimage??
                                        ApiUrlConstants.defaultUserProfile,
                                      height: 20.px,width: 20.px,
                                      borderRadius: BorderRadius.circular(10.px)
                                    ),
                                    SizedBox(width: 5.px,),
                                    Text('verified',style: MyTextStyle.customStyle(fontSize: 12,
                                        fontWeight: FontWeight.w500,color:primary3Color,fontFamily: 'Lora'),),
                                    SizedBox(width: 5.px,),
                                    CommonWidgets.appImagesView(imagePath: IconConstants.icVerify,width:15.px,height: 15.px )
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Profile creation',style: MyTextStyle.customStyle(fontSize: 16,
                                      fontWeight: FontWeight.w600,color: primary3Color,fontFamily: 'Lora'),),
                                  Text('${controller.percentageProfile.value}%',style: MyTextStyle.customStyle(fontSize: 20,
                                      fontWeight: FontWeight.w600,color: primary3Color,fontFamily: 'Lora'),),

                                ],
                              ),
                              SizedBox(height: 10.px,),
                              CommonWidgets.appImagesView(
                                  imagePath: ImageConstants.imgPercentageProfile,
                                height: 20.px,width: MediaQuery.of(context).size.width
                              ),
                              SizedBox(height: 30.px,),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: GestureDetector(
                                      onTap: (){
                                        controller.clickOnCompleteTravelerProfile(context);
                                      },
                                      child: Container(
                                        height: 185.px,
                                        alignment: Alignment.bottomCenter,
                                        margin: EdgeInsets.symmetric(horizontal: 8.px),
                                        padding: EdgeInsets.symmetric(vertical: 15.px),
                                        decoration: BoxDecoration(
                                          color: Colors.transparent.withOpacity(0.1),
                                            gradient: const LinearGradient(colors: [Color(0xFF6936E9),
                                            Color(0xFFFFFFFF)],begin: Alignment.topCenter,end: Alignment.bottomCenter),
                                            border: Border.all(color: primary3Color.withOpacity(0.10),width: 1.px),
                                            borderRadius: BorderRadius.circular(24.px),
                                        ),
                                        clipBehavior: Clip.hardEdge,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            CommonWidgets.appImagesView(imagePath: IconConstants.icRobort,
                                              height: 80.px,width: 60.px
                                            ),
                                            SizedBox(height: 10.px,),
                                            Text('Traveler',style: MyTextStyle.customStyle(fontSize: 20,
                                                fontWeight: FontWeight.w600,color:primary3Color,fontFamily: 'Lora'),),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: GestureDetector(
                                      onTap: (){
                                        controller.clickOnContinueSpaceProfile(context);
                                      },
                                      child: Container(
                                        height: 185.px,
                                        alignment: Alignment.bottomCenter,
                                        margin: EdgeInsets.symmetric(horizontal: 8.px),
                                        padding: EdgeInsets.symmetric(vertical: 15.px),
                                        decoration: BoxDecoration(
                                          color: Colors.transparent.withOpacity(0.1),
                                          gradient: const LinearGradient(colors: [Color(0xFF6936E9),
                                            Color(0xFFFFFFFF)],begin: Alignment.topCenter,end: Alignment.bottomCenter),
                                          border: Border.all(color: primary3Color.withOpacity(0.10),width: 1.px),
                                          borderRadius: BorderRadius.circular(24.px),
                                        ),
                                        clipBehavior: Clip.hardEdge,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            CommonWidgets.appImagesView(imagePath: IconConstants.icMapPin,
                                                height: 100.px,width: 100.px,fit: BoxFit.fill
                                            ),
                                            Text('Space',style: MyTextStyle.customStyle(fontSize: 20,
                                                fontWeight: FontWeight.w600,color:primary3Color,fontFamily: 'Lora'),),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                      ),
                      if(controller.isLoading.value)
                      Positioned(
                        bottom: 150.px,right: 0.px,left: 0.px,
                        child: CupertinoActivityIndicator(color: primary3Color,radius: 15.px,)
                      ),
                      // Positioned(
                      //   bottom: 30.px,left: 20.px,
                      //   child: Text(StringConstants.aboutMySpaceInfoHere,style: MyTextStyle.customStyle(fontSize: 14,
                      //       fontWeight: FontWeight.w500,color: primary3Color,fontFamily: 'Lora'),),
                      // ),

                    ],
                  ),
                ),
                Container(
                  height:400.px,
                  padding: EdgeInsets.all(20.px),
                  decoration: const BoxDecoration(
                    color:  Color(0xFFDCD3C7),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height:80.px,
                        alignment: Alignment.center,
                        decoration:  BoxDecoration(
                            color: primary3Color.withOpacity(0.20),
                            border: Border.all(width: 1.px,color: primary3Color),
                            borderRadius: BorderRadius.circular(15.px)
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: ListTile(
                          onTap: (){
                            controller.clickOnMyTravelPlan(context);
                          },
                          leading: CommonWidgets.appImagesView(
                              imagePath: IconConstants.icTravelPlan,
                              height: 42.px,width: 42.px
                          ),
                          title: Padding(
                            padding: EdgeInsets.only(left: 5.px),
                            child: Text(StringConstants.myTravelPlan,style:  MyTextStyle.customStyle(
                                fontFamily: "Buenard",fontWeight: FontWeight.w700,fontSize: 20,color:primary3Color
                            ),),
                          ),
                          trailing: Container(
                            height: 48.px,width: 48.px,
                            padding: EdgeInsets.all(10.px),
                            decoration: BoxDecoration(
                                color: primary3Color,
                                borderRadius: BorderRadius.circular(24.px)
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              size: 25,
                              color: textGolden,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20.px),
                        padding: EdgeInsets.only(left: 15.px,right: 15.px),
                        alignment: Alignment.center,
                        decoration:  BoxDecoration(
                            border: Border.all(width: 1.px,color: primary3Color),
                            color: primary3Color.withOpacity(0.20),
                            borderRadius: BorderRadius.circular(15.px)
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Column(
                          children: [
                            SizedBox(height: 20.px,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(StringConstants.mySpace,style:  MyTextStyle.customStyle(
                                    fontFamily: "Buenard",fontWeight: FontWeight.w700,fontSize: 20,color:primary3Color
                                ),),
                                GestureDetector(
                                  onTap: (){
                                    controller.clickOnMySpace();
                                  },
                                  child: Container(
                                    height: 40.px,width: 150.px,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: primary3Color,
                                        borderRadius: BorderRadius.circular(24.px)
                                    ),
                                    clipBehavior: Clip.hardEdge,
                                    child:Text(StringConstants.finishYourSpace,style:  MyTextStyle.customStyle(
                                        fontFamily: "Buenard",fontWeight: FontWeight.w700,fontSize: 14,color:textGolden
                                    ),),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.px,),
                            Divider(thickness: 1.px,color: primary3Color,),
                            SizedBox(height: 8.px,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(StringConstants.myProfile,style:  MyTextStyle.customStyle(
                                    fontFamily: "Buenard",fontWeight: FontWeight.w700,fontSize: 20,color:primary3Color
                                ),),
                                GestureDetector(
                                  onTap: (){
                                    controller.onTapGoToProfile();
                                  },
                                  child: Container(
                                    height: 40.px,width: 150.px,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: primary3Color,
                                        borderRadius: BorderRadius.circular(24.px)
                                    ),
                                    clipBehavior: Clip.hardEdge,
                                    child:Text(StringConstants.finishYourProfile,style:  MyTextStyle.customStyle(
                                        fontFamily: "Buenard",fontWeight: FontWeight.w700,fontSize: 14,color:textGolden
                                    ),),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.px,),
                            Divider(thickness: 1.px,color: primary3Color,),
                            SizedBox(height: 8.px,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(StringConstants.myLocalWord,style:  MyTextStyle.customStyle(
                                    fontFamily: "Buenard",fontWeight: FontWeight.w700,fontSize: 20,color:primary3Color
                                ),),
                                Container(
                                  height: 40.px,width: 150.px,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: primary3Color,
                                      borderRadius: BorderRadius.circular(24.px)
                                  ),
                                  clipBehavior: Clip.hardEdge,
                                  child:Text(StringConstants.shareYourPlaces,style:  MyTextStyle.customStyle(
                                      fontFamily: "Buenard",fontWeight: FontWeight.w700,fontSize: 14,color:textGolden
                                  ),),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.px,)
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        })
    );
  }
}
