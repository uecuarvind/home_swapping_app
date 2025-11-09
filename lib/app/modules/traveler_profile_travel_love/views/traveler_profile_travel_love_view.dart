import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/traveler_profile_travel_love_controller.dart';

class TravelerProfileTravelLoveView
    extends GetView<TravelerProfileTravelLoveController> {
  const TravelerProfileTravelLoveView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:
      CommonWidgets.gradientButton(onPressed: (){
        controller.clickOnContinueButton();
      },
          text: StringConstants.continueText
      ),
      body:Obx((){
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
              padding: EdgeInsets.symmetric(horizontal: 15.px,vertical: 0.px),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 0.px),
                      leading: GestureDetector(
                        onTap: (){
                          Get.back();
                        },
                        child: CommonWidgets.appImagesView(
                            imagePath: IconConstants.icBack,
                            height: 35.px,width: 35.px
                        ),
                      ),
                      title:Padding(
                        padding:  EdgeInsets.only(right: 60.px),
                        child: Center(
                          child: CommonWidgets.typingText(text: 'obsessions',style: MyTextStyle.customStyle(
                              fontFamily: 'Lora',fontSize: 24,fontWeight: FontWeight.w500,color: primary3Color
                          ),),
                        ),
                      )
                  ),
                  SizedBox(height: 20.px,),
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
                        padding: EdgeInsets.only(bottom: 70.px),
                        itemBuilder: (context,index){
                          return GestureDetector(
                            onTap: (){
                              controller.changeSelected(index);
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
                                        borderRadius: 40.px,
                                      ),
                                      SizedBox(height: 10.px,),
                                      Text(controller.dreamList[index]['place']??'',
                                        style: controller.dreamList[index]['status']?
                                        MyTextStyle.customStyle(fontSize: 14,fontWeight: FontWeight.w600,fontFamily: 'Lora',color:primary3Color):
                                        MyTextStyle.customStyle(fontSize: 14,fontWeight: FontWeight.w600,fontFamily: 'Lora',color:primary3Color.withOpacity(0.63)),)
            
                                    ],
                                  ),
                                  Positioned(
                                      right:10.px,top:10.px,
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
              ),
            ),
          ),
        );
      }),
    );
  }
}
