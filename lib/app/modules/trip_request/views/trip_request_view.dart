import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/trip_request_controller.dart';

class TripRequestView extends GetView<TripRequestController> {
  const TripRequestView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Obx((){
        controller.count.value;
        return Column(
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
                  //controller.openDateBottomSheet(context);
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
                    bool selectedStartDay = controller.startRangDate != null &&
                        date.isAtSameMomentAs(controller.startRangDate);
                    bool selectedEndDay = controller.endRangeDate != null &&
                        date.isAtSameMomentAs(controller.endRangeDate!);

                    bool isSelected = (controller.startRangDate != null &&
                        controller.endRangeDate != null &&
                        (date.isAfter(controller.startRangDate) &&
                            date.isBefore(controller.endRangeDate!
                                .add(Duration(days: 1)))) ||
                        selectedStartDay ||
                        selectedEndDay);
                    bool isPastDate = date.isBefore(
                        DateTime.now().subtract(Duration(days: 1)));

                    bool isSingleDaySelected = selectedStartDay &&
                        (controller.endRangeDate == null ||
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
                value: controller.selectedDateRangeList,
                onValueChanged: (dates) {
                  final now = DateTime.now();
                  controller.selectedDateRangeList = dates.where((date) {
                    return !date.isBefore(
                        DateTime(now.year, now.month, now.day));
                  }).toList();
                  controller.startRangDate = dates[0];
                  if (dates.length > 1) {
                    controller.endRangeDate = dates[dates.length - 1];
                  } else {
                    controller.endRangeDate = null;
                  }
                  controller.increment();
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
                      Text('${controller.chooseMonth(controller.startRangDate.month)}. ${controller.startRangDate.day} ${controller.endRangeDate!=null?controller.endRangeDate!.day:''}',style:  MyTextStyle.customStyle(
                          fontFamily: "Buenard",fontWeight: FontWeight.w700,fontSize: 18,color:Colors.black87
                      ),),
                      if(controller.endRangeDate!=null)
                        Text(' | ${controller.endRangeDate!.difference(controller.startRangDate).inDays+1} nights ',style:  MyTextStyle.customStyle(
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
        );
      })
    );
  }
}
