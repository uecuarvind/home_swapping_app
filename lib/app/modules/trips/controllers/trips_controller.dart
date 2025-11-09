import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:home_swipping/app/data/api_constants/api_key_constants.dart';
import 'package:home_swipping/app/data/constants/image_constants.dart';
import 'package:home_swipping/app/data/constants/string_constants.dart';
import 'package:home_swipping/app/routes/app_pages.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/api_methods/api_methods.dart';
import '../../../data/api_models/get_all_house.dart';
import '../../../data/api_models/get_booking_model.dart';

final tripRequestChange=false.obs;
class TripsController extends GetxController {
  TextEditingController searchController=TextEditingController();
  List<DateTime?> selectedDateRangeList = [];
  DateTime startRangDate =DateTime.now();
  DateTime? endRangeDate =DateTime.now();
  final count = 0.obs;
  final currentTab = 0.obs;
  final isLoading = true.obs;
  final showSearching = false.obs;
  final isModernDesignSelected = false.obs;
  List<String> tabList=[StringConstants.traveling,StringConstants.hosting,StringConstants.booked,StringConstants.support];
  // List<String> expiringList=['assets/images/maxicoCity.png',
  // ImageConstants.imgTravelingPhoto1,'assets/images/maxicoCity.png',ImageConstants.imgTravelingPhoto2,];


  List<BookingRequests> travellingList=[];
  List<BookingRequests> hostingList=[];
  List<BookingRequests> bookedList=[];
  List<Houses> expiringHouseList=[];
  @override
  void onInit() async{
    super.onInit();
    travellingList.clear();
    hostingList.clear();
    bookedList.clear();
    await callingGetAllHouseApi(Get.context!);
    await callingGetYourBookingApi(Get.context!);
     callingGetHostingApi(Get.context!);
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



void changeTab(int index){
  switch(index){
    case 0:{
      currentTab.value=index;
      increment();
    }break;
    case 1:{
      currentTab.value=index;
      increment();
    }break;
    case 2:{
      Get.toNamed(Routes.TRIP,arguments: bookedList);
    }break;
    case 3:{
      Get.toNamed(Routes.SPPORT_TEAM);
    }break;
  }
      // if(index==3){
      //   Get.toNamed(Routes.SPPORT_TEAM);
      // }else{
      //   currentTab.value=index;
      //   increment();
      // }
}


  void clickOnExpiring(int index){
    Map<String,String> data={
      ApiKeyConstants.houseId:expiringHouseList[index].sId??''
    };
     Get.toNamed(Routes.MATCH_SCREEN,parameters: data);

  }
  void clickOnTravelingUser(int index) async{
     Map<String,String> data={
       ApiKeyConstants.type:'My'
     };
//Routes.REQUEST_DETAILS
     await Get.toNamed(Routes.REQUEST_CHAT,arguments: travellingList[index],parameters: data);
     if(tripRequestChange.value){
       isLoading.value=true;
       onInit();
       tripRequestChange.value=false;
     }
  }
  void clickOnHostingUser(int index) async{
      //Get.toNamed(Routes.REVIEW_YOUR_SEND_REQUEST);
    Map<String,String> data={
      ApiKeyConstants.type:'Other'
    };
    await Get.toNamed(Routes.REQUEST_CHAT,arguments: hostingList[index],parameters: data);
    if(tripRequestChange.value){
      isLoading.value=true;
      onInit();
      tripRequestChange.value=false;
    }
  }
  void clickOnBookedUser(int index){
    Map<String,String> data={
      ApiKeyConstants.type:'Booked'
    };
    Get.offNamed(Routes.BOOKED_DETAILS, arguments: bookedList[index],parameters: data);
  }

  String getTimeText(String givenTime) {
    final DateTime givenDate = DateTime.parse(givenTime);
    final DateTime now = DateTime.now();

    final Duration difference = now.difference(givenDate);

    if (difference.inHours < 24 ) {
      return "Today";
    } else if (difference.inHours >= 24 && difference.inHours < 48) {
      return "Yesterday";
    } else {
      final int days = difference.inDays;
      return "$days days";
    }
  }

  Future<void> callingGetYourBookingApi(BuildContext context) async {
    try {
      GetBookingModel? getYourBookingModel =
      await ApiMethods.getYourBookListApi();
      if (getYourBookingModel != null && getYourBookingModel.success == true && getYourBookingModel.data!=null
      && getYourBookingModel.data!.bookingRequests!=null) {
        for(int i=0;i<getYourBookingModel.data!.bookingRequests!.length;i++){
          if(getYourBookingModel.data!.bookingRequests![i].isAccepted??false){
            bookedList.add(getYourBookingModel.data!.bookingRequests![i]);
          }else{
            travellingList.add(getYourBookingModel.data!.bookingRequests![i]);
          }
        }
        isLoading.value = false;
        print('Successfully get my booking:-${getYourBookingModel.message}');
      } else {
        print("Failed update.......");
        CommonWidgets.showSnackBar(context: context,message:'Failed get booking requests..',status: false);
      }
      isLoading.value = false;
    }catch(e){
      isLoading.value = false;
      CommonWidgets.showSnackBar(context: context,message:'Some thing is wrong...',status: false);
    }
    increment();
  }

  Future<void> callingGetHostingApi(BuildContext context) async {
    try {
      GetBookingModel? getBookingModel =
      await ApiMethods.getHostingBookListApi();
      if (getBookingModel != null && getBookingModel.success == true && getBookingModel.data!=null && getBookingModel.data?.bookingRequests!=null) {
        for(int i=0;i<getBookingModel.data!.bookingRequests!.length;i++){
          if(getBookingModel.data!.bookingRequests![i].isAccepted??false){
            bookedList.add(getBookingModel.data!.bookingRequests![i]);
          }else{
            hostingList.add(getBookingModel.data!.bookingRequests![i]);
          }
        }
        isLoading.value = false;
        print('Successfully get request:-${getBookingModel.message}');
        } else {
        print("Failed update.......");
        CommonWidgets.showSnackBar(context: context,message:'Failed get booking requests..',status: false);
      }
      isLoading.value = false;
    }catch(e){
      isLoading.value = false;
      CommonWidgets.showSnackBar(context: context,message:'Some thing is wrong...',status: false);
    }
    increment();
  }



  Future<void> callingGetAllHouseApi(BuildContext context) async {
    try {
      AllHouseModel? allExpiringHouseModel =
      await ApiMethods.getAllExpiringHousesApi();
      if (allExpiringHouseModel != null && allExpiringHouseModel.success == true && allExpiringHouseModel.houses!=null && allExpiringHouseModel.houses!.isNotEmpty) {
        expiringHouseList=allExpiringHouseModel.houses!;
      } else {
        print('failed api.......');
        CommonWidgets.showSnackBar(context: context,message:
        allExpiringHouseModel?.message ?? 'Houses are not available...',status: false);

      }
    } catch (e) {
      print('Error:-  ${e.toString()}');
      CommonWidgets.showSnackBar(context: context,message:'Some thing is wrong server issue...',status: false);
    }
  }


}
