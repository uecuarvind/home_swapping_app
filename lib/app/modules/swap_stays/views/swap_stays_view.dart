import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:home_swipping/app/data/constants/icons_constant.dart';
import 'package:home_swipping/app/data/constants/image_constants.dart';
import 'package:home_swipping/app/data/constants/string_constants.dart';
import 'package:home_swipping/common/MyTextStyle.dart';
import 'package:home_swipping/common/colors.dart';
import 'package:home_swipping/common/common_widgets.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/swap_stays_controller.dart';

class SwapStaysView extends GetView<SwapStaysController> {
  const SwapStaysView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image:AssetImage(ImageConstants.imgBackgroundOfSwap),fit: BoxFit.cover
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40.px,),
                Center(
                  child: Text(StringConstants.swapAndStay,
                    style: MyTextStyle.customStyle(color: primary3Color,fontSize: 20.px,fontFamily: 'Coiny'),
                  ),
                ),
                SizedBox(height: 20.px,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: (){
                        controller.changeTabIndex(0);
                      },
                      child: Container(
                        height: 48.px,width: 150.px,
                        decoration: BoxDecoration(
                            color:controller.tabIndex.value==0?primary3Color:Colors.white10 ,
                            borderRadius: BorderRadius.circular(100.px),
                            border: Border.all(
                                color: controller.tabIndex.value==0?Color(0xffCFBDA5):Colors.white10
                            )
                        ),
                        child: Center(
                          child: Text(StringConstants.swap,
                            style: MyTextStyle.customStyle(fontSize: 18.px,fontFamily: 'Lora',
                                color: controller.tabIndex.value==0?Color(0xffCFBDA5):primary3Color
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
                        height: 48.px,width: 150.px,
                        decoration: BoxDecoration(
                            color:controller.tabIndex.value==1?primary3Color:Colors.white10 ,
                            borderRadius: BorderRadius.circular(100.px),
                            border: Border.all(
                                color: controller.tabIndex.value==1?Color(0xffCFBDA5):Colors.white10
                            )
                        ),
                        child: Center(
                          child: Text(StringConstants.Stays,
                            style: MyTextStyle.customStyle(fontSize: 18.px,fontFamily: 'Lora',
                                color: controller.tabIndex.value==1?Color(0xffCFBDA5):primary3Color
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.px,),
                Container(
                  padding: EdgeInsets.all(10.px),
                  margin: EdgeInsets.only(left: 20.px,right: 20.px), height: 75.px,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.px),
                    color: Colors.white10
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          controller.onTapSelectLocation();
                        },
                        child: Row(
                          children: [
                            CommonWidgets.appImagesView(
                                imagePath: IconConstants.icEarth,height: 24.px,width: 24.px
                            ),
                            SizedBox(width: 10.px,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${StringConstants.whereareWeGoing} ${controller.name.value}?',
                                  style: MyTextStyle.customStyle(fontSize:14.px,fontFamily: 'Lora' ,color: primary3Color),
                                ),
                                Text(
                                  controller.selectedLocation.value=='anywhere'? StringConstants.anywhere :controller.selectedLocation.value,
                                  style: MyTextStyle.customStyle(fontSize:16.px,fontFamily: 'Lora' ,color: primary3Color,fontWeight:FontWeight.w800),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      CommonWidgets.appImagesView(
                          imagePath: IconConstants.icSearchRounded,height:40.px,width: 40.px
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20.px,),
                Container(
                  padding: EdgeInsets.all(10.px),
                  margin: EdgeInsets.only(left: 20.px,right: 20.px), height: 75.px,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.px),
                      color: Colors.white10
                  ),
                  child: InkWell(
                    onTap: () {
                      controller.showDatePickerBottomSheet(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.calendar_month,size: 25.px,color: primary3Color,),
                            SizedBox(width: 10.px,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('When',
                                  style: MyTextStyle.customStyle(fontSize:14.px,fontFamily: 'Lora' ,color: primary3Color),
                                ),
                                Text(
                                  (controller.startRangDate==null && controller.endRangeDate==null) ? StringConstants.anytime :
                                      '${DateFormat.MMMd().format(controller.startRangDate!)}-${DateFormat.MMMd().format(controller.endRangeDate!)}',
                                  style: MyTextStyle.customStyle(fontSize:16.px,fontFamily: 'Lora' ,color: primary3Color,fontWeight:FontWeight.w800),
                                )
                              ],
                            ),
                          ],
                        ),
                        CommonWidgets.appImagesView(
                            imagePath: IconConstants.icForward,height:40.px,width: 40.px
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.px,),
                InkWell(
                  onTap: () {
                    controller.selectTheEssentials(context);
                  },
                  child: Container(
                    padding: EdgeInsets.all(10.px),
                    margin: EdgeInsets.only(left: 20.px,right: 20.px), height: 60.px,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.px),
                        color: Colors.white10
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 20.px,),
                            Text(StringConstants.theEssential,
                              style: MyTextStyle.customStyle(fontSize:16.px,fontFamily: 'Lora' ,color: primary3Color,fontWeight:FontWeight.w800),
                            ),
                          ],
                        ),
                        (controller.noOfWorkStations.value==1 || controller.noOfBedrooms.value>1 || controller.isPetFriendly.value ||
                            controller.isKidFriendly.value || controller.isToddlerFriendly.value) ?
                        Stack(
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
                        )
                        :CommonWidgets.appImagesView(
                          imagePath: IconConstants.icDownword,height:40.px,width: 40.px
                      )
                      ],
                    ),
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    controller.onTapExplore();
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 15.px,right: 15.px,bottom: 15.px),
                    height: 50.px,width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.px),
                        color: primary3Color
                    ),
                    child: Center(
                      child: Text(StringConstants.explore,
                        style: MyTextStyle.customStyle(color: labelColor,fontSize: 16.px,fontFamily: 'Lora'),),
                    ),
                  ),
                ),
                SizedBox(height: 20.px,),
              ],
            ),
          )
      );
    });
  }
}
