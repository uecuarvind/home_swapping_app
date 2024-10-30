import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:home_swipping/app/modules/explore/views/explore_view.dart';
import 'package:home_swipping/app/modules/profile_setting/views/profile_setting_view.dart';
import 'package:home_swipping/app/routes/app_pages.dart';

class NavBarController extends GetxController {
  //TODO: Implement NavBarController
  final tabIndex = 0.obs;

  final count = 0.obs;

  List<Widget> tabs= [
    const ExploreView(),
    const ExploreView(),
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
    tabIndex.value=index;
  }
  onTapGoToTrip(){
    Get.toNamed(Routes.TRIPS);
  }
  onTapGoToProfile(){
    Get.toNamed(Routes.PROFILE);
  }
}
