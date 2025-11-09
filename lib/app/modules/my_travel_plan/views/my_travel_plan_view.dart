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
import 'package:home_swipping/common/dateRangeFormate.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';

import '../controllers/my_travel_plan_controller.dart';

class MyTravelPlanView extends GetView<MyTravelPlanController> {
  const MyTravelPlanView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor ,
      // appBar:CommonWidgets.appBarView(
      //   centerTitle: true,
      //   title: StringConstants.myProfile
      // ),
      body:Obx(() {
        controller.count.value;
        return  Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageConstants.imgExploreBackground),
              fit: BoxFit.fill
            )
          ),
          child: SafeArea(
            child: Column(
              children: [
                Text(StringConstants.myPlans,style: MyTextStyle.titleStyle20bw,),
                SizedBox(height: 10.px,),
                Container(
                  height: 40.px,
                  width: 260.px,
                  decoration: BoxDecoration(
                    color:primary3Color.withOpacity(0.33) ,
                    borderRadius: BorderRadius.circular(10.px),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                          controller.changeTabIndex(0);
                        },
                        child: Container(
                          height: 40.px,width: 130.px,
                          decoration: BoxDecoration(
                            color:controller.tabIndex.value==0?primary3Color:null ,
                            borderRadius: BorderRadius.circular(10.px),
                          ),
                          child: Center(
                            child: Text(StringConstants.travel,
                              style: MyTextStyle.customStyle(fontSize: 12.px,fontFamily: 'Lora',fontWeight: FontWeight.w700,
                                  color: controller.tabIndex.value==0?textColor:primary3Color
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
                          height: 40.px,width: 130.px,
                          decoration: BoxDecoration(
                            color:controller.tabIndex.value==1?primary3Color:null,
                            borderRadius: BorderRadius.circular(10.px),
                          ),
                          child: Center(
                            child: Text(StringConstants.home,
                              style: MyTextStyle.customStyle(fontSize: 12.px,fontFamily: 'Lora',fontWeight: FontWeight.w700,
                                  color: controller.tabIndex.value==1?textColor:primary3Color
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                controller.tabIndex.value==0?
                    travelTab(context):homeTab(context)
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget travelTab(BuildContext context){
    return Column(
      children: [
       /* Card(
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
                                  .add(Duration(days: 0)))) ||
                          selectedStartDay ||
                          selectedEndDay) || controller.checkAvailableDate(date);

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
        ),*/
        Container(
          height: 440.px,

          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20.px)
          ),
          clipBehavior: Clip.hardEdge,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: ScrollableCleanCalendar(
                  spaceBetweenCalendars: 5.px,
                  spaceBetweenMonthAndCalendar: 2.px,
                  calendarController: CleanCalendarController(
                    rangeMode: true,
                    minDate:DateTime.now(),
                    //DateTime.now().subtract(const Duration(days: 60)),
                    initialFocusDate: DateTime.now(),
                    initialDateSelected: controller.startRangDate,
                    endDateSelected: controller.endRangeDate,
                    maxDate:
                    DateTime.now().add(const Duration(days: 365)),
                    onAfterMaxDateTapped: (date) {
                      print('press after...');
                    },
                    onPreviousMinDateTapped: (date) {
                      print('press previous...');
                    },
                    onRangeSelected: (firstDate, secondDate) {

                      controller.startRangDate = firstDate;
                      controller.endRangeDate = secondDate;
                      controller.increment();
                      print(
                          'Range Selected: ${controller.startRangDate} to ${controller.endRangeDate}');

                    },
                    onDayTapped: (date) {
                      print('Day Tapped: $date');
                    },
                    weekdayStart: DateTime.monday,
                  ),
                  layout: Layout.BEAUTY,
                  calendarCrossAxisSpacing: 0,
                  daySelectedBackgroundColor:
                  Colors.grey.withOpacity(0.5),
                  daySelectedBackgroundColorBetween:
                  Colors.blue.withOpacity(0.5),
                  dayBackgroundColor: Colors.purple,
                  dayDisableBackgroundColor: Colors.teal,
                  dayDisableColor: Colors.black54,
                  dayTextStyle:
                  MyTextStyle.customStyle(
                      fontSize: 14.px,color: primary3Color,fontWeight: FontWeight.w700,fontFamily: 'Lora'
                  ),
                  monthTextAlign: TextAlign.start,
                  weekdayTextStyle: MyTextStyle.customStyle(
                      fontSize: 14.px,color: primary3Color,fontWeight: FontWeight.w700,fontFamily: 'Lora'
                  ),
                  monthTextStyle: MyTextStyle.customStyle(
                      fontSize: 16.px,color: primary3Color,fontWeight: FontWeight.w700,fontFamily: 'Lora'
                  ),
                  dayBuilder: (context, day) {
                    bool selectedStartDay = controller.startRangDate != null &&
                        day.day.day==controller.startRangDate.day && day.day.month==controller.startRangDate.month;
                    bool selectedEndDay = controller.endRangeDate != null &&
                        day.day.day==controller.endRangeDate!.day && day.day.month==controller.endRangeDate!.month;

                    bool isSelected = (controller.startRangDate != null &&
                        controller.endRangeDate != null &&
                        (day.day.isAfter(controller.startRangDate) &&
                            day.day.isBefore(controller.endRangeDate!
                                .add(Duration(days: 0)))) ||
                        selectedStartDay ||
                        selectedEndDay) || controller.checkAvailableDate(day.day);

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
                              ? const Color(0xFFADDCFF).withOpacity(0.41)
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
                                ? primary3Color
                                : Colors.transparent),
                        clipBehavior: Clip.hardEdge,
                        child: Text(
                          day.day.day.toString(),
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: (selectedStartDay || selectedEndDay)
                                  ?Colors.black54
                                  : primary3Color),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.px,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [

            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.px),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(height: 10.px,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(StringConstants.youDoNotHaveAnyTravelPlanYet,style: MyTextStyle.customStyle(
                          fontFamily: 'Lora',fontSize: 15,fontWeight: FontWeight.w500,color: primary3Color
                      ),),
                      Container(
                        height: 25.px,width: 25.px,
                        decoration: BoxDecoration(
                            color: primary3Color.withOpacity(0.20),
                            borderRadius: BorderRadius.circular(15.px)
                        ),
                        child: Icon(Icons.add,size: 20.px,color: primary3Color,),
                      )
                    ],
                  ),
                  if(controller.startRangDate!=null && controller.endRangeDate!=null)
                    Container(
                      width: MediaQuery.of(context).size.width  ,
                      padding: EdgeInsets.all(15.px),
                      margin: EdgeInsets.symmetric(vertical: 10.px),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.px),
                          color: primary3Color.withOpacity(0.15)
                      ),
                      child: Column(
                        children: [
                          Text('${DateRangeFormat.dateRangeCount(controller.startRangDate.toString(), controller.endRangeDate.toString())} Nights',
                            style: MyTextStyle.customStyle(fontWeight: FontWeight.w500,color: primary3Color,fontSize: 16,),),
                          Container(
                            height: 40.px,
                            margin: EdgeInsets.symmetric(vertical: 3.px),
                            padding: EdgeInsets.symmetric(horizontal: 15.px,vertical: 8.px),
                            decoration: BoxDecoration(
                                color:   primary3Color.withOpacity(0.25),
                                borderRadius: BorderRadius.circular(15.px),
                                border: Border.all(color: const Color(0xFFAED5FF),width: 2.px)
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CommonWidgets.appImagesView(
                                    imagePath: IconConstants.icCalender,height: 20.px,width: 20.px,color: primary3Color),
                                SizedBox(width: 5.px,),
                                Text('${DateRangeFormat.formatDateRange(controller.startRangDate.toString(), controller.endRangeDate.toString())}',
                                  style: MyTextStyle.customStyle(fontWeight: FontWeight.w500,color: primary3Color,fontSize: 14,),),

                              ],
                            ),
                          ),
                          Text(StringConstants.addTravel, style: MyTextStyle.customStyle(fontWeight: FontWeight.w500,color: primary3Color,fontSize: 14,),)
                          ,CommonWidgets.gradientButton(onPressed: (){
                            controller.showAlertBox(context);
                          },
                              text: 'Set',wantContentSizeButton: true,height: 40.px,width: 95.px,
                            isLoading: controller.isLoading.value
                          )
                        ],
                      ),
                    )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
  Widget homeTab(BuildContext context){
    return Column(
      children: [
        // SizedBox(height: 20.px,),
        // Container(
        //   height: 75.px,
        //   padding: EdgeInsets.symmetric(horizontal: 15.px),
        //   alignment: Alignment.center,
        //   decoration: const BoxDecoration(
        //     color: primary3Color
        //   ),
        //   child: Row(
        //     children: [
        //       CommonWidgets.appImagesView(
        //           imagePath: ImageConstants.imgHouseOwner,
        //           height: 50.px,width: 50.px,
        //           borderRadius: 25.px
        //       ),
        //       Expanded(
        //         child: Padding(
        //           padding:  EdgeInsets.only(left: 5.px),
        //           child: Text('Beautiful and Class...',style: MyTextStyle.customStyle(
        //               fontSize: 20.px,fontFamily: 'Buenard',fontWeight: FontWeight.w700,color: const Color(0xFFB7B8BE)
        //           ),),
        //         ),
        //       ),
        //       SizedBox(
        //         width: 60.px,
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             CommonWidgets.appImagesView(
        //                 imagePath: IconConstants.icCalender,
        //                 height: 25.px,width: 25.px
        //             ),
        //             CommonWidgets.appImagesView(
        //                 imagePath: IconConstants.icSetting,
        //                 height: 25.px,width: 25.px,
        //                 color: Colors.black87
        //             )
        //           ],
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        Container(
          height: 440.px,

          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20.px)
          ),
          clipBehavior: Clip.hardEdge,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
             /* CalendarDatePicker2(
                onDisplayedMonthChanged: (DateTime dateTime){
                  controller.callingBookedDatesListApi(context,dateTime.month.toString(),dateTime.year.toString());
                },
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
                        date.day==controller.homeStartRangDate.day;
                    bool selectedEndDay = controller.homeEndRangeDate != null &&
                        date.day==controller.homeEndRangeDate!.day;

                    bool isSelected = (controller.homeStartRangDate != null &&
                        controller.homeEndRangeDate != null &&
                        (date.isAfter(controller.homeStartRangDate) &&
                            date.isBefore(controller.homeEndRangeDate!
                                .add(Duration(days: 0)))) ||
                        selectedStartDay ||
                        selectedEndDay) || controller.checkAvailable(date);

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
              */
              Expanded(
                child: ScrollableCleanCalendar(
                  spaceBetweenCalendars: 5.px,
                  spaceBetweenMonthAndCalendar: 2.px,
                  calendarController: CleanCalendarController(
                    rangeMode: true,
                    minDate:DateTime.now(),
                    //DateTime.now().subtract(const Duration(days: 60)),
                    initialFocusDate: DateTime.now(),
                    initialDateSelected: controller.homeStartRangDate,
                    endDateSelected: controller.homeEndRangeDate,
                    maxDate:
                    DateTime.now().add(const Duration(days: 365)),
                    onAfterMaxDateTapped: (date) {
                      print('press after...');
                    },
                    onPreviousMinDateTapped: (date) {
                      print('press previous...');
                    },
                    onRangeSelected: (firstDate, secondDate) {

                      controller.homeStartRangDate = firstDate;
                        controller.homeEndRangeDate = secondDate;
                      controller.increment();
                        print(
                            'Range Selected: ${controller.homeStartRangDate} to ${controller.homeEndRangeDate}');

                    },
                    onDayTapped: (date) {
                      print('Day Tapped: $date');
                    },
                    weekdayStart: DateTime.monday,
                  ),
                  layout: Layout.BEAUTY,
                  calendarCrossAxisSpacing: 0,
                  daySelectedBackgroundColor:
                  Colors.grey.withOpacity(0.5),
                  daySelectedBackgroundColorBetween:
                  Colors.blue.withOpacity(0.5),
                  dayBackgroundColor: Colors.purple,
                  dayDisableBackgroundColor: Colors.teal,
                  dayDisableColor: Colors.black54,
                  dayTextStyle:
                  MyTextStyle.customStyle(
                      fontSize: 14.px,color: primary3Color,fontWeight: FontWeight.w700,fontFamily: 'Lora'
                  ),
                  monthTextAlign: TextAlign.start,
                  weekdayTextStyle: MyTextStyle.customStyle(
                      fontSize: 14.px,color: primary3Color,fontWeight: FontWeight.w700,fontFamily: 'Lora'
                  ),
                  monthTextStyle: MyTextStyle.customStyle(
                      fontSize: 16.px,color: primary3Color,fontWeight: FontWeight.w700,fontFamily: 'Lora'
                  ),
                  dayBuilder: (context, day) {
                    bool selectedStartDay = controller.homeStartRangDate != null &&
                        day.day.day==controller.homeStartRangDate.day && day.day.month==controller.homeStartRangDate.month;
                    bool selectedEndDay = controller.homeEndRangeDate != null &&
                        day.day.day==controller.homeEndRangeDate!.day && day.day.month==controller.homeEndRangeDate!.month;

                    bool isSelected = (controller.homeStartRangDate != null &&
                        controller.homeEndRangeDate != null &&
                        (day.day.isAfter(controller.homeStartRangDate) &&
                            day.day.isBefore(controller.homeEndRangeDate!
                                .add(Duration(days: 0)))) ||
                        selectedStartDay ||
                        selectedEndDay) || controller.checkAvailable(day.day);

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
                              ? const Color(0xFFADDCFF).withOpacity(0.41)
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
                                ? primary3Color
                                : Colors.transparent),
                        clipBehavior: Clip.hardEdge,
                        child: Text(
                          day.day.day.toString(),
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: (selectedStartDay || selectedEndDay)
                                  ?Colors.black54
                                  : primary3Color),
                        ),
                      ),
                    );
                  },
                ),
              ),

            ],
          ),
        ),
        SizedBox(height: 10.px,),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.px),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 10.px,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(StringConstants.youHaveNoTravelerYet,style: MyTextStyle.customStyle(
                    fontFamily: 'Lora',fontSize: 15,fontWeight: FontWeight.w500,color: primary3Color
                  ),),
                  Container(
                    height: 25.px,width: 25.px,
                    decoration: BoxDecoration(
                      color: primary3Color.withOpacity(0.20),
                      borderRadius: BorderRadius.circular(15.px)
                    ),
                    child: Icon(Icons.add,size: 20.px,color: primary3Color,),
                  )
                ],
              ),
              if(controller.homeStartRangDate!=null && controller.homeEndRangeDate!=null)
              Container(
                width: MediaQuery.of(context).size.width  ,
                padding: EdgeInsets.all(15.px),
                margin: EdgeInsets.symmetric(vertical: 10.px),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.px),
                  color: primary3Color.withOpacity(0.15)
                ),
                child: Column(
                  children: [
                    Text('${DateRangeFormat.dateRangeCount(controller.homeStartRangDate.toString(), controller.homeEndRangeDate.toString())} Nights',
                    style: MyTextStyle.customStyle(fontWeight: FontWeight.w500,color: primary3Color,fontSize: 16,),),
                   Container(
                     height: 40.px,
                     margin: EdgeInsets.symmetric(vertical: 3.px),
                     padding: EdgeInsets.symmetric(horizontal: 15.px,vertical: 8.px),
                     decoration: BoxDecoration(
                       color:   primary3Color.withOpacity(0.25),
                       borderRadius: BorderRadius.circular(15.px),
                       border: Border.all(color: const Color(0xFFAED5FF),width: 2.px)
                     ),
                     child: Row(
                       mainAxisSize: MainAxisSize.min,
                       children: [
                         CommonWidgets.appImagesView(
                             imagePath: IconConstants.icCalender,height: 20.px,width: 20.px,color: primary3Color),
                         SizedBox(width: 5.px,),
                         Text('${DateRangeFormat.formatDateRange(controller.homeStartRangDate.toString(), controller.homeEndRangeDate.toString())}',
                           style: MyTextStyle.customStyle(fontWeight: FontWeight.w500,color: primary3Color,fontSize: 14,),),

                       ],
                     ),
                   ),
                    Text('Block Dates', style: MyTextStyle.customStyle(fontWeight: FontWeight.w500,color: primary3Color,fontSize: 14,),)
                    ,CommonWidgets.gradientButton(onPressed: (){

                    },
                    text: 'Set',wantContentSizeButton: true,height: 40.px,width: 95.px)
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
