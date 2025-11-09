import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/my_space_add_house_rules_controller.dart';

class MySpaceAddHouseRulesView extends GetView<MySpaceAddHouseRulesController> {
  const MySpaceAddHouseRulesView({super.key});
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
              padding:  EdgeInsets.symmetric(horizontal: 15.px),
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
                          child: CommonWidgets.typingText(text: 'House Rules',style: MyTextStyle.customStyle(
                              fontFamily: 'Lora',fontSize: 24 ,fontWeight: FontWeight.w500,color: primary3Color
                          ),),
                        ),
                      )
                  ),
                  SizedBox(height: 10.px,),

                  ListView.builder(
                    itemCount: controller.rulesList.length,
                    shrinkWrap: true,
                      itemBuilder: (context,index){
                    return  Container(
                      height: 60.px,
                      padding: EdgeInsets.symmetric(horizontal: 20.px,vertical: 5.px),
                      margin: EdgeInsets.symmetric(vertical: 10.px),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFAFAFA).withOpacity(0.14),
                          borderRadius: BorderRadius.circular(30.px),
                          border: Border.all(color: controller.rulesList[index]['status']?Colors.blue.withOpacity(0.4):Colors.transparent,width: 2.px)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          CommonWidgets.typingText(text:controller.rulesList[index]['title'], style: MyTextStyle.customStyle(
                              fontFamily: "Lora",fontWeight: FontWeight.w500,fontSize: 16,color: primary3Color
                          ),),
                          SizedBox(
                            width: 50.px,
                            child:  Switch(
                                value: controller.rulesList[index]['status'],
                                activeColor: primary3Color,
                                inactiveTrackColor:const Color(0xFFB0B0B0) ,
                                activeTrackColor:primary3Color ,
                                inactiveThumbColor:primary3Color ,
                                activeThumbImage: const AssetImage(IconConstants.icToggleCheck),
                                inactiveThumbImage : const AssetImage(IconConstants.icUnCheck),
                                onChanged: (value){
                                  controller.changeValue(index,value);
                                }
                            ),
                          )
                        ],
                      ),
                    );
                  }),




                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
