import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:home_swipping/app/data/api_constants/api_url_constants.dart';
import 'package:home_swipping/app/data/constants/image_constants.dart';
import 'package:home_swipping/common/update_profile_detail.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/traveler_profile_photo_controller.dart';

class TravelerProfilePhotoView extends GetView<TravelerProfilePhotoController> {
  const TravelerProfilePhotoView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx((){
      controller.count.value;
      return Scaffold(
        backgroundColor: blackColor,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: controller.tabIndex.value==0?
        CommonWidgets.gradientButton(onPressed: (){
          controller.clickOnContinueButton(context);
        },text: StringConstants.continueText,
          isLoading: controller.isLoading.value
        ):
        CommonWidgets.gradientButton(onPressed: (){
          controller.clickOnExploreButton();
        },text: StringConstants.explore
        ),
        body:Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage(ImageConstants.imgExploreBackground,
              ),fit: BoxFit.fill)
          ),
          child: SafeArea(
            child: controller.tabIndex.value==0?
            aryPasswordProfile(context):yourJourneyTab(),
          ),
        ),
      );
    });
  }
Widget aryPasswordProfile(BuildContext context){
    return Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(left:15.px,right: 15.px,top: 20.px),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // ListTile(
            //   contentPadding: EdgeInsets.symmetric(horizontal: 0.px),
            //   leading:GestureDetector(
            //       onTap: () {
            //         Get.back();
            //       },
            //       child: Padding(
            //         padding: EdgeInsets.only(left: 15.px,top: 10.px,bottom: 10.px,right: 0.px),
            //         child:Icon(Icons.arrow_back_ios,size: 30.px,color: text2Color,),
            //       )) ,
            //   title: Center(
            //     child: Padding(
            //       padding:  EdgeInsets.only(right: 50.px),
            //       child: Text(StringConstants.createProfile,
            //         style:MyTextStyle.titleStyle14grey,
            //       ),
            //     ),
            //   ),
            // ),
            CommonWidgets.typingText(text:StringConstants.aryPassport,style: MyTextStyle.customStyle(
                fontSize: 24.px,fontWeight: FontWeight.w700,fontFamily: 'Lora',color:primary3Color
            ),textAlign: TextAlign.center,),
            SizedBox(height: 30.px,),
            Text('You’ll need a passport image to travel with ary.',style: MyTextStyle.customStyle(fontSize: 14,fontFamily: 'Lora',fontWeight: FontWeight.w400,color:primary3Color)),
            SizedBox(height: 25.px,),
            Container(
              height: 400.px,
              margin: EdgeInsets.only(left: 40.px,right: 40.px),
              padding: EdgeInsets.all(30.px),
              decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(150.px) ,
                  color: primary3Color.withOpacity(0.2),
                  border: Border.all(color: primary3Color.withOpacity(0.2),width: 1.px)
              ),
              child: Container(
                height: 320.px,
                padding: EdgeInsets.only(left:50.px,right: 50.px,top: 50.px),
                decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(150.px) ,
                    color: primary3Color.withOpacity(0.2),
                    border: const GradientBoxBorder(
                      gradient: LinearGradient(colors:
                      [Color(0xFF371A45), Color(0xFF415A99),Color(0xFFB7B8BE),
                        Color(0xFF4A99ED)]),
                      width: 4,
                    )
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        controller.profileImage.value!=null?
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50.px),
                          child: Image.file(
                            height: 100.px,width: 100.px,
                            fit: BoxFit.cover,
                            File(
                              controller.profileImage.value!.path.toString(),
                            ),
                          ),
                        ):
                        Container(
                          height: 100.px,width: 100.px,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(color: primary3Color,width: 4.px),
                              borderRadius: BorderRadius.circular(50.px),
                              color: Colors.grey.withOpacity(0.2)
                          ),
                          clipBehavior: Clip.hardEdge,
                          child:CommonWidgets.imageView(
                              image: UpdateProfileDetails.getUserModel?.user?.profileimage??'',
                             borderRadius: BorderRadius.circular(50.px),
                            height: 100.px,width: 100.px,
                            defaultNetworkImage: ApiUrlConstants.defaultUserProfile
                          ),
                        ),
                        Positioned(
                            bottom: 0.px,right: 0.px,
                            child: GestureDetector(
                              onTap: (){
                                controller.openBottomSheet();
                              },
                              child: CommonWidgets.appImagesView(imagePath: IconConstants.icCamera,
                                height: 46.px,width: 46.px,),
                            )
                        )
                      ],
                    ),
                    SizedBox(height: 30.px,),
                    Text(UpdateProfileDetails.getUserModel?.user?.name??'',style: MyTextStyle.customStyle(fontSize: 22,fontWeight: FontWeight.w700,
                        color: primary3Color,fontFamily: 'Lora'),textAlign: TextAlign.center,),
                    Text(StringConstants.member,style: MyTextStyle.customStyle(fontSize: 18,fontWeight: FontWeight.w600,
                        color: primary3Color,fontFamily: 'Lora'),),
                  ],
                ),
              ),
            ),

          ],
        )

    );
}

  Widget yourJourneyTab(){
    return Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(left:15.px,right: 15.px),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // ListTile(
            //   contentPadding: EdgeInsets.symmetric(horizontal: 0.px),
            //   leading:GestureDetector(
            //       onTap: () {
            //         controller.tabIndex.value=0;
            //       },
            //       child: Padding(
            //         padding: EdgeInsets.only(left: 15.px,top: 10.px,bottom: 10.px,right: 0.px),
            //         child:Icon(Icons.arrow_back_ios,size: 30.px,color: text2Color,),
            //       )) ,
            //   title: Center(
            //     child: Padding(
            //       padding:  EdgeInsets.only(right: 50.px),
            //       child: Text(StringConstants.createProfile,
            //         style:MyTextStyle.titleStyle14grey,
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(height: 20.px,),
            CommonWidgets.typingText(text:StringConstants.letsBeginYourJourney,style: MyTextStyle.customStyle(
                fontSize: 20.px,fontWeight: FontWeight.w500,fontFamily: 'Lora',color:primary3Color
            ),textAlign: TextAlign.center,),
            SizedBox(height: 25.px,),
            Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.px,
                      crossAxisSpacing: 20.px,
                      childAspectRatio: 145/180
                  ),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount:controller.dreamList.length,
                  //physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.only(bottom: 70.px),
                  itemBuilder: (context,index){
                    return GestureDetector(
                      onTap: (){
                        controller.changeSelectedIndex(index);
                      },
                      child: Container(
                        margin: EdgeInsets.zero,
                        decoration: BoxDecoration(
                            color: Colors.transparent.withOpacity(0.1),
                            gradient: const LinearGradient(colors: [Color(0xFF6936E9),
                              Color(0xFFFFFFFF)],begin: Alignment.topCenter,end: Alignment.bottomCenter),

                            borderRadius: BorderRadius.circular(20.px),
                          border: Border.all(color: controller.dreamList[index]['status']?primary3Color:primary3Color.withOpacity(0.35),width: 1.px)
                        ),
                        clipBehavior: Clip.hardEdge,
                         child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CommonWidgets.appImagesView(
                                  imagePath: controller.dreamList[index]['image']??'',
                                  height: 150.px,width: 115.px,
                                  borderRadius: 10.px,
                                ),
                                SizedBox(height: 10.px,),
                                Text(controller.dreamList[index]['place']??'',
                                  style: controller.dreamList[index]['status']?
                                  MyTextStyle.customStyle(fontSize: 14,fontWeight: FontWeight.w600,fontFamily: 'Lora',color:primary3Color):
                                  MyTextStyle.customStyle(fontSize: 14,fontWeight: FontWeight.w600,fontFamily: 'Lora',color:primary3Color.withOpacity(0.63)),)

                              ],
                            ),
                            Positioned(
                                right:5.px,top:5.px,
                                child: controller.dreamList[index]['status']?
                            Container(
                              height: 20.px,width: 20.px,
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(colors: [Color(0xFFF9FCFB),
                                    Color(0xFFB1BAFF),Color(0xFF67A6A7),Color(0xFFB1BAFF) ],begin: Alignment.topCenter,end: Alignment.bottomCenter),

                                  borderRadius: BorderRadius.circular(24.px),
                                  border: Border.all(color: controller.dreamList[index]['status']?primary3Color:primary3Color.withOpacity(0.35),width: 1.px)
                              ),
                              child: Icon(Icons.check,color: Colors.black,size: 15  .px,),
                            ): Container(
                                  height: 20.px,width: 20.px,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.px),
                                    color: primary3Color.withOpacity(0.2)
                                  ),
                                  child: Icon(Icons.add,color:primary3Color,size: 15  .px,),

                                )
                            )

                          ],
                        ),
                      ),
                    );
                  }
              ),
            ),
          ],
        )

    );
  }
}
