
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/spaces_style_controller.dart';

class SpacesStyleView extends GetView<SpacesStyleController> {
  const SpacesStyleView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        controller.count.value;
        return Scaffold(
            backgroundColor: blackColor,
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton:
            CommonWidgets.gradientButton(
                onPressed: (){
              controller.clickOnContinueButton();
            },
                text: StringConstants.continueText,
              buttonMargin: EdgeInsets.only(bottom: 15.px)
            ),
            body: SafeArea(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.zero,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(ImageConstants.imgExploreBackground),
                        fit: BoxFit.fill
                    )
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 15.px,vertical: 0.px),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: GestureDetector(
                          onTap: (){
                            Get.back();
                          },
                          child: CommonWidgets.appImagesView(
                              imagePath: IconConstants.icBack,
                              height: 35.px,width: 35.px
                          ),

                        ) ,
                        title:  Center(
                          child: Padding(
                            padding:  EdgeInsets.only(right: 50.px),
                            child: CommonWidgets.typingText(text: 'Space Type',style: MyTextStyle.customStyle(
                                fontFamily: 'Lora',fontSize: 18,fontWeight: FontWeight.w700,color: primary3Color
                            ),),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.px,),
                      Expanded(
                        child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.75,
                            crossAxisSpacing: 10.px,
                            mainAxisSpacing: 10.px
                          ),
                          padding:  EdgeInsets.only(bottom: 80.px),
                          itemCount: controller.spacesStyleList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                controller.clickToSelect(index);
                              },
                              // child: Material(
                              //   elevation: 5,
                              //   child: Container(
                              //     height: MediaQuery.of(context).size.height,
                              //     width: MediaQuery.of(context).size.width,
                              //     decoration: BoxDecoration(
                              //       border: Border.all(
                              //         color: controller.spacesStyleList[index]['isSelected'] == true ? textGolden : Colors.transparent,
                              //         width: 2.px,
                              //       )
                              //     ),
                              //     child: Stack(
                              //       children: [
                              //         Positioned.fill(
                              //           child: CommonWidgets.appImagesView(
                              //               imagePath: controller.spacesStyleList[index]['image'],
                              //               fit: BoxFit.cover,
                              //             height: 231.px,
                              //             width: 152.px,
                              //           ),
                              //         ),
                              //         Positioned(
                              //           bottom: 10.px,left: 10.px,
                              //           child: Text(
                              //             controller.spacesStyleList[index]['style'],
                              //             style: MyTextStyle.customStyle(
                              //                 fontSize: 14.px,
                              //                 color: primary3Color,
                              //                 fontWeight: FontWeight.w600,
                              //                 fontFamily: 'Lora'
                              //             ),
                              //           ),
                              //         )
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              child: Container(
                                margin: EdgeInsets.zero,
                                decoration: BoxDecoration(
                                    color: Colors.transparent.withOpacity(0.1),
                                    gradient: const LinearGradient(colors: [Color(0xFF6936E9),
                                      Color(0xFFFFFFFF)],begin: Alignment.topCenter,end: Alignment.bottomCenter),

                                    borderRadius: BorderRadius.circular(25.px),
                                    border: Border.all(color: controller.spacesStyleList[index]['isSelected']?primary3Color:primary3Color.withOpacity(0.35),width: 1.px)
                                ),
                                clipBehavior: Clip.hardEdge,
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        CommonWidgets.appImagesView(
                                          imagePath: controller.spacesStyleList[index]['image']??'',
                                          height: 150.px,width: 115.px,
                                          borderRadius: 40.px,
                                        ),
                                        SizedBox(height: 10.px,),
                                        Text(controller.spacesStyleList[index]['style']??'',style: MyTextStyle.customStyle(fontSize: 14,fontWeight: FontWeight.w600,fontFamily: 'Lora',color: controller.spacesStyleList[index]['isSelected']?primary3Color:primary3Color.withOpacity(0.63)),)

                                      ],
                                    ),
                                    Positioned(
                                        right:10.px,top:10.px,
                                        child: controller.spacesStyleList[index]['isSelected']?
                                        Container(
                                          height: 20.px,width: 20.px,
                                          decoration: BoxDecoration(
                                              gradient: const LinearGradient(colors: [Color(0xFFF9FCFB),
                                                Color(0xFFB1BAFF),Color(0xFF67A6A7),Color(0xFFB1BAFF) ],begin: Alignment.topCenter,end: Alignment.bottomCenter),

                                              borderRadius: BorderRadius.circular(24.px),
                                              border: Border.all(color: controller.spacesStyleList[index]['isSelected']?primary3Color:primary3Color.withOpacity(0.35),width: 1.px)
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
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
        );
      },
    );
  }
}

