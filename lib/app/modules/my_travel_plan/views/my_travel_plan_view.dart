import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:home_swipping/app/data/constants/icons_constant.dart';
import 'package:home_swipping/app/data/constants/image_constants.dart';
import 'package:home_swipping/app/data/constants/string_constants.dart';
import 'package:home_swipping/common/MyTextStyle.dart';
import 'package:home_swipping/common/colors.dart';
import 'package:home_swipping/common/common_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/my_travel_plan_controller.dart';

class MyTravelPlanView extends GetView<MyTravelPlanController> {
  const MyTravelPlanView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar:CommonWidgets.appBarView(
        centerTitle: true,
        title: StringConstants.myProfile
      ),
      body:Obx(() {
        controller.count.value;
        return  SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(height: 20.px,),
              Container(
                height: 50.px,
                width: 270.px,
                decoration: BoxDecoration(
                  color:primary3Color ,
                  borderRadius: BorderRadius.circular(25.px),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                        controller.changeTabIndex(0);
                      },
                      child: Container(
                        height: 48.px,width: 130.px,
                        decoration: BoxDecoration(
                          color:controller.tabIndex.value==0?textGolden:primary3Color ,
                          borderRadius: BorderRadius.circular(25.px),
                        ),
                        child: Center(
                          child: Text(StringConstants.travel,
                            style: MyTextStyle.customStyle(fontSize: 20.px,fontFamily: 'Buenard',fontWeight: FontWeight.w700,
                                color: controller.tabIndex.value==0?primary3Color:text2Color
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        controller.changeTabIndex(1);
                      },
                      child: Container(
                        height: 48.px,width: 130.px,
                        decoration: BoxDecoration(
                          color:controller.tabIndex.value==1?textGolden:primary3Color ,
                          borderRadius: BorderRadius.circular(25.px),
                        ),
                        child: Center(
                          child: Text(StringConstants.home,
                            style: MyTextStyle.customStyle(fontSize: 20.px,fontFamily: 'Buenard',fontWeight: FontWeight.w700,
                                color: controller.tabIndex.value==1?primary3Color:text2Color
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              controller.tabIndex.value==0?
                  travelTab():homeTab()
            ],
          ),
        );
      }),
    );
  }

  Widget travelTab(){
    return Column(
      children: [
        SizedBox(height: 20.px,),
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.px)
          ),
          margin: EdgeInsets.only(left: 15.px, right: 15.px, top: 5.px, bottom: 10.px),
          color: primary3Color,
          child: Container(
            height: 400.px,

            decoration: BoxDecoration(
                color: primary3Color,
                borderRadius: BorderRadius.circular(20.px)
            ),
            clipBehavior: Clip.hardEdge,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CalendarDatePicker2(
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
                              topLeft: Radius.circular(25.px),
                              bottomLeft: Radius.circular(25.px),
                            )
                                : selectedEndDay
                                ? BorderRadius.only(
                                topRight: Radius.circular(25.px),
                                bottomRight:
                                Radius.circular(25.px))
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
                          child: Text(
                            date.day.toString(),
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: isSelected
                                    ? Colors.white
                                    : Colors.black54),
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
                Divider(thickness: 1.px,color: Colors.grey.withOpacity(0.5),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.px),
                      child: Icon(Icons.circle,size: 16.px,color:const  Color(0xFFDCD3C7),),
                    ),
                    Text(StringConstants.booked,style: MyTextStyle.titleStyle12blb,),
                    SizedBox(width: 30.px,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.px),
                      child: Icon(Icons.circle,size: 16.px,color:const  Color(0xFF69AB92),),
                    ),
                    Text(StringConstants.lookingFor,style: MyTextStyle.titleStyle12blb,),
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 10.px,),
        Divider(thickness: 1.px,color: Colors.grey.withOpacity(0.5),),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: 20.px,),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.px)
              ),
              margin: EdgeInsets.only(left: 30.px,right: 10.px,bottom: 10.px),
              elevation: 10.px,
              child: SizedBox(
                width: 170.px,
                child: CommonWidgets.commonElevatedButton(
                  onPressed: (){
                    //controller.clickOnContinueButton();
                  },

                  child: Text(StringConstants.addTravel,style: MyTextStyle.customStyle(fontSize: 18,fontWeight: FontWeight.w700,
                      color: text2Color,fontFamily: 'Lora'),),
                  borderRadius: 25.px,
                  buttonColor: primary3Color,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(StringConstants.youDoNotHaveAnyTravelPlanYet,style: MyTextStyle.titleStyle20grey,),
            ),
            SizedBox(height: 50.px,)
          ],
        ),
      ],
    );
  }
  Widget homeTab(){
    return Column(
      children: [
        SizedBox(height: 20.px,),
        Container(
          height: 75.px,
          padding: EdgeInsets.symmetric(horizontal: 15.px),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: primary3Color
          ),
          child: Row(
            children: [
              CommonWidgets.appImagesView(
                  imagePath: ImageConstants.imgHouseOwner,
                  height: 50.px,width: 50.px,
                  borderRadius: 25.px
              ),
              Expanded(
                child: Padding(
                  padding:  EdgeInsets.only(left: 5.px),
                  child: Text('Beautiful and Class...',style: MyTextStyle.customStyle(
                      fontSize: 20.px,fontFamily: 'Buenard',fontWeight: FontWeight.w700,color: const Color(0xFFB7B8BE)
                  ),),
                ),
              ),
              SizedBox(
                width: 60.px,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonWidgets.appImagesView(
                        imagePath: IconConstants.icCalender,
                        height: 25.px,width: 25.px
                    ),
                    CommonWidgets.appImagesView(
                        imagePath: IconConstants.icSetting,
                        height: 25.px,width: 25.px,
                        color: Colors.black87
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.px,),
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.px)
          ),
          margin: EdgeInsets.only(left: 15.px, right: 15.px, top: 5.px, bottom: 10.px),
          color: primary3Color,
          child: Container(
            height: 400.px,

            decoration: BoxDecoration(
                color: primary3Color,
                borderRadius: BorderRadius.circular(20.px)
            ),
            clipBehavior: Clip.hardEdge,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CalendarDatePicker2(
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
                      bool selectedStartDay = controller.homeStartRangDate != null &&
                          date.isAtSameMomentAs(controller.homeStartRangDate);
                      bool selectedEndDay = controller.homeEndRangeDate != null &&
                          date.isAtSameMomentAs(controller.homeEndRangeDate!);

                      bool isSelected = (controller.homeStartRangDate != null &&
                          controller.homeEndRangeDate != null &&
                          (date.isAfter(controller.homeStartRangDate) &&
                              date.isBefore(controller.homeEndRangeDate!
                                  .add(Duration(days: 1)))) ||
                          selectedStartDay ||
                          selectedEndDay);

                      bool isSingleDaySelected = selectedStartDay &&
                          (controller.homeEndRangeDate == null ||
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
                              topLeft: Radius.circular(25.px),
                              bottomLeft: Radius.circular(25.px),
                            )
                                : selectedEndDay
                                ? BorderRadius.only(
                                topRight: Radius.circular(25.px),
                                bottomRight:
                                Radius.circular(25.px))
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
                          child: Text(
                            date.day.toString(),
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: isSelected
                                    ? Colors.white
                                    : Colors.black54),
                          ),
                        ),
                      );
                    },
                  ),
                  value: controller.homeSelectedDateRangeList,
                  onValueChanged: (dates) {
                    final now = DateTime.now();
                    controller.homeSelectedDateRangeList = dates.where((date) {
                      return !date.isBefore(
                          DateTime(now.year, now.month, now.day));
                    }).toList();
                    controller.homeStartRangDate = dates[0];
                    if (dates.length > 1) {
                      controller.homeEndRangeDate = dates[dates.length - 1];
                    } else {
                      controller.homeEndRangeDate = null;
                    }
                    controller.increment();
                  },
                ),
                Divider(thickness: 1.px,color: Colors.grey.withOpacity(0.5),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.px),
                      child: Icon(Icons.circle,size: 16.px,color:const  Color(0xFFDCD3C7),),
                    ),
                    Text(StringConstants.booked,style: MyTextStyle.titleStyle12blb,),
                    SizedBox(width: 30.px,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.px),
                      child: Icon(Icons.circle,size: 16.px,color:const  Color(0xFF69AB92),),
                    ),
                    Text(StringConstants.lookingFor,style: MyTextStyle.titleStyle12blb,),
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 10.px,),
        Divider(thickness: 1.px,color: Colors.grey.withOpacity(0.5),),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: 20.px,),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.px)
              ),
              margin: EdgeInsets.only(left: 30.px,right: 10.px,bottom: 10.px),
              elevation: 10.px,
              child: SizedBox(
                width: 170.px,
                child: CommonWidgets.commonElevatedButton(
                  onPressed: (){
                    //controller.clickOnContinueButton();
                  },

                  child: Text(StringConstants.edit,style: MyTextStyle.customStyle(fontSize: 18,fontWeight: FontWeight.w700,
                      color: text2Color,fontFamily: 'Lora'),),
                  borderRadius: 25.px,
                  buttonColor: primary3Color,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(StringConstants.youHaveNoTravelerYet,style: MyTextStyle.titleStyle20grey,),
            ),
            SizedBox(height: 50.px,)
          ],
        ),
      ],
    );
  }
}
