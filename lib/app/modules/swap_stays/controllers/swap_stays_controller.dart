
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:home_swipping/app/data/constants/image_constants.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class SwapStaysController extends GetxController {


  Map<String, String?> parameter=Get.parameters;
  //TODO: Implement SwapStaysController
  final tabIndex=0.obs;
  final name = 'James'.obs;
  final isClicked=false.obs;
  final noOfBedrooms=1.obs;
   var noOfWorkStations=0.obs;
  final isPetFriendly = false.obs;
  final showEssentials = false.obs;
  final isKidFriendly = false.obs;
  final isToddlerFriendly = false.obs;
  //final isLocationSelected = false.obs;
  final calendarIndex = 0.obs;
  final selectedLocation = 'anywhere'.obs;

  final kToday = DateTime(2025);
  final kFirstDay = DateTime(2023);
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;
  DateTime? rangeStart;
  DateTime? rangeEnd;
  DateTime? startRangDate ;//= DateTime.now();
  DateTime? endRangeDate ;//= DateTime.now();
  List<DateTime?> datesList = [];

   final count = 0.obs;
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
  void changeShowEssentials(){
    showEssentials.value=!showEssentials.value;
  }
  changeTabIndex(int index){

    tabIndex.value=index;
  }

  selectTheEssentials(BuildContext context) {
    showModalBottomSheet(
        context: context,
        //isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft:Radius.circular(24.px),topRight:Radius.circular(24.px))
        ),
        clipBehavior: Clip.hardEdge,
        constraints: BoxConstraints(maxHeight: 480.px),
        builder: (BuildContext context,){
          return StatefulBuilder(
              builder: (BuildContext context,StateSetter setState) {
                return Container(
                  padding: EdgeInsets.all(16.px),
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    image:  DecorationImage(image: AssetImage(ImageConstants.imgBackgroundOfSwap),fit: BoxFit.cover),
                  ),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(width: 30.px,),
                                Text(StringConstants.theEssential,
                                  style: MyTextStyle.customStyle(fontSize:16.px,fontFamily: 'Lora' ,color: primary3Color,fontWeight:FontWeight.w800),
                                ),
                              ],
                            ),
                            CommonWidgets.appImagesView(
                                imagePath: IconConstants.icUpward,height:30.px,width: 30.px
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.px,),
                      const Divider(color: Colors.white10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(StringConstants.bedrooms,
                            style: MyTextStyle.customStyle(fontSize:16.px,fontFamily: 'Lora' ,color: primary3Color,fontWeight:FontWeight.w800),
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState((){
                                    if(noOfBedrooms>1) {
                                      noOfBedrooms.value--;
                                    }
                                  });
                                },
                                child: Stack(
                                  children: [
                                    CommonWidgets.appImagesView(
                                        imagePath: IconConstants.icCircle,height:30.px,width: 30.px
                                    ),
                                    Positioned(
                                      top: -5.px,left: 2.px,
                                      child: Icon(Icons.minimize_outlined,color: primary3Color,size: 25.px,),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(width: 10.px,),
                              Text('$noOfBedrooms',style: MyTextStyle.titleStyle16bw,),
                              SizedBox(width: 10.px,),
                              InkWell(
                                onTap: () {
                                  setState((){
                                    if(noOfBedrooms>=1) {
                                      noOfBedrooms.value++;
                                    }
                                  });
                                },
                                child: Stack(
                                  children: [
                                    CommonWidgets.appImagesView(
                                        imagePath: IconConstants.icCircle,height:30.px,width: 30.px
                                    ),
                                    Positioned(
                                      top: 3.px,left: 3.px,
                                      child: Icon(Icons.add,color: primary3Color,size: 25.px,),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const Divider(color: Colors.white10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(StringConstants.workstaions,
                            style: MyTextStyle.customStyle(fontSize:16.px,fontFamily: 'Lora' ,color: primary3Color,fontWeight:FontWeight.w800),
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState((){
                                    if(noOfWorkStations>0) {
                                      noOfWorkStations.value--;
                                    }
                                  });
                                },
                                child: Stack(
                                  children: [
                                    CommonWidgets.appImagesView(
                                        imagePath: IconConstants.icCircle,height:30.px,width: 30.px
                                    ),
                                    Positioned(
                                      top: -5.px,left: 2.px,
                                      child: Icon(Icons.minimize_outlined,color: primary3Color,size: 25.px,),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(width: 10.px,),
                              Text('$noOfWorkStations',style: MyTextStyle.titleStyle16bw,),
                              SizedBox(width: 10.px,),
                              InkWell(
                                onTap: () {
                                  setState((){
                                    if(noOfWorkStations>=0){
                                      noOfWorkStations++;
                                    }
                                  });
                                },
                                child: Stack(
                                  children: [
                                    CommonWidgets.appImagesView(
                                        imagePath: IconConstants.icCircle,height:30.px,width: 30.px
                                    ),
                                    Positioned(
                                      top: 3.px,left: 3.px,
                                      child: Icon(Icons.add,color: primary3Color,size: 25.px,),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const Divider(color: Colors.white10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${StringConstants.petFriendly}?',
                            style: MyTextStyle.customStyle(fontSize:16.px,fontFamily: 'Lora' ,color: primary3Color,fontWeight:FontWeight.w800),
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState((){
                                    isPetFriendly.value=(!isPetFriendly.value);
                                  });
                                },
                                child: isPetFriendly.value?Stack(
                                  children: [
                                    CommonWidgets.appImagesView(
                                        imagePath: IconConstants.icOnOff,width:52.px,height: 32.px
                                    ),
                                    Positioned(
                                      right: 0.px,
                                      child: Stack(
                                        children: [
                                          CommonWidgets.appImagesView(
                                              imagePath: IconConstants.icOffCircle,height:32.px,width: 32.px
                                          ),
                                          Positioned(
                                            left: 5.px,top: 3.px,
                                            child: CommonWidgets.appImagesView(
                                                imagePath: IconConstants.icPetGolden,height:24.px,width: 24.px
                                            ),
                                          )
                                        ],
                                      )
                                    ),
                                  ],
                                ):
                                CommonWidgets.appImagesView(
                                    imagePath: IconConstants.icOff,width:52.px,height: 32.px
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const Divider(color: Colors.white10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(StringConstants.kidFriendly,
                            style: MyTextStyle.customStyle(fontSize:16.px,fontFamily: 'Lora' ,color: primary3Color,fontWeight:FontWeight.w800),
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState((){
                                    isKidFriendly.value=(!isKidFriendly.value);
                                  });
                                },
                                child:
                                isKidFriendly.value?Stack(
                                  children: [
                                    CommonWidgets.appImagesView(
                                        imagePath: IconConstants.icOnOff,width:52.px,height: 32.px
                                    ),
                                    Positioned(
                                      right: 0.px,
                                      child: CommonWidgets.appImagesView(
                                          imagePath: IconConstants.icOffCircle,height:32.px,width: 32.px
                                      ),
                                    ) ,
                                  ],
                                ):
                                CommonWidgets.appImagesView(
                                    imagePath: IconConstants.icOff,width:52.px,height: 32.px
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const Divider(color: Colors.white10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(StringConstants.toddlerFriendly,
                            style: MyTextStyle.customStyle(fontSize:16.px,fontFamily: 'Lora' ,color: primary3Color,fontWeight:FontWeight.w800),
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState((){
                                    isToddlerFriendly.value=(!isToddlerFriendly.value);
                                  });
                                },
                                child: isToddlerFriendly.value ? Stack(
                                  children: [
                                    CommonWidgets.appImagesView(
                                        imagePath: IconConstants.icOnOff,width:52.px,height: 32.px
                                    ),
                                    Positioned(
                                      right: 0.px,
                                      child: CommonWidgets.appImagesView(
                                          imagePath: IconConstants.icOffCircle,height:32.px,width: 32.px
                                      ),
                                    )
                                  ],
                                ):
                                CommonWidgets.appImagesView(
                                    imagePath: IconConstants.icOff,width:52.px,height: 32.px
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
          );
        },
      );
    }


  showDatePickerBottomSheet(BuildContext context){
    showModalBottomSheet(
      backgroundColor:  Colors.grey.withOpacity(0.5),
        clipBehavior: Clip.hardEdge,
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft:Radius.circular(24.px),topRight:Radius.circular(24.px))
        ),
        isScrollControlled: true,
        constraints: BoxConstraints(maxHeight: 600.px),
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context,StateSetter setState){
                return Container(
                  height: 580,
                  decoration:  BoxDecoration(
                      image: const DecorationImage(
                        image:AssetImage(ImageConstants.imgBlurFull),
                        fit: BoxFit.cover,
                      ),
                    color:  Colors.grey.withOpacity(0.5),
                    backgroundBlendMode: BlendMode.darken
                  ),
                  padding: EdgeInsets.all(15.px),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Row(
                        children: [
                          Icon(Icons.calendar_month_sharp,color: textGrey,size: 24.px,),
                          SizedBox(width: 10.px,),
                          Text(StringConstants.when,
                            style: MyTextStyle.customStyle(color: primary3Color,fontFamily: 'Lora',fontSize:32.px,fontWeight: FontWeight.w900 ),
                          )
                        ],
                      ),
                      SizedBox(height: 10.px,),
                      // TableCalendar(
                      //   headerStyle: HeaderStyle(
                      //     titleTextStyle: MyTextStyle.customStyle(fontSize: 20.px,fontWeight: FontWeight.w700,color: primary3Color,fontFamily: 'Lora'),
                      //     formatButtonVisible: false,
                      //     rightChevronIcon:Icon(Icons.arrow_forward_ios_outlined,color: primary3Color,size: 30.px,),
                      //     leftChevronIcon:Icon(Icons.arrow_back_ios_new_outlined,color: primary3Color,size: 30.px,),
                      //     formatButtonTextStyle: MyTextStyle.titleStyle14bw,
                      //   ),
                      //   weekNumbersVisible: false,
                      //   calendarStyle: CalendarStyle(
                      //     rangeHighlightColor: Colors.white38,
                      //     rangeEndDecoration: BoxDecoration(
                      //         color: primary3Color,
                      //         borderRadius: BorderRadius.circular(64),
                      //         border: Border.all(
                      //         color: const Color(0xffA4D0FF)
                      //       ),
                      //     ),
                      //     rangeEndTextStyle:MyTextStyle.customStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.w700,fontSize: 14.px),
                      //     rangeStartTextStyle:MyTextStyle.customStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.w700,fontSize: 14.px),
                      //     withinRangeTextStyle: MyTextStyle.customStyle(color: primary3Color,fontWeight: FontWeight.w700,fontSize: 14.px),
                      //     outsideTextStyle:MyTextStyle.customStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 14.px),
                      //     rangeStartDecoration: BoxDecoration(
                      //         color: primary3Color,
                      //         border: Border.all(
                      //             color: const Color(0xffA4D0FF)
                      //         ),
                      //         borderRadius: BorderRadius.circular(50)
                      //     ),
                      //
                      //     selectedTextStyle: const TextStyle(color: Colors.green),
                      //     //defaultTextStyle: MyTextStyle.titleStyle14bw,
                      //     //disabledTextStyle: MyTextStyle.titleStyle14bw,
                      //
                      //   ),
                      //   daysOfWeekStyle: DaysOfWeekStyle(weekdayStyle: MyTextStyle.titleStyle14bw,weekendStyle: MyTextStyle.titleStyle14bw),
                      //   firstDay: kFirstDay,
                      //   lastDay: kToday,
                      //   focusedDay:focusedDay,
                      //   // selectedDayPredicate: (day) =>
                      //   //     isSameDay(controller.selectedDay, day),
                      //   rangeStartDay:rangeStart,
                      //   rangeEndDay: rangeEnd,
                      //   calendarFormat: CalendarFormat.month,
                      //   rangeSelectionMode: RangeSelectionMode.enforced,
                      //   onDaySelected: (selectedDay, focusedDay) {
                      //     // controller.clickOnCalendar();
                      //   },
                      //   onRangeSelected: (start, end, focusedDay) {
                      //     setState((){
                      //       rangeStart=start;
                      //       rangeEnd=end;
                      //       focusedDay=start!;
                      //       increment();
                      //     });
                      //
                      //
                      //     // controller.selectedDay = null;
                      //     // controller.focusedDay = focusedDay;
                      //
                      //     // controller.rangeSelectionMode = RangeSelectionMode.toggledOn;
                      //   },
                      //
                      //   calendarBuilders: CalendarBuilders(
                      //     defaultBuilder: (context, day, focusedDay) {
                      //       return Container(
                      //         margin: EdgeInsets.only(
                      //             left: 2.px,
                      //             right: 2.px,
                      //             top: 4.px,
                      //             bottom: 4.px),
                      //         alignment: Alignment.center,
                      //         decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.all(
                      //             Radius.circular(25.px),
                      //           ),
                      //         ),
                      //         child: Text(
                      //           '${day.day}',
                      //           style:MyTextStyle.titleStyle14bw,
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // ),
                      Expanded(
                        child: ScrollableCleanCalendar(
                          spaceBetweenCalendars: 5.px,
                          spaceBetweenMonthAndCalendar: 2.px,
                          calendarController: CleanCalendarController(
                            minDate:DateTime.now(),
                            //DateTime.now().subtract(const Duration(days: 60)),
                            initialFocusDate: DateTime.now(),
                            initialDateSelected: startRangDate,
                            endDateSelected: endRangeDate,
                            maxDate:
                            DateTime.now().add(const Duration(days: 365)),
                            onAfterMaxDateTapped: (date) {
                              print('press after...');
                            },
                            onPreviousMinDateTapped: (date) {
                              print('press previous...');
                            },
                            onRangeSelected: (firstDate, secondDate) {
                              setState(() {
                                startRangDate = firstDate;
                                endRangeDate = secondDate;
                                print(
                                    'Range Selected: $startRangDate to $endRangeDate');
                              });
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
                            bool selectedStartDay = startRangDate != null &&
                                day.day.isAtSameMomentAs(startRangDate!);
                            bool selectedEndDay = endRangeDate != null &&
                                day.day.isAtSameMomentAs(endRangeDate!);

                            bool isSelected = (startRangDate != null &&
                                endRangeDate != null &&
                                (day.day.isAfter(startRangDate!) &&
                                    day.day.isBefore(endRangeDate!
                                        .add(const Duration(days: 1)))) ||
                                selectedStartDay ||
                                selectedEndDay);

                            bool isSingleDaySelected = selectedStartDay &&
                                (endRangeDate == null ||
                                    selectedStartDay && selectedEndDay);

                            return Container(
                              height: 25,
                              width: 25,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: isSelected
                                      ? Colors.white.withOpacity(0.4)
                                      : Colors.transparent,
                                  borderRadius: isSingleDaySelected
                                      ? BorderRadius.circular(25)
                                      : (selectedStartDay)
                                      ? const BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    bottomLeft: Radius.circular(25),
                                  )
                                      : selectedEndDay
                                      ? const BorderRadius.only(
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
                                        ? Colors.white
                                        : Colors.transparent),
                                clipBehavior: Clip.hardEdge,
                                child: Text(
                                  day.day.day.toString(),
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: (selectedStartDay || selectedEndDay)
                                          ? Colors.lightBlueAccent
                                          : Colors.white),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 14.px,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                calendarIndex.value=0;
                              },);
                            },
                            child: Container(
                              height:40.px,
                              width: 130.px,
                              alignment:Alignment.center,
                              decoration:BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.px),
                                  color: calendarIndex.value==0?primary3Color:Colors.transparent,
                                  border: Border.all(color: Colors.grey,width: 1)
                              ),
                              child: Text(StringConstants.exactDates,
                                style: MyTextStyle.customStyle(fontFamily: 'Lora',
                                    color: calendarIndex.value==0?const Color(0xFF07001E):primary3Color,
                                    fontSize: 16.px,fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                calendarIndex.value=1;
                              },);
                            },
                            child: Container(
                              height: 40.px,width: 80.px,
                              decoration: BoxDecoration(
                                  color:calendarIndex.value==1?primary3Color:Colors.transparent ,
                                  borderRadius: BorderRadius.circular(100.px),
                                border: Border.all(color: Colors.grey,width: 1)
                              ),
                              child: Center(
                                child: Text(StringConstants.plusOneDay,
                                  style: MyTextStyle.customStyle(fontSize: 16.px,fontFamily: 'Lora',
                                      color:calendarIndex.value==1?const Color(0xFF07001E):primary3Color,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                calendarIndex.value=2;
                              },);
                            },
                            child: Container(
                              height: 40.px,width: 80.px,
                              decoration: BoxDecoration(
                                color:calendarIndex.value==2?primary3Color:Colors.transparent,
                                borderRadius: BorderRadius.circular(100.px),
                                  border: Border.all(color: Colors.grey,width: 1)
                              ),
                              child: Center(
                                child: Text(StringConstants.plusTwoDay,
                                  style: MyTextStyle.customStyle(fontSize: 16.px,fontFamily: 'Lora',
                                    color:calendarIndex.value==2?const Color(0xFF07001E):primary3Color,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      //Spacer(),
                      SizedBox(height: 50.px,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              startRangDate = DateTime.now();
                              endRangeDate = DateTime.now();
                              Get.back();
                            },
                            child: Text(StringConstants.reset,
                              style: MyTextStyle.customStyle(fontFamily: 'Lora',color: primary3Color,fontSize: 18.px,fontWeight: FontWeight.w700),
                            ),
                          ),
                          CommonWidgets.gradientButton(
                            wantContentSizeButton: true,
                              height: 50.px,
                              width: 140.px,
                              onPressed: (){
                                Get.back();
                                print('Selected Dates:: ${DateFormat.MMMd().format(startRangDate!)}-${DateFormat.MMMd().format(endRangeDate!)}');
                                increment();
                              },
                              text: StringConstants.next
                          ),
                        ],
                      ),
                      SizedBox(height: 20.px,)
                    ],
                  ),
                );
              }
          );
        }
    );
  }

  // void openBottomSheet(BuildContext context) {
  //   showModalBottomSheet<void>(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return StatefulBuilder(
  //         builder: (BuildContext context, StateSetter setState) {
  //           return SizedBox(
  //             height: 400,
  //             child: ScrollableCleanCalendar(
  //               calendarController: CleanCalendarController(
  //                 minDate: DateTime.now(),
  //                 initialDateSelected: DateTime.now(),
  //                 maxDate: DateTime.now().add(const Duration(days: 365)),
  //                 onAfterMaxDateTapped: (date) {
  //                   print('press after...');
  //                   setState(() {
  //                     startRangDate = date;
  //                   });
  //                 },
  //                 onPreviousMinDateTapped: (date) {
  //                   print('press previous...');
  //                   setState(() {
  //                     endRangeDate = date;
  //                   });
  //                 },
  //                 onRangeSelected: (firstDate, secondDate) {
  //                   setState(() {
  //                     startRangDate = firstDate;
  //                     endRangeDate = secondDate;
  //                     print('Range Selected: $startRangDate to $endRangeDate');
  //                   });
  //                 },
  //                 onDayTapped: (date) {
  //                   print('Day Tapped: $date');
  //                 },
  //                 weekdayStart: DateTime.monday,
  //               ),
  //               layout: Layout.BEAUTY,
  //               calendarCrossAxisSpacing: 0,
  //               daySelectedBackgroundColor: Colors.grey.withOpacity(0.5),
  //               daySelectedBackgroundColorBetween: Colors.blue.withOpacity(0.5),
  //               dayBackgroundColor: Colors.purple,
  //               dayDisableBackgroundColor: Colors.teal,
  //               dayDisableColor: Colors.black54,
  //               dayTextStyle:
  //               const TextStyle(fontSize: 14, color: Colors.black),
  //               monthTextStyle:
  //               const TextStyle(fontSize: 14, color: Colors.red),
  //               dayBuilder: (context, day) {
  //                 bool isSelected = (startRangDate != null &&
  //                     endRangeDate != null &&
  //                     day.day.isAfter(startRangDate) &&
  //                     day.day.isBefore(endRangeDate!) ||
  //                     day.day.isAtSameMomentAs(startRangDate) ||
  //                     day.day.isAtSameMomentAs(endRangeDate!));
  //
  //                 return Container(
  //                   decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(25),
  //                     color:(day.day.isAtSameMomentAs(startRangDate)|| day.day.isAtSameMomentAs(endRangeDate!)) ? Colors.deepPurple : Colors.transparent,
  //                   ),
  //                   child: Center(
  //                     child: Text(
  //                       day.day.day.toString(),
  //                       style:
  //                       const TextStyle(fontSize: 12, color: Colors.black),
  //                     ),
  //                   ),
  //                 );
  //               },
  //             ),
  //           );
  //         },
  //       );
  //     },
  //   );
  // }

///*******
  onTapSelectLocation() async{
    Map<String,String> data={
      'location':selectedLocation.value
    };
      dynamic result=await Get.toNamed(Routes.SELECT_LOCATION,parameters: data);
      if(result!=null){
        selectedLocation.value=result;
        increment();
      }
  }

  onTapExplore()async{
    await HapticFeedback.heavyImpact();
    await Haptics.vibrate(HapticsType.heavy);
    Get.toNamed(Routes.FINDING_HOMES);
  }

}
