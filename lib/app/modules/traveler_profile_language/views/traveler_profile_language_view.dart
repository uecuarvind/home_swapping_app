import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/traveler_profile_language_controller.dart';

class TravelerProfileLanguageView
    extends GetView<TravelerProfileLanguageController> {
  const TravelerProfileLanguageView({super.key});
  Widget build(BuildContext context) {
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
      body:Obx((){
        controller.count.value;
        return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.zero,
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
                        child: CommonWidgets.typingText(text: 'languages',style: MyTextStyle.customStyle(
                            fontFamily: 'Lora',fontSize: 18,fontWeight: FontWeight.w700,color: primary3Color
                        ),),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10.px,
                            crossAxisSpacing: 10.px,
                            childAspectRatio: 100/35
                        ),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount:controller.languageList.length,
                        itemBuilder: (context,index){
                          // return GestureDetector(
                          //   onTap: (){
                          //     controller.changeSelectLanguage( index);
                          //   },
                          //   child: Card(
                          //     shape: RoundedRectangleBorder(
                          //         borderRadius: BorderRadius.circular(50.px),
                          //         side: BorderSide(color: textGolden,width: 1.px)
                          //     ),
                          //     elevation:controller.languageList[index]['status']?6:0 ,
                          //     color: controller.languageList[index]['status']?primary3Color:backgroundColor,
                          //     child: Container(
                          //       height: 45.px,
                          //       alignment: Alignment.center,
                          //       padding: EdgeInsets.symmetric(horizontal: 10.px,vertical: 10.px),
                          //       child: Row(
                          //         children: [
                          //           CommonWidgets.appImagesView(
                          //               imagePath: controller.languageList[index]['flag'],
                          //               height: 40.px,width: 40.px
                          //           ),
                          //           Padding(
                          //             padding:  EdgeInsets.only(left: 8.px,right: 10.px),
                          //             child: Text(controller.languageList[index]['name'],
                          //               style: MyTextStyle.customStyle(
                          //                   color:text2Color,fontSize: 16.px,fontFamily: 'Buenard',fontWeight: FontWeight.w700
                          //               ),overflow: TextOverflow.ellipsis,
                          //             ),
                          //           ),
                          //           if(controller.languageList[index]['status'])
                          //             Icon(Icons.check,size: 28.px,color: greenColor,)
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // );
                          return GestureDetector(
                            onTap: (){
                              controller.changeSelectLanguage(index);
                            },
                            child: Container(
                              height: 52.px,
                              padding: EdgeInsets.symmetric(horizontal: 8.px,vertical: 5.px),
                              margin: EdgeInsets.symmetric(horizontal: 5.px,vertical: 5.px),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.px),
                                  color:controller.languageList[index]['status']?primary3Color: primary3Color.withOpacity(0.2),
                                  border: Border.all(color:controller.languageList[index]['status']?Colors.blue.withOpacity(0.8):const Color(0xffD9D9D9).withOpacity(0.12) ),
                                  boxShadow: [
                                    BoxShadow(
                                        offset:controller.languageList[index]['status']?const Offset(0,6):const Offset(0,0),
                                        color:controller.languageList[index]['status']? Colors.blue.withOpacity(0.36) :blackColor.withOpacity(0.15),
                                        blurRadius:controller.languageList[index]['status']?24: 0,spreadRadius: 0
                                    )
                                  ]
                              ),
                              child:Row(
                                children: [
                                  CommonWidgets.appImagesView(
                                      imagePath: controller.languageList[index]['flag'],
                                      height: 40.px,width: 40.px,fit: BoxFit.fill,
                                    borderRadius: 20.px
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(left: 8.px,right: 10.px),
                                    child: controller.languageList[index]['status']?
                                        CommonWidgets.gradientText(text:controller.languageList[index]['name'],
                                        style: MyTextStyle.customStyle(fontSize: 16.px,fontFamily: 'Buenard',fontWeight: FontWeight.w700
                                        ) ):
                                    Text(controller.languageList[index]['name'],
                                      style: MyTextStyle.customStyle(
                                          color:const Color(0xffB7B8BE),fontSize: 16.px,fontFamily: 'Buenard',fontWeight: FontWeight.w700
                                      ),overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
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
