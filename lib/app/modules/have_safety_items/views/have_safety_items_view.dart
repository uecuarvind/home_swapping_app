import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:home_swipping/app/data/constants/image_constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/have_safety_items_controller.dart';

class HaveSafetyItemsView extends GetView<HaveSafetyItemsController> {
  const HaveSafetyItemsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
           backgroundColor: blackColor,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton:
          CommonWidgets.gradientButton(onPressed: (){
            controller.clickToContinue();
          },
              text: StringConstants.continueText
          ),
          body: Container(
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
                padding:  EdgeInsets.symmetric(horizontal: 15.px,vertical: 0.px),
                child: Column(
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
                            child: CommonWidgets.typingText(text: 'Safety',style: MyTextStyle.customStyle(
                                fontFamily: 'Lora',fontSize: 24,fontWeight: FontWeight.w500,color: primary3Color
                            ),pause: const Duration(seconds: 10)),
                          ),
                        )
                    ),
                    SizedBox(height: 16.px,),
                    Wrap(
                        alignment: WrapAlignment.start,
                        children:List.generate(controller.safetyItemList.length, (int index){
                          return GestureDetector(
                            onTap: (){
                              controller.clickToSelect(index);
                            },
                            child: Container(
                              height: 40.px,
                              padding: EdgeInsets.symmetric(horizontal: 20.px,vertical: 10.px),
                              margin: EdgeInsets.symmetric(horizontal: 5.px,vertical: 5.px),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.px),
                                  color:controller.safetyItemList[index]['isSelected']?primary3Color: primary3Color.withOpacity(0.2),
                                  boxShadow: [
                                    BoxShadow(
                                        offset:controller.safetyItemList[index]['isSelected']?const Offset(0,4):const Offset(0,0),
                                        color:controller.safetyItemList[index]['isSelected']?const Color(0xFF4A99ED) :blackColor.withOpacity(0.15),
                                        blurRadius:controller.safetyItemList[index]['isSelected']?24: 15,spreadRadius: 0
                                    )
                                  ]
                              ),
                              child: controller.safetyItemList[index]['isSelected']?
                              CommonWidgets.gradientText(text:controller.safetyItemList[index]['name'],
                                  style: MyTextStyle.customStyle(fontSize: 14.px,fontFamily: 'Lora',fontWeight: FontWeight.w700
                                  )):
                              Text(controller.safetyItemList[index]['name'],
                                style: MyTextStyle.customStyle(
                                    color:const Color(0xFFB7B8BE),fontSize: 14.px,fontFamily: 'Lora',fontWeight: FontWeight.w500
                                ),overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          );
                        })),
                  ],
                ),
              ),
            ),
          )
      );
    });
  }
}
