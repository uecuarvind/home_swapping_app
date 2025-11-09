import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/my_space_add_home_care_controller.dart';

class MySpaceAddHomeCareView extends GetView<MySpaceAddHomeCareController> {
  const MySpaceAddHomeCareView({super.key});
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
                          child: CommonWidgets.typingText(text: 'Home Care',style: MyTextStyle.customStyle(
                              fontFamily: 'Lora',fontSize: 20 ,fontWeight: FontWeight.w500,color: primary3Color
                          ),),
                        ),
                      )
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.px,vertical: 20.px),
                    padding: EdgeInsets.symmetric(horizontal: 10.px,vertical: 15.px),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.px),
                        color: Color(0xFFF0F0F01F).withOpacity(0.12),
                        border: Border.all(color: controller.isHomeCare.value?primary3Color.withOpacity(0.3):Colors.transparent,width: 1.px)

                    ),
                    child: TextFormField(
                      focusNode: controller.homeCareNode,
                      controller: controller.homeCareController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration:  InputDecoration(
                        hintText: 'do you have any home care while you’re away? this can be anything from plant to pet care.',
                        hintStyle: MyTextStyle.customStyle(
                            fontSize: 14.px,
                            color: hintColor,
                            fontWeight: FontWeight.w400,
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
                /*  ListView.builder(
                    itemCount: controller.homeCareList.length,
                      shrinkWrap: true,
                      itemBuilder: (context,index){
                    return GestureDetector(
                      onTap: (){
                        controller.changeSelected(index);
                      },
                      child: Container(
                        padding: EdgeInsets.all(15.px),
                        margin: EdgeInsets.symmetric(vertical: 6.px),
                        decoration: BoxDecoration(
                            color: const Color(0xFFFAFAFA).withOpacity(0.14),
                            borderRadius: BorderRadius.circular(12.px),
                            border: Border.all(color: controller.homeCareList[index]['status']?Colors.blue.withOpacity(0.6):primary3Color.withOpacity(0.1),width: 1.px)
                        ),
                        child: Text(controller.homeCareList[index]['title'],
                          style: MyTextStyle.customStyle(
                              color:primary3Color,fontSize: 12.px,fontFamily: 'Lora',fontWeight: FontWeight.w700
                          ),
                        ),
                      ),
                    );
                  }),*/

                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
