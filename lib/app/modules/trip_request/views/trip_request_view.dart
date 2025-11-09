import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:home_swipping/app/data/api_constants/api_key_constants.dart';
import 'package:home_swipping/app/data/api_constants/api_url_constants.dart';
import 'package:home_swipping/app/data/constants/icons_constant.dart';
import 'package:home_swipping/app/data/constants/image_constants.dart';
import 'package:home_swipping/common/common_widgets.dart';
import 'package:home_swipping/common/dateRangeFormate.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';

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
        return Stack(
          children: [
            CommonWidgets.imageView(
                image: controller.parameter[ApiKeyConstants.profileImage]??ApiUrlConstants.defaultUserProfile,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              defaultNetworkImage: ApiUrlConstants.defaultUserProfile
            ),
            Positioned(
              top: 0.px,right: 0.px,left: 0.px,bottom: 0.px,
              child: Container(
                color: Colors.black.withOpacity(0.8),
              )
            ),
            Positioned(
              top: 50.px,left: 20.px,
                child: GestureDetector(
                  onTap: (){
                    Get.back();
                  },
                  child: CommonWidgets.appImagesView(
                      imagePath: IconConstants.icBack,
                    width: 35.px,height: 35.px
                  ),
                )
            ),
            Positioned(
              bottom: 200.px,left: 20.px,right: 20.px,
                child: Column(
                  children: [
                    Container(
                      height: 46.px,
                      width: 100.px,
                      margin: EdgeInsets.symmetric(vertical: 15.px),
                      padding: EdgeInsets.only(left: 5.px,right: 15.px),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.px),
                        color: const Color(0xFF4D4F4E),
                        border: Border.all(color: Colors.grey.withOpacity(0.3))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CommonWidgets.appImagesView(
                              imagePath: IconConstants.icCharging,
                          height: 40.px,width: 40.px),
                          Text(controller.startRangDate!=null?DateRangeFormat.dateRangeCount(controller.startRangDate!.toString(), controller.endRangeDate!=null?controller.endRangeDate!.toString():controller.startRangDate!.toString()).toString():'',style:  MyTextStyle.customStyle(
                              fontFamily: "Lora",fontWeight: FontWeight.w600,fontSize: 18,color:primary3Color
                          ),),
                        ],
                      ),
                    ),
                    Container(
                      height: 520,
                      decoration:  BoxDecoration(
                          image: const DecorationImage(
                            image:AssetImage(ImageConstants.imgBackgroundRedGrey),
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

                              Expanded(
                                child: Text(StringConstants.tripRequest,
                                  style: MyTextStyle.customStyle(color: primary3Color,fontFamily: 'Lora',fontSize:30.px,fontWeight: FontWeight.bold ),
                                ),
                              ),
                              Padding(
                                padding:  EdgeInsets.only(top: 8.px),
                                child: CommonWidgets.appImagesView(imagePath: ImageConstants.imgTicket,
                                height: 21.px,width: 31.px),
                              ),
                              Text(' 18',
                                style: MyTextStyle.customStyle(color: primary3Color,fontFamily: 'Lora',fontSize:18.px,fontWeight: FontWeight.bold ),
                              ),

                            ],
                          ),

                          Expanded(
                            child: ScrollableCleanCalendar(
                              spaceBetweenCalendars: 2.px,
                              spaceBetweenMonthAndCalendar: 2.px,
                              calendarController: CleanCalendarController(
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
                                  print(
                                      'Range Selected: ${controller.startRangDate} to ${controller.endRangeDate}');
                                  controller.increment();
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
                                  fontSize: 20.px,color: primary3Color,fontWeight: FontWeight.bold,fontFamily: 'Lora'
                              ),
                              dayBuilder: (context, day) {
                                bool selectedStartDay = controller.startRangDate != null &&
                                    day.day.isAtSameMomentAs(controller.startRangDate!);
                                bool selectedEndDay = controller.endRangeDate != null &&
                                    day.day.isAtSameMomentAs(controller.endRangeDate!);

                                bool isSelected = (controller.startRangDate != null &&
                                    controller.endRangeDate != null &&
                                    (day.day.isAfter(controller.startRangDate!) &&
                                        day.day.isBefore(controller.endRangeDate!
                                            .add(const Duration(days: 1)))) ||
                                    selectedStartDay ||
                                    selectedEndDay);

                                bool isSingleDaySelected = selectedStartDay &&
                                    (controller.endRangeDate == null ||
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
                                              ? Colors.black
                                              : Colors.white),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 20.px,)
                        ],
                      ),
                    ),
                  ],
                ),
            ),
            Positioned(
              bottom: 0.px,
                child: Container(
                  height: 180.px,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 15.px,vertical: 15.px),
                  decoration: const BoxDecoration(
                      image:  DecorationImage(
                        image:AssetImage(ImageConstants.imgBlurFull),
                        fit: BoxFit.cover,
                      ),

                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 16.px,width: 16.px,
                            margin: EdgeInsets.only(right: 10.px),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.px),
                              color: primary3Color,
                              border: Border.all(color: const Color(0xFFA4D0FF),width: 3.px)
                            ),
                          ),
                          Text('Book Camila’s Home with Credits',
                          style: MyTextStyle.customStyle(fontWeight: FontWeight.bold,
                          color: primary3Color,fontSize: 18,fontFamily: 'Lora'),),
                          Padding(
                            padding:  EdgeInsets.only(left: 10.px,top: 8.px),
                            child: CommonWidgets.appImagesView(
                                imagePath: ImageConstants.imgTicket,
                              height: 21.px,width: 35.px
                            ),
                          )
                        ],
                      ),
                      Divider(thickness: 1.px,color: primary3Color),
                      SizedBox(height: 20.px,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          controller.startRangDate!=null?
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(DateRangeFormat.formatDateRange(controller.startRangDate!.toString(), controller.endRangeDate!=null?controller.endRangeDate!.toString():controller.startRangDate!.toString()),style:  MyTextStyle.customStyle(
                                  fontFamily: "Lora",fontWeight: FontWeight.w700,fontSize: 18,color:primary3Color
                              ),),
                              Row(
                                children: [
                                  Text(DateRangeFormat.dateRangeCount(controller.startRangDate!.toString(), controller.endRangeDate!=null?controller.endRangeDate!.toString():controller.startRangDate!.toString()).toString(),style:  MyTextStyle.customStyle(
                                      fontFamily: "Lora",fontWeight: FontWeight.w600,fontSize: 16,color:primary3Color
                                  ),),
                                     Text(' nights',style:  MyTextStyle.customStyle(
                                        fontFamily: "Lora",fontWeight: FontWeight.w600,fontSize: 16,color:primary3Color
                                    ),),
                                ],
                              ),
                            ],
                          ):const SizedBox(),
                          CommonWidgets.gradientButton(
                            width: 150.px,wantContentSizeButton: true,height: 48.px,
                              onPressed: (){
                              if(controller.startRangDate!=null){
                                controller.clickOnSend(context);
                              }else{
                                CommonWidgets.showSnackBar(message: 'Please select date first ...', context: context,status: false);
                              }
                              },
                            text: StringConstants.review
                          )
                        ],
                      )
                    ],
                  ),
                )
            )
          ],
        );
      })
    );
  }
}
