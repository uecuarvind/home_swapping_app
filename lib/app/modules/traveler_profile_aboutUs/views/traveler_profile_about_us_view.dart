import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/traveler_profile_about_us_controller.dart';

class TravelerProfileAboutUsView
    extends GetView<TravelerProfileAboutUsController> {
  const TravelerProfileAboutUsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx((){
      controller.count.value;
      return Scaffold(
        backgroundColor: blackColor,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton:controller.aboutMeController.text.isNotEmpty?
        CommonWidgets.gradientButton(onPressed: (){
          controller.clickOnContinueButton();
        },
            text: StringConstants.continueText
        ):const SizedBox(),
        body:Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImageConstants.imgExploreBackground),
                  fit: BoxFit.fill
              )
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                        child: CommonWidgets.typingText(text: 'about me',style: MyTextStyle.customStyle(
                            fontFamily: 'Lora',fontSize: 24,fontWeight: FontWeight.w500,color: primary3Color
                        ),pause: const Duration(seconds: 10)),
                      ),
                    )
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.px,vertical: 20.px),
                  padding: EdgeInsets.symmetric(horizontal: 10.px,vertical: 15.px),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.px),
                      color: Color(0xFFF0F0F01F).withOpacity(0.12),
                      border: Border.all(color: controller.isAboutMe.value?primary3Color.withOpacity(0.5):primary3Color.withOpacity(0.1),width: 1.px)
                  ),
                  child: TextFormField(

                    controller: controller.aboutMeController,
                    focusNode: controller.focusAboutMe,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration:  InputDecoration(
                      hintText: 'I live in New York. I like travelling, discover new culture and traditions, taste new food. I love meeting my guests and sharing my local...',
                      hintStyle: MyTextStyle.customStyle(
                          fontSize: 14.px,
                          color: hintColor,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Lora'
                      ),
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.only(left: 12.px,right: 12,top: 0,bottom: 0),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                    style: MyTextStyle.customStyle(
                        fontSize: 14.px,
                        color: primary3Color,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Lora'
                    ),
                    onChanged: (value){
                      controller.increment();
                    },
                  ),
                ),

              ],
            ),
          ),
        ),
      );
    });
  }
}
