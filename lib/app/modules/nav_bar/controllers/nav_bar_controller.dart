import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:home_swipping/app/modules/explore/views/explore_view.dart';
import 'package:home_swipping/app/modules/profile_setting/views/profile_setting_view.dart';

import 'package:home_swipping/app/modules/trips/views/trips_view.dart';
import 'package:home_swipping/app/routes/app_pages.dart';
final navBarIndex = 0.obs;
class NavBarController extends GetxController {
  final count = 0.obs;

  List<Widget> tabs= [
    const ExploreView(),
    const TripsView(),
    const ProfileSettingView(),
  ];
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

  changeTabIndex(int index){
    //navBarIndex.value=index;
    switch(index){
      case 1:{
        Get.toNamed(Routes.TRIPS);
      }break;
      case 2:{
        Get.toNamed(Routes.PROFILE_SETTING);
      }break;
    }
  }


}
