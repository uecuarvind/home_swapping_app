import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:home_swipping/app/data/constants/icons_constant.dart';
import 'package:home_swipping/app/routes/app_pages.dart';
import 'package:home_swipping/common/common_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../data/constants/string_constants.dart';

class ProfileSettingController extends GetxController {
  //TODO: Implement ProfileSettingController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
  onTapGoToProfile(){
    Get.toNamed(Routes.PROFILE);
  }

  clickOnMyTravelPlan(){
    Get.toNamed(Routes.MY_TRAVEL_PLAN);
  }
  clickOnMySpace(){
    Get.toNamed(Routes.MY_SPACE);
  }
  clickOnEditProfile(){
    Get.toNamed(Routes.EDIT_MY_PROFILE);
  }

  void openBottomSheetProfileSetting(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFFDCD3C7),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              height: 360,
              margin: EdgeInsets.all(20.px),
              child: Column(
                children: [
                  Container(
                    height:80.px,
                    alignment: Alignment.center,
                    decoration:  BoxDecoration(
                        color: primary3Color.withOpacity(0.20),
                      borderRadius: BorderRadius.circular(15.px)
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: ListTile(
                      onTap: (){
                        Get.back();
                        clickOnMyTravelPlan();
                      },
                      leading: CommonWidgets.appImagesView(
                          imagePath: IconConstants.icTravelPlan,
                        height: 42.px,width: 42.px
                      ),
                      title: Padding(
                        padding: EdgeInsets.only(left: 5.px),
                        child: Text(StringConstants.myTravelPlan,style:  MyTextStyle.customStyle(
                            fontFamily: "Buenard",fontWeight: FontWeight.w700,fontSize: 20,color:primary3Color
                        ),),
                      ),
                      trailing: Container(
                        height: 48.px,width: 48.px,
                        padding: EdgeInsets.all(10.px),
                        decoration: BoxDecoration(
                          color: primary3Color,
                          borderRadius: BorderRadius.circular(24.px)
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          size: 25,
                          color: textGolden,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20.px),
                    padding: EdgeInsets.only(left: 15.px,right: 15.px),
                    alignment: Alignment.center,
                    decoration:  BoxDecoration(
                        color: primary3Color.withOpacity(0.20),
                        borderRadius: BorderRadius.circular(15.px)
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Column(
                      children: [
                        SizedBox(height: 20.px,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(StringConstants.mySpace,style:  MyTextStyle.customStyle(
                                fontFamily: "Buenard",fontWeight: FontWeight.w700,fontSize: 20,color:primary3Color
                            ),),
                            GestureDetector(
                              onTap: (){
                                Get.back();
                                clickOnMySpace();
                              },
                              child: Container(
                                height: 40.px,width: 150.px,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: primary3Color,
                                    borderRadius: BorderRadius.circular(24.px)
                                ),
                                clipBehavior: Clip.hardEdge,
                                child:Text(StringConstants.finishYourSpace,style:  MyTextStyle.customStyle(
                                    fontFamily: "Buenard",fontWeight: FontWeight.w700,fontSize: 14,color:textGolden
                                ),),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.px,),
                        Divider(thickness: 1.px,color: primary3Color,),
                        SizedBox(height: 8.px,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(StringConstants.myProfile,style:  MyTextStyle.customStyle(
                                fontFamily: "Buenard",fontWeight: FontWeight.w700,fontSize: 20,color:primary3Color
                            ),),
                            GestureDetector(
                              onTap: (){
                                Get.back();
                                onTapGoToProfile();
                              },
                              child: Container(
                                height: 40.px,width: 150.px,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: primary3Color,
                                    borderRadius: BorderRadius.circular(24.px)
                                ),
                                clipBehavior: Clip.hardEdge,
                                child:Text(StringConstants.finishYourProfile,style:  MyTextStyle.customStyle(
                                    fontFamily: "Buenard",fontWeight: FontWeight.w700,fontSize: 14,color:textGolden
                                ),),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.px,),
                        Divider(thickness: 1.px,color: primary3Color,),
                        SizedBox(height: 8.px,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(StringConstants.myLocalWord,style:  MyTextStyle.customStyle(
                                fontFamily: "Buenard",fontWeight: FontWeight.w700,fontSize: 20,color:primary3Color
                            ),),
                            Container(
                              height: 40.px,width: 150.px,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: primary3Color,
                                  borderRadius: BorderRadius.circular(24.px)
                              ),
                              clipBehavior: Clip.hardEdge,
                              child:Text(StringConstants.shareYourPlaces,style:  MyTextStyle.customStyle(
                                  fontFamily: "Buenard",fontWeight: FontWeight.w700,fontSize: 14,color:textGolden
                              ),),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.px,)
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
