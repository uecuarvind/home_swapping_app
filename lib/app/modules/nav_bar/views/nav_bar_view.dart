
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:home_swipping/app/data/constants/icons_constant.dart';
import 'package:home_swipping/app/data/constants/image_constants.dart';
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
       //bottomNavigationBar: customBottomBar(context),
       floatingActionButton: customBottomBar(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body:controller.tabs[navBarIndex.value]
      );
    });
  }

  /// BottomBar
  Widget customBottomBar(BuildContext context){
    return Container(
      height: 80.px,
      width: MediaQuery.of(context).size.width,
      //padding: EdgeInsets.only(bottom: 10.px),
      decoration:  BoxDecoration(
        // color: primary3Color.withOpacity(0.1),
        image: DecorationImage(
            image: AssetImage(ImageConstants.imgBlackBackground),
          fit: BoxFit.fill
        )
      ),
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: (){
              controller.changeTabIndex(0);
            },
            child: CommonWidgets.appImagesView(
                imagePath: IconConstants.icExplore,height: 24.px,width: 24.px),
          ),
          GestureDetector(
            onTap: (){
              controller.changeTabIndex(1);

            },
            child: CommonWidgets.appImagesView(imagePath: IconConstants.icTrips,
            height: 48.px,width: 48.px)
          ),
          GestureDetector(
            onTap: (){
              controller.changeTabIndex(2);
              // controller.onTapGoToProfile();
            },
            child: CommonWidgets.appImagesView(imagePath:'assets/images/user_profile.png',height: 30.px,width: 30.px,fit: BoxFit.cover,borderRadius: 100.px),
          ),
        ],
      ),

    );
  }
  /*
  Widget customBottomBar(){
    return navBarIndex.value==1?
    Container(
      height: 80.px,
      alignment: Alignment.center,
      padding: EdgeInsets.only(bottom: 10.px),
      decoration: BoxDecoration(
          //color:navBarColor,
          color:navBarIndex.value==1?const Color(0xFFFFFBF2):Colors.transparent,
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
                ImageIcon(AssetImage(IconConstants.icExplore),size: 35.px,color: navBarIndex.value==0?primary3Color:textColor.withOpacity(0.7),),
                Padding(
                  padding: EdgeInsets.only(top: 5.px),
                  child: Text(StringConstants.explore,style:MyTextStyle.titleStyle12b,),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
             controller.changeTabIndex(1);

            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ImageIcon(AssetImage(IconConstants.icTrips),size: 35.px,color:textGrey,),
                Padding(
                  padding: EdgeInsets.only(top: 5.px),
                  child: Text(StringConstants.trips,style:MyTextStyle.titleStyle12grey,),
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
                  child: Text(StringConstants.profile,style:MyTextStyle.titleStyle12b,),
                ),
              ],
            ),
          ),
        ],
      ),

    ):
    navBarIndex.value==0?
    Container(
      height: 80.px,
      padding: EdgeInsets.only(bottom: 10.px),
      color: textGolden.withOpacity(0.7),
      alignment: Alignment.center,
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
                ImageIcon(AssetImage(IconConstants.icExplore),size: 35.px,color:primary3Color,),
                Padding(
                  padding: EdgeInsets.only(top: 5.px),
                  child: Text(StringConstants.explore,style:MyTextStyle.titleStyle12w,),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              controller.changeTabIndex(1);

            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ImageIcon(AssetImage(IconConstants.icTrips),size: 35.px,color: textGrey,),
                Padding(
                  padding: EdgeInsets.only(top: 5.px),
                  child: Text(StringConstants.trips,style:MyTextStyle.titleStyle12grey,),
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
                  child: Text(StringConstants.profile,style:MyTextStyle.titleStyle12grey,),
                ),
              ],
            ),
          ),
        ],
      ),

    ):
    Container(
      height: 80.px,
      alignment: Alignment.center,
      padding: EdgeInsets.only(bottom: 10.px),
      decoration: const BoxDecoration(
        //color:navBarColor,
        color:Colors.transparent,
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
                ImageIcon(AssetImage(IconConstants.icExplore),size: 35.px,color: navBarIndex.value==0?primary3Color:text2Color,),
                Padding(
                  padding: EdgeInsets.only(top: 5.px),
                  child: Text(StringConstants.explore,style:MyTextStyle.titleStyle12w,),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              controller.changeTabIndex(1);

            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ImageIcon(AssetImage(IconConstants.icTrips),size: 35.px,color:navBarIndex.value==1?primary3Color:text2Color,),
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
  }*/
}
