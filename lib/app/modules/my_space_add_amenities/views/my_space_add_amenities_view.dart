import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:home_swipping/app/data/constants/icons_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/my_space_add_amenities_controller.dart';

class MySpaceAddAmenitiesView extends GetView<MySpaceAddAmenitiesController> {
  const MySpaceAddAmenitiesView({super.key});
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
      body: Obx((){
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
              padding:  EdgeInsets.symmetric(horizontal: 15.px,vertical: 0.px),
              child: SingleChildScrollView(
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
                            child: CommonWidgets.typingText(text: 'top amenities',style: MyTextStyle.customStyle(
                                fontFamily: 'Lora',fontSize: 20 ,fontWeight: FontWeight.w500,color: primary3Color
                            ),),
                          ),
                        )
                    ),
                 /*   ListView.builder(
                      shrinkWrap: true,
                        itemCount: controller.aminetiesList.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context,index){
                          return GestureDetector(
                            onTap: (){
                              controller.changeStatus(index);
                            },
                            child: Container(
                              height: 50.px,
                              padding: EdgeInsets.symmetric(horizontal: 5.px),
                              margin: EdgeInsets.symmetric(horizontal: 20.px,vertical: 5.px),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.px),
                                border: Border.all(color: controller.aminetiesStatusList[index]?textGolden:primary3Color,width: 2.px),
                                color: primary3Color
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CommonWidgets.appImagesView(
                                      imagePath: IconConstants.icTub,
                                    height: 25.px,width: 25.px
                                  ),
                                  SizedBox(width: 10.px,),
                                  Text(controller.aminetiesList[index],style: MyTextStyle.customStyle(
                                    fontSize: 14,fontFamily: 'Buenard',fontWeight: FontWeight.w700,color: labelColor
                                  ),)
                
                                ],
                              ),
                            ),
                          );
                        }
                    ),*/
                
                    Wrap(
                        alignment: WrapAlignment.start,
                        children:List.generate(controller.topAminitiesList.length, (int index){
                          return GestureDetector(
                            onTap: (){
                              controller.clickToAnimityItem(index);
                            },
                            child: Container(
                              height: 40.px,
                              padding: EdgeInsets.symmetric(horizontal: 20.px,vertical: 10.px),
                              margin: EdgeInsets.symmetric(horizontal: 5.px,vertical: 5.px),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.px),
                                  color:controller.topAminitiesList[index]['isSelected']?primary3Color: primary3Color.withOpacity(0.2),
                                  boxShadow: [
                                    BoxShadow(
                                        offset:controller.topAminitiesList[index]['isSelected']?const Offset(0,4):const Offset(0,0),
                                        color:controller.topAminitiesList[index]['isSelected']?const Color(0xFF4A99ED) :blackColor.withOpacity(0.15),
                                        blurRadius:controller.topAminitiesList[index]['isSelected']?24: 15,spreadRadius: 0
                                    )
                                  ]
                              ),
                              child: controller.topAminitiesList[index]['isSelected']?
                              CommonWidgets.gradientText(text:controller.topAminitiesList[index]['name'],
                                  style: MyTextStyle.customStyle(fontSize: 14.px,fontFamily: 'Lora',fontWeight: FontWeight.w700
                                  )):
                              Text(controller.topAminitiesList[index]['name'],
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
          ),
        );
      }),
    );
  }
}
