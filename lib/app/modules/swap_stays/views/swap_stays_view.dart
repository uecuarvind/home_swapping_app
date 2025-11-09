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
        backgroundColor: blackColor,
          body: Container(
            height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImageConstants.imgExploreBackground),fit: BoxFit.cover
              ),
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Center(
                child: Text(StringConstants.explore,
                  style: MyTextStyle.customStyle(color: primary3Color,fontWeight: FontWeight.w700,fontSize: 20.px,fontFamily: 'Lora'),
                ),
              ),
                        
                  SizedBox(height: 20.px,),
                  Container(
                    height: 40.px,
                    margin: EdgeInsets.symmetric(horizontal: 20.px),
                    decoration: BoxDecoration(
                      color: primary3Color.withOpacity(0.33),
                      borderRadius: BorderRadius.circular(10.px)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: (){
                              controller.changeTabIndex(1);
                            },
                            child: Container(
                              height: 40.px,
                              decoration: BoxDecoration(
                                  color:controller.tabIndex.value==1?primary3Color:null,
                                  borderRadius: BorderRadius.circular(10.px),

                              ),
                              child: Center(
                                child: Text(StringConstants.swap,
                                  style: MyTextStyle.customStyle(fontSize: 12.px,fontFamily: 'Lora',
                                      color: controller.tabIndex.value==1?const Color(0xff5F5F5F):primary3Color,
                                    fontWeight: FontWeight.w700
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: (){
                              controller.changeTabIndex(2);
                            },
                            child: Container(
                              height: 48.px,
                              decoration: BoxDecoration(
                                  color:controller.tabIndex.value==2?primary3Color:null,
                                  borderRadius: BorderRadius.circular(10.px),
                              ),
                              child: Center(
                                child:  Text(StringConstants.Stays,
                                  style: MyTextStyle.customStyle(fontSize: 12.px,fontFamily: 'Lora',
                                      color: controller.tabIndex.value==2?const Color(0xff5F5F5F):primary3Color,
                                      fontWeight: FontWeight.w700
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: (){
                              controller.changeTabIndex(0);
                            },
                            child: Container(
                              height: 48.px,
                              decoration: BoxDecoration(
                                  color:controller.tabIndex.value==0?primary3Color:null,
                                  borderRadius: BorderRadius.circular(10.px),

                              ),
                              child: Center(
                                child:  Text(StringConstants.any,
                                  style: MyTextStyle.customStyle(fontSize: 12.px,fontFamily: 'Lora',
                                      color: controller.tabIndex.value==0?const Color(0xff5F5F5F):primary3Color,
                                      fontWeight: FontWeight.w700
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.px,),
                  Container(
                    padding: EdgeInsets.all(10.px),
                    margin: EdgeInsets.only(left: 20.px,right: 20.px), height: 75.px,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.px),
                      color: primary3Color.withOpacity(0.10),
                      image: const DecorationImage(
                        image:AssetImage(ImageConstants.imgBlurBackGround),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
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
                        InkWell(
                          onTap: () {
                            controller.onTapSelectLocation();
                          },
                          child: CommonWidgets.appImagesView(
                              imagePath: IconConstants.icSearchRounded,height:40.px,width: 40.px
                          ),
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
                        color: primary3Color.withOpacity(0.20),
                      image: const DecorationImage(
                        image:AssetImage(ImageConstants.imgBlurBackGround),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                          //  Icon(Icons.calendar_month,size: 25.px,color: primary3Color,),
                            CommonWidgets.appImagesView(
                                imagePath: IconConstants.icCalender,height: 24.px,width: 24.px,color: primary3Color.withOpacity(0.5)
                            ),
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
                        InkWell(
                          onTap: () {
                            controller.showDatePickerBottomSheet(context);
                          },
                          child: CommonWidgets.appImagesView(
                              imagePath: IconConstants.icForward,height:40.px,width: 40.px
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20.px,),
                  InkWell(
                    onTap: () {
                     // controller.selectTheEssentials(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(10.px),
                      margin: EdgeInsets.only(left: 20.px,right: 20.px),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.px),
                          color: primary3Color.withOpacity(0.20),
                        image:  DecorationImage(
                          image:AssetImage(controller.showEssentials.value?ImageConstants.imgBlurFull:ImageConstants.imgBlurBackGround),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
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
                            //   (controller.noOfWorkStations.value==1 || controller.noOfBedrooms.value>1 || controller.isPetFriendly.value ||
                            //       controller.isKidFriendly.value || controller.isToddlerFriendly.value) ?
                            //   Stack(
                            //     children: [
                            //       CommonWidgets.appImagesView(
                            //           imagePath: IconConstants.icOnOff,width:52.px,height: 32.px
                            //       ),
                            //       Positioned(
                            //         right: 0.px,
                            //         child: CommonWidgets.appImagesView(
                            //             imagePath: IconConstants.icOffCircle,height:32.px,width: 32.px
                            //         ),
                            //       )
                            //     ],
                            //   )
                            //   :CommonWidgets.appImagesView(
                            //     imagePath: IconConstants.icDownword,height:40.px,width: 40.px
                            // ),
                              controller.showEssentials.value?
                              Padding(
                                padding:  EdgeInsets.only(right: 10.px),
                                child: GestureDetector(
                                  onTap: (){
                                    controller.changeShowEssentials();
                                  },
                                  child: Icon(Icons.keyboard_arrow_up,size: 30.px,color: primary3Color,),
                                ),
                              ):
                              GestureDetector(
                                onTap: (){
                                  controller.changeShowEssentials();
                                },
                                child: CommonWidgets.appImagesView(
                                    imagePath: IconConstants.icDownword,height:40.px,width: 40.px
                                ),
                              )
                            ],
                          ),
                          if(controller.showEssentials.value)
                            Container(
                              padding: EdgeInsets.all(16.px),
                              width: MediaQuery.of(context).size.width,
                              decoration: const BoxDecoration(
                                ),
                              child: Column(
                                children: [
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
                                              if(controller.noOfBedrooms>1) {
                                                controller.noOfBedrooms.value--;
                                                controller.increment();
                                              }
                                            },
                                            child: Stack(
                                              children: [
                                                CommonWidgets.appImagesView(
                                                    imagePath: IconConstants.icCircle,height:30.px,width: 30.px,color: primary3Color.withOpacity(0.2)
                                                ),
                                                Positioned(
                                                  top: -5.px,left: 2.px,
                                                  child: Icon(Icons.minimize_outlined,color: primary3Color,size: 25.px,),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: 10.px,),
                                          Text('${controller.noOfBedrooms}',style: MyTextStyle.titleStyle16bw,),
                                          SizedBox(width: 10.px,),
                                          InkWell(
                                            onTap: () {
                                              if(controller.noOfBedrooms>=1) {
                                                controller.noOfBedrooms.value++;
                                                controller.increment();
                                              }
                                            },
                                            child: Stack(
                                              children: [
                                                CommonWidgets.appImagesView(
                                                    imagePath: IconConstants.icCircle,height:30.px,width: 30.px,color: primary3Color.withOpacity(0.2)
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
                                              if(controller.noOfWorkStations>0) {
                                                controller.noOfWorkStations.value--;
                                                controller.increment();
                                              }
                                            },
                                            child: Stack(
                                              children: [
                                                CommonWidgets.appImagesView(
                                                    imagePath: IconConstants.icCircle,height:30.px,width: 30.px,color: primary3Color.withOpacity(0.2)
                                                ),
                                                Positioned(
                                                  top: -5.px,left: 2.px,
                                                  child: Icon(Icons.minimize_outlined,color: primary3Color,size: 25.px,),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: 10.px,),
                                          Text('${controller.noOfWorkStations}',style: MyTextStyle.titleStyle16bw,),
                                          SizedBox(width: 10.px,),
                                          InkWell(
                                            onTap: () {
                                              if(controller.noOfWorkStations>=0){
                                                controller.noOfWorkStations++;
                                                controller.increment();
                                              }
                                            },
                                            child: Stack(
                                              children: [
                                                CommonWidgets.appImagesView(
                                                    imagePath: IconConstants.icCircle,height:30.px,width: 30.px,color: primary3Color.withOpacity(0.2)
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
                                              controller.isPetFriendly.value=(!controller.isPetFriendly.value);
                                              controller.increment();
                                            },
                                            child: controller.isPetFriendly.value?CommonWidgets.appImagesView(
                                                imagePath: IconConstants.icPetOn,width:52.px,height: 32.px
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
                                              controller.isKidFriendly.value=(!controller.isKidFriendly.value);
                                            },
                                            child:
                                            SizedBox(
                                              height: 38,
                                              child: controller.isKidFriendly.value?CommonWidgets.appImagesView(
                                                  imagePath: IconConstants.icFriendOn,width:60.px,height: 38.px
                                              ):
                                              Padding(
                                                padding: EdgeInsets.symmetric(vertical: 3.px),
                                                child: CommonWidgets.appImagesView(
                                                    imagePath: IconConstants.icOff,width:52.px,height: 27.px
                                                ),
                                              ),
                                            )
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
                                              controller.isToddlerFriendly.value=(!controller.isToddlerFriendly.value);
                                            },
                                            child: SizedBox(
                                              height: 38,
                                              child: controller.isToddlerFriendly.value?CommonWidgets.appImagesView(
                                                  imagePath: IconConstants.icFriendOn,width:60.px,height: 38.px
                                              ):
                                              Padding(
                                                padding: EdgeInsets.symmetric(vertical: 3.px),
                                                child: CommonWidgets.appImagesView(
                                                    imagePath: IconConstants.icOff,width:52.px,height: 27.px
                                                ),
                                              ),
                                            )
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  Align(
                    child: CommonWidgets.gradientButton(
                        onPressed: (){
                          controller.onTapExplore();
                        },
                        text: StringConstants.explore
                    ),
                  ),
                  SizedBox(height: 30.px,),
                ],
              ),
            ),
          )
      );
    });
  }
}
