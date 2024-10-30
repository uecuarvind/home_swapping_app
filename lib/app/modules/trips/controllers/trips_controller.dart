import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:home_swipping/app/data/constants/string_constants.dart';
import 'package:home_swipping/common/MyTextStyle.dart';
import 'package:home_swipping/common/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TripsController extends GetxController {
  List<DateTime?> selectedDateRangeList = [];
  DateTime startRangDate =DateTime.now();
  DateTime? endRangeDate =DateTime.now();
  final count = 0.obs;
  final isModernDesignSelected = false.obs;

  List<Map<String,String>> spaceCommonFeaturesList = [
    {
      'featureName':'Table',
      'featureIcon':'assets/icons/ic_table.png',
    },
    {
      'featureName':'Chair',
      'featureIcon':'assets/icons/ic_chair.png',
    },
    {
      'featureName':'Balcony',
      'featureIcon':'assets/icons/ic_balcony.png',
    },
    {
      'featureName':'Wifi',
      'featureIcon':'assets/icons/ic_wifi.png',
    },
    {
      'featureName':'Dishwasher',
      'featureIcon':'assets/icons/ic_dishwasher.png',
    },
    {
      'featureName':'Mini fridge',
      'featureIcon':'assets/icons/ic_mini_fridge.png',
    },
    {
      'featureName':'Refrigerator',
      'featureIcon':'assets/icons/ic_refrigerator.png',
    },
    {
      'featureName':'Stove',
      'featureIcon':'assets/icons/ic_stove.png',
    },
    {
      'featureName':'Freezer',
      'featureIcon':'assets/icons/ic_freezer.png',
    },
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

    selectModernDesign(){
      isModernDesignSelected.value=(!isModernDesignSelected.value);
    }


  void openBottomSheetCrossDateCalender(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: backgroundColor,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SizedBox(
              height: 630,
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          height:80.px,
                          padding: EdgeInsets.only( top: 20.px, bottom: 30.px),
                          decoration: const BoxDecoration(
                            color: primary3Color
                          ),
                          child: ListTile(
                            title: Center(
                              child: Padding(
                                padding: EdgeInsets.only(left: 30.px),
                                child: Text(StringConstants.tripRequest,style:  MyTextStyle.customStyle(
                                    fontFamily: "Lora",fontWeight: FontWeight.w700,fontSize: 18,color:Colors.black87
                                ),),
                              ),
                            ),
                            trailing: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                Icons.close_rounded,
                                size: 25,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 10.px,horizontal: 20.px),
                    title: Text(StringConstants.sendNewDates,style:  MyTextStyle.customStyle(
                        fontFamily: "Buenard",fontWeight: FontWeight.w700,fontSize: 18,color:Colors.black87
                    ),),
                    trailing: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.close_rounded,
                        size: 25,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Container(
                    height: 340.px,
                    margin: EdgeInsets.only(left: 15.px, right: 15.px, top: 5.px, bottom: 10.px),
                    decoration: BoxDecoration(
                      color: primary3Color,
                      borderRadius: BorderRadius.circular(20.px)
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: CalendarDatePicker2(
                      config: CalendarDatePicker2Config(
                        firstDayOfWeek: 1,
                        calendarType: CalendarDatePicker2Type.range,
                        selectedDayTextStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                        selectedDayHighlightColor: Colors.transparent,
                        selectedRangeHighlightColor: Colors.blue,
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
                          bool isPastDate = date.isBefore(
                              DateTime.now().subtract(Duration(days: 1)));

                          bool isSingleDaySelected = selectedStartDay &&
                              (endRangeDate == null ||
                                  selectedStartDay && selectedEndDay);

                          return Container(
                            height: 40,
                            width: 40,
                            margin: EdgeInsets.zero,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: isSelected
                                    ? Colors.blue
                                    : Colors.transparent,
                                borderRadius: isSingleDaySelected
                                    ? BorderRadius.circular(25)
                                    : (selectedStartDay)
                                    ? BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  bottomLeft: Radius.circular(25),
                                )
                                    : selectedEndDay
                                    ? BorderRadius.only(
                                    topRight: Radius.circular(25),
                                    bottomRight:
                                    Radius.circular(25))
                                    : BorderRadius.circular(0)),
                            clipBehavior: Clip.hardEdge,
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: (selectedStartDay || selectedEndDay)
                                      ? Colors.white.withOpacity(0.6)
                                      : Colors.transparent),
                              clipBehavior: Clip.hardEdge,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Text(
                                    date.day.toString(),
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: isSelected
                                            ? Colors.white
                                            : Colors.black54),
                                  ),
                                  isPastDate
                                      ? Transform.rotate(
                                    angle: -10,
                                    child: Container(
                                      width: 20.px,
                                      height: 2.px,
                                      decoration: BoxDecoration(
                                          color: Colors.black),
                                    ),
                                  )
                                      : SizedBox(
                                    height: 2,
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      value: selectedDateRangeList,
                      onValueChanged: (dates) {
                        final now = DateTime.now();
                        selectedDateRangeList = dates.where((date) {
                          return !date.isBefore(
                              DateTime(now.year, now.month, now.day));
                        }).toList();
                        setState(() {
                          startRangDate = dates[0];
                          if (dates.length > 1) {
                            endRangeDate = dates[dates.length - 1];
                          } else {
                            endRangeDate = null;
                          }
                        });
                      },
                    ),
                  ),


                  Padding(
                    padding: EdgeInsets.only(left: 15.px),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(StringConstants.dates,style:  MyTextStyle.customStyle(
                            fontFamily: "Buenard",fontWeight: FontWeight.w700,fontSize: 16,color:Colors.black87
                        ),),
                        Row(
                          children: [
                            Text('${chooseMonth(startRangDate.month)}. ${startRangDate.day} ${endRangeDate!=null?endRangeDate!.day:''}',style:  MyTextStyle.customStyle(
                                fontFamily: "Buenard",fontWeight: FontWeight.w700,fontSize: 18,color:Colors.black87
                            ),),
                            if(endRangeDate!=null)
                            Text(' | ${endRangeDate!.difference(startRangDate).inDays+1} nights ',style:  MyTextStyle.customStyle(
                                fontFamily: "Buenard",fontWeight: FontWeight.w700,fontSize: 18,color:Colors.black38
                            ),),
                          ],
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            height: 52.px,
                            width: 130.px,
                            margin: EdgeInsets.only(top: 10.px,right: 20.px),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(26.px),
                              color: const Color(0xFFF0F2FF),
                              border: Border.all(width: 1.px,color: const Color(0xFFDEF1FF))
                            ),
                            child: Text(StringConstants.send,style: MyTextStyle.customStyle(
                                fontFamily: "Lora",fontWeight: FontWeight.w500,fontSize: 16,color:textGolden
                            ),),
                          ),
                        )
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
}
