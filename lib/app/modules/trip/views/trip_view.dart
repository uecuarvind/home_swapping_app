import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:home_swipping/app/data/constants/image_constants.dart';
import 'package:home_swipping/app/data/constants/string_constants.dart';
import 'package:home_swipping/common/MyTextStyle.dart';
import 'package:home_swipping/common/common_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../common/colors.dart';
import '../../../../common/dateRangeFormate.dart';
import '../../../data/api_constants/api_url_constants.dart';
import '../../../data/api_models/get_booking_model.dart';
import '../../../data/constants/icons_constant.dart';
import '../controllers/trip_controller.dart';

class TripView extends GetView<TripController> {
  const TripView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      // appBar: CommonWidgets.appBarView(
      //   color: blackColor,
      //
      // ),
      body:Obx((){
        controller.count.value;
        return  SafeArea(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 15.px),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringConstants.trips,
                  style: MyTextStyle.customStyle(fontFamily: 'Lora',
                  fontWeight: FontWeight.bold,fontSize: 24,color: primary3Color),
                ),
                Text(
                  'Upcoming Reservation',
                  style: MyTextStyle.customStyle(fontFamily: 'Lora',
                      fontWeight: FontWeight.normal,fontSize: 18,color: primary3Color),
                ),
                Expanded(child: showBookingList())
              ],
            ),
          ),
        );
      })
    );
  }

  Widget showBookingList(){
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: controller.bookedList.length,
        itemBuilder: (context,index){
          BookingRequests item=controller.bookedList[index];
          return GestureDetector(
            onTap: (){
              controller.clickOnBookedUser(index);
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 410.px,
              margin: EdgeInsets.all(5.px),
              padding: EdgeInsets.all(3.px),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.px),
                  color: primary3Color
              ),
              child: Stack(
                children: [
                  CommonWidgets.appImagesView(
                      imagePath: ImageConstants.imgTrip,
                    height: 410.px,
                    width: MediaQuery.of(context).size.width,
                    borderRadius: 15.px
                  ),

                  Positioned(
                    top: 140.px,left: 10.px,
                    child:  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.px,vertical: 6.px),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.px),
                        color: Colors.black.withOpacity(0.2)
                    ),
                    child: Row(
                      children: [
                        CommonWidgets.appImagesView(
                            imagePath: IconConstants.icCalender,
                            color: primary3Color,
                            height: 25.px,width: 25.px),
                        SizedBox(width: 5.px,),
                        Text(item.startDate!=null?DateRangeFormat.formatDateRange(item.startDate.toString(), item.endDate.toString()):'',
                          style: MyTextStyle.customStyle(fontFamily: 'Lora',fontWeight: FontWeight.bold,fontSize: 12,color: primary3Color),)


                      ],
                    ),
                  ),),
                  Positioned(
                    top: 10.px,left: 10.px,right: 10.px,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonWidgets.appImagesView(
                            imagePath: ImageConstants.imgTripHost,
                          height: 35.px,width: 90.px
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15.px,vertical: 8.px),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.px),
                              color: Colors.black.withOpacity(0.4)
                          ),
                          child: Text('In ${DateRangeFormat.dateRangeCount(item.startDate.toString(), item.endDate.toString())} days',style: MyTextStyle.titleStyle12bw,),
                        ),
                        // CommonWidgets.appImagesView(
                        //     imagePath: IconConstants.icSwap,
                        //     height: 25.px,
                        //     width: 25.px
                        // ),

                      ],
                    ),

                  ),
                  Positioned(
                    bottom: 20.px,left: 10.px,right: 10.px,
                    child: Container(
                      height: 200.px,
                      padding: EdgeInsets.all(15.px),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.px),
                        image: const DecorationImage(
                            image: AssetImage(ImageConstants.imgTripBackground,
                        ))
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CommonWidgets.imageView(
                                  image:item.user?.profileimage??'',
                                  height: 32.px,width: 32.px,
                                  borderRadius: BorderRadius.circular(16.px),
                                  defaultNetworkImage: ApiUrlConstants.defaultUserProfile
                              ),
                              SizedBox(width: 10.px,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(item.user?.name??'',style: MyTextStyle.customStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Lora',color: primary3Color),
                                      overflow: TextOverflow.ellipsis,),
                                    Text('Entire dome hosted by katrin',style: MyTextStyle.customStyle(fontSize: 12,fontWeight: FontWeight.normal,fontFamily: 'Lora',color: primary3Color),
                                      overflow: TextOverflow.ellipsis,),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Divider(thickness: 1.px,color: primary3Color.withOpacity(0.20),),
                          Padding(
                            padding:  EdgeInsets.symmetric(vertical: 5.px),
                            child: Row(
                              children: [
                                Icon(Icons.location_on,size: 25.px,color: primary3Color,),
                                Expanded(
                                  child: Text(item.house?.city??'',style: MyTextStyle.customStyle(fontSize: 12,fontWeight: FontWeight.normal,fontFamily: 'Lora',color: primary3Color),
                                    overflow: TextOverflow.ellipsis,),
                                ),
                              ],
                            ),
                          ),
                          Divider(thickness: 1.px,color: primary3Color.withOpacity(0.10),),
                          Text(item.personalNote??'',style: MyTextStyle.titleStyle12w,overflow: TextOverflow.ellipsis,
                            maxLines: 1,),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          );
        }
    );
  }
}
