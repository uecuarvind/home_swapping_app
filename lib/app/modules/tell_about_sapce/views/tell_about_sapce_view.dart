import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:home_swipping/app/data/constants/icons_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/tell_about_sapce_controller.dart';

class TellAboutSapceView extends GetView<TellAboutSapceController> {
  const TellAboutSapceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
          backgroundColor: blackColor,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton:
          CommonWidgets.gradientButton(onPressed: (){
            controller.clickOnContinueButton();
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
                          child: CommonWidgets.typingText(text: 'The Basics',style: MyTextStyle.customStyle(
                              fontFamily: 'Lora',fontSize: 24,fontWeight: FontWeight.w500,color: primary3Color
                          ),),
                        ),
                      )
                    ),

                    SizedBox(height: 40.px,),
                    Container(
                      padding:  EdgeInsets.all(10.px),
                      margin:  EdgeInsets.all(5.px),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.px),
                       // color: const Color(0xFFFAFAFA)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CommonWidgets.appImagesView(
                                  imagePath: IconConstants.icPerson1,
                                height: 20.px,width: 20.px,
                                fit: BoxFit.cover
                              ),
                              SizedBox(width: 8.px,),
                              Text(
                                StringConstants.guests,
                                style: MyTextStyle.customStyle(
                                    fontSize: 16.px,
                                    color: primary3Color,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Lora'
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: (){
                                  controller.decrease(0);
                                },
                                child:  Icon(Icons.remove,size: 25.px,color: primary3Color,)
                              ),
                              SizedBox(width: 8.px,),
                            
                              Text(
                                controller.noOfGuests.toString(),
                                style: MyTextStyle.customStyle(
                                    fontSize: 16.px,
                                    color: primary3Color,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Lora'
                                ),
                              ),
                              SizedBox(width: 8.px,),
                              GestureDetector(
                                onTap: (){
                                  controller.increase(0);
                                },
                                  child:  Icon(Icons.add,size: 25.px,color: primary3Color,)
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Divider(thickness: 1.px,color: primary3Color.withOpacity(0.1),),

                    Container(
                      padding:  EdgeInsets.all(10.px),
                      margin:  EdgeInsets.all(5.px),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.px),
                       //   color: const Color(0xFFFAFAFA)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CommonWidgets.appImagesView(
                                  imagePath: IconConstants.icBedrooms,
                                  height: 20.px,width: 20.px,
                                  fit: BoxFit.cover
                              ),
                              SizedBox(width: 8.px,),
                              Text(
                                StringConstants.bedRooms,
                                style: MyTextStyle.customStyle(
                                    fontSize: 16.px,
                                    color: primary3Color,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Lora'
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: (){
                                  controller.decrease(1);
                                },
                                  child:  Icon(Icons.remove,size: 25.px,color: primary3Color,)

                              ),
                              SizedBox(width: 8.px,),
                              Text(
                                controller.noOfBedrooms.toString(),
                                style: MyTextStyle.customStyle(
                                    fontSize: 16.px,
                                    color: primary3Color,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Lora'
                                ),
                              ),
                              SizedBox(width: 8.px,),
                              GestureDetector(
                                onTap: (){
                                  controller.increase(1);
                                },
                                  child:  Icon(Icons.add,size: 25.px,color: primary3Color,)

                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Divider(thickness: 1.px,color: primary3Color.withOpacity(0.1),),

                    Container(
                      padding:  EdgeInsets.all(10.px),
                      margin:  EdgeInsets.all(5.px),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.px),
                          //color: const Color(0xFFFAFAFA)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CommonWidgets.appImagesView(
                                  imagePath: IconConstants.icBed1,
                                  height: 20.px,width: 20.px,
                                  fit: BoxFit.cover
                              ),
                              SizedBox(width: 8.px,),
                              Text(
                                StringConstants.bed,
                                style: MyTextStyle.customStyle(
                                    fontSize: 16.px,
                                    color: primary3Color,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Lora'
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: (){
                                  controller.decrease(2);
                                },
                                  child:  Icon(Icons.remove,size: 25.px,color: primary3Color,)

                              ),
                              SizedBox(width: 8.px,),
                              Text(
                                controller.noOfBeds.toString(),
                                style: MyTextStyle.customStyle(
                                    fontSize: 16.px,
                                    color: primary3Color,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Lora'
                                ),
                              ),
                              SizedBox(width: 8.px,),
                              GestureDetector(
                                onTap: (){
                                  controller.increase(2);
                                },
                                  child:  Icon(Icons.add,size: 25.px,color: primary3Color,)

                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Divider(thickness: 1.px,color: primary3Color.withOpacity(0.1),),

                    Container(
                      padding:  EdgeInsets.all(10.px),
                      margin:  EdgeInsets.all(5.px),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.px),
                          //color: const Color(0xFFFAFAFA)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CommonWidgets.appImagesView(
                                  imagePath: IconConstants.icBathTub1,
                                  height: 20.px,width: 20.px,
                                  fit: BoxFit.cover
                              ),
                              SizedBox(width: 8.px,),
                              Text(
                                StringConstants.bathrooms,
                                style: MyTextStyle.customStyle(
                                    fontSize: 16.px,
                                    color: primary3Color,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Lora'
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: (){
                                  controller.decrease(3);
                                },
                                  child:  Icon(Icons.remove,size: 25.px,color: primary3Color,)

                              ),
                              SizedBox(width: 8.px,),
                              Text(
                                controller.noOfBathrooms.toString(),
                                style: MyTextStyle.customStyle(
                                    fontSize: 16.px,
                                    color: primary3Color,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Lora'
                                ),
                              ),
                              SizedBox(width: 8.px,),
                              GestureDetector(
                                onTap: (){
                                  controller.increase(3);
                                },
                                  child:  Icon(Icons.add,size: 25.px,color: primary3Color,)

                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Divider(thickness: 1.px,color: primary3Color.withOpacity(0.1),),

                    // Spacer(),
                    // Card(
                    //   shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(25.px)
                    //   ),
                    //   margin: EdgeInsets.only(left: 30.px,right: 30.px),
                    //   elevation: 10.px,
                    //   child: CommonWidgets.commonElevatedButton(
                    //     onPressed: (){
                    //       controller.clickOnContinueButton();
                    //     },
                    //
                    //     child: Text(StringConstants.continueText,style: MyTextStyle.customStyle(fontSize: 18,fontWeight: FontWeight.w700,
                    //         color: text2Color,fontFamily: 'Lora'),),
                    //     borderRadius: 25.px,
                    //     buttonColor: primary3Color,
                    //   ),
                    // ),
                    // SizedBox(height: 12.px,),
                    // GestureDetector(
                    //   onTap: (){
                    //     controller.clickOnSkip();
                    //   },
                    //   child: Center(
                    //     child: Text(
                    //       StringConstants.skipForNow,
                    //       style: MyTextStyle.customStyle(
                    //           fontSize: 16.px,
                    //           color: text2Color,
                    //           fontWeight: FontWeight.w500,
                    //           fontFamily: 'Lora'
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(height: 30.px,)
                  ],
                ),
              ),
            ),
          )
      );
    });
  }
}
