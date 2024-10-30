import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:home_swipping/app/data/constants/icons_constant.dart';
import 'package:home_swipping/common/common_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/nav_bar_controller.dart';

class NavBarView extends GetView<NavBarController> {
  const NavBarView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx((){
      controller.count.value;
      return Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: customBottomBar(),
        body:controller.tabs[controller.tabIndex.value]
      );
    });
  }

  /// BottomBar
  Widget customBottomBar(){
    return Container(
      height: 70.px,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          //color:navBarColor,
          color:Colors.transparent,
          borderRadius: BorderRadius.only(topRight: Radius.circular(20.px),topLeft: Radius.circular(20.px))
      ),
      clipBehavior: Clip.hardEdge,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: (){
              controller.changeTabIndex(0);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ImageIcon(AssetImage(IconConstants.icExplore),size: 35.px,color: controller.tabIndex.value==0?primary3Color:text2Color,),
                Padding(
                  padding: EdgeInsets.only(top: 5.px),
                  child: Text(StringConstants.explore,style:MyTextStyle.titleStyle12w,),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
             // controller.changeTabIndex(1);
              controller.onTapGoToTrip();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ImageIcon(AssetImage(IconConstants.icTrips),size: 35.px,color: controller.tabIndex.value==1?primary3Color:text2Color,),
                Padding(
                  padding: EdgeInsets.only(top: 5.px),
                  child: Text(StringConstants.trips,style:MyTextStyle.titleStyle12w,),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              controller.changeTabIndex(2);
             // controller.onTapGoToProfile();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CommonWidgets.appImagesView(imagePath:'assets/images/user_profile.png',height: 36.px,width: 36.px,fit: BoxFit.cover,borderRadius: 100.px),
                Padding(
                  padding: EdgeInsets.only(top: 5.px),
                  child: Text(StringConstants.profile,style:MyTextStyle.titleStyle12w,),
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }
}
