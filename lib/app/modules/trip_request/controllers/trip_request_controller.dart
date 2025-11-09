import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_swipping/app/data/api_constants/api_key_constants.dart';
import 'package:home_swipping/app/routes/app_pages.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/api_methods/api_methods.dart';
import '../../../data/api_models/get_house_detail.dart';

class TripRequestController extends GetxController {
  List<DateTime?> selectedDateRangeList = [];
  // DateTime startRangDate=DateTime.now();
  // DateTime? endRangeDate=DateTime.now();
  DateTime? startRangDate ;
  DateTime? endRangeDate ;
  //final calendarIndex = 0.obs;

  final count = 0.obs;
  final isLoading = false.obs;
  Map<String,String?>parameter=Get.parameters;
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

  String chooseMonth(int mm){
    String month='';
    switch(mm) {
      case 1:
        month = 'January';
        break;
      case 2:
        month = 'February';
        break;
      case 3:
        month = 'March';
        break;
      case 4:
        month = 'April';
        break;
      case 5:
        month = 'May';
        break;
      case 6:
        month = 'June';
        break;
      case 7:
        month = 'July';
        break;
      case 8:
        month = 'August';
        break;
      case 9:
        month = 'September';
        break;
      case 10:
        month = 'October';
        break;
      case 11:
        month = 'November';
        break;
      case 12:
        month = 'December';
        break;
    }
    return month;
  }


/*
  void openDateBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SizedBox(
              height: 540,
              child: Container(
                decoration: BoxDecoration(
                    color: primary3Color,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(14.px),topRight: Radius.circular(14.px))
                ),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 20.px,
                              right: 20.px,
                              top: 15.px,
                              bottom: 0.px),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: const Icon(
                                        Icons.cancel_outlined,
                                        size: 20,
                                        color: Colors.black,
                                      )),
                                  InkWell(
                                    onTap: () {
                                      startRangDate = DateTime.now();
                                      endRangeDate = DateTime.now();
                                      selectedDateRangeList.clear();
                                      Get.back();
                                    },
                                    child: const Text(
                                      'Reset',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              if (startRangDate != null && endRangeDate != null)
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                      "${endRangeDate!.difference(startRangDate).inDays + 1} nights selected",
                                      style: MyTextStyle.customStyle(
                                          fontWeight: FontWeight.w700,color: Colors.black87,fontSize: 18.px
                                      )
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1.px,
                      color: text2Color,
                    ),
                    CalendarDatePicker2(
                      config: CalendarDatePicker2Config(
                        firstDayOfWeek: 1,
                        calendarType: CalendarDatePicker2Type.range,

                        selectedDayTextStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                        selectedDayHighlightColor: Colors.grey.withOpacity(0.5),
                        selectedRangeHighlightColor: Colors.grey.withOpacity(0.5),
                        hideYearPickerDividers: true,
                        disableMonthPicker: true,
                        weekdayLabels: [
                          "Sun",
                          "Mon",
                          "Tue",
                          "Wed",
                          "Thu",
                          "Fri",
                          "Sat"
                        ],
                        centerAlignModePicker: true,
                        customModePickerIcon: SizedBox(),
                        dayBuilder: ({
                          required DateTime date,
                          BoxDecoration? decoration,
                          bool? isDisabled,
                          bool? isSelected,
                          bool? isToday,
                          TextStyle? textStyle,
                        }) {
                          bool selectedStartDay = startRangDate != null &&
                              date.isAtSameMomentAs(startRangDate);
                          bool selectedEndDay = endRangeDate != null &&
                              date.isAtSameMomentAs(endRangeDate!);

                          bool isSelected = (startRangDate != null &&
                              endRangeDate != null &&
                              (date.isAfter(startRangDate) &&
                                  date.isBefore(endRangeDate!
                                      .add(Duration(days: 1)))) ||
                              selectedStartDay ||
                              selectedEndDay);

                          return Container(

                            margin: EdgeInsets.zero,

                            alignment: Alignment.center,
                            child: Container(
                              height: 35,
                              width: 35,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  color: isSelected
                                      ? Colors.black
                                      : Colors.transparent),
                              clipBehavior: Clip.hardEdge,
                              child: Text(
                                date.day.toString(),
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                          );
                        },
                      ),
                      value:selectedDateRangeList,
                      onValueChanged: (dates) {
                      setState((){

                        selectedDateRangeList=dates;
                        startRangDate = dates[0];
                        if (dates.length > 1) {
                          endRangeDate = dates[dates.length - 1];
                        } else {
                          endRangeDate = null;
                        }
                      });

                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: 35,
                        width: 120,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black),
                        child: Text(
                          'Done',
                          style: MyTextStyle.titleStyle16bw,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }*/

  void clickOnSend(BuildContext context){
   Map<String,String> data={
     ApiKeyConstants.startDate: DateFormat('yyyy-MM-dd').format(startRangDate!),
     ApiKeyConstants.endDate: DateFormat('yyyy-MM-dd').format(endRangeDate??startRangDate!),

   };
    if(parameter[ApiKeyConstants.from]=='StaySwap'){
      Get.back(result: data);
    }else{
      callingHouseDetailApi(context,data);
    }
  }

  void callingHouseDetailApi(BuildContext context,Map<String,String> data) async {
    try {
      HouseDetailModel? houseDetailModel =
      await ApiMethods.houseDetailsApi(houseId:parameter[ApiKeyConstants.houseId]??'');
      if (houseDetailModel != null && houseDetailModel.success == true && houseDetailModel.houseDetails!=null) {
        HouseDetails houseDetails=houseDetailModel.houseDetails!;
        isLoading.value = false;
        print('Successfully get:-${houseDetailModel.message}');
        Get.toNamed(Routes.SEND_SWAP_OFFER,parameters: data,arguments: houseDetails);
      } else {
        print("Failed update.......");
        CommonWidgets.showSnackBar(context: context,message:'Failed  house details...',status: false);
      }
      isLoading.value = false;
    }catch(e){
      isLoading.value = false;
      CommonWidgets.showSnackBar(context: context,message:'Some thing is wrong...',status: false);
    }
    increment();
  }
}
