import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:home_swipping/app/data/api_constants/api_key_constants.dart';
import 'package:home_swipping/app/data/api_constants/api_url_constants.dart';
import 'package:home_swipping/app/data/api_models/get_booking_model.dart';
import 'package:home_swipping/app/data/constants/image_constants.dart';
import 'package:home_swipping/app/data/constants/string_constants.dart';
import 'package:home_swipping/common/MyTextStyle.dart';
import 'package:home_swipping/common/colors.dart';
import 'package:home_swipping/common/common_widgets.dart';
import 'package:home_swipping/common/dateRangeFormate.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../data/constants/icons_constant.dart';
import '../controllers/trips_controller.dart';

class TripsView extends GetView<TripsController> {
  const TripsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: Obx((){
        controller.count.value;
        return SafeArea(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.px,vertical: 5.px),
            child: controller.isLoading.value?
                CommonWidgets.commonShimmer(
                  shimmerWidget: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 30.px,
                            width: 150.px,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.px),
                              color:Colors.black87,
                            ),
                          )
                          ,
                          Row(
                            children: [
                              Container(
                                height: 30.px,
                                width: 30.px,
                                margin: EdgeInsets.symmetric(horizontal: 10.px),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.px),
                                  color:Colors.black87,
                                ),
                              ),
                              Container(
                                height: 30.px,
                                width: 30.px,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.px),
                                  color:Colors.black87,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Container(
                        height: 30.px,
                        width: 100.px,
                        margin: EdgeInsets.symmetric(vertical: 10.px),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.px),
                          color:Colors.black87,
                        ),
                      ),
                      SingleChildScrollView(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.horizontal,
                        child:Row(
                          children: [
                            Container(
                              height:160.px,
                              width: 170.px,
                              margin: EdgeInsets.symmetric(horizontal: 10.px),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.px),
                                color:Colors.black87,
                              ),
                            ),
                            Container(
                              height:160.px,
                              width: 170.px,
                              margin: EdgeInsets.symmetric(horizontal: 10.px),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.px),
                                color:Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30.px,),
                      SingleChildScrollView(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.horizontal,
                        child:Row(
                          children: [
                            Container(
                              height:40.px,
                              width: 120.px,
                              margin: EdgeInsets.symmetric(horizontal: 10.px),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.px),
                                color:Colors.black87,
                              ),
                            ),
                            Container(
                              height:40.px,
                              width: 120.px,
                              margin: EdgeInsets.symmetric(horizontal: 10.px),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.px),
                                color:Colors.black87,
                              ),
                            ),
                            Container(
                              height:40.px,
                              width: 120.px,
                              margin: EdgeInsets.symmetric(horizontal: 10.px),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.px),
                                color:Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30.px,),
                      ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemCount: 5,
                          itemBuilder: (context,index){
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              height: 90.px,
                              padding: EdgeInsets.all(5.px),
                              margin: EdgeInsets.all(5.px),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.px),
                                border: Border.all(color: Colors.black87,width: 1.px)
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 50.px,width: 50.px,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25.px),
                                      color:Colors.black87,
                                    ),
                                  ),

                                  SizedBox(width: 10.px,),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 20.px,width: 100.px,
                                          margin: EdgeInsets.symmetric(vertical: 2.px),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5.px),
                                            color:Colors.black87,
                                          ),
                                        ),
                                        Container(
                                          height: 20.px,width: 70.px,
                                          margin: EdgeInsets.symmetric(vertical: 2.px),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5.px),
                                            color:Colors.black87,
                                          ),
                                        ),
                                        Container(
                                          height: 20.px,width: 100.px,
                                          margin: EdgeInsets.symmetric(vertical: 2.px),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5.px),
                                            color:Colors.black87,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 130.px,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          height: 25.px,width: 130.px,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(25.px),
                                            color:Colors.black87,
                                          ),
                                        ),
                                        Container(
                                          height: 25.px,width: 100.px,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(25.px),
                                            color:Colors.black87,
                                          ),
                                        ),],
                                    ),
                                  )

                                ],
                              ),
                            );
                          }
                      )
                    ],
                  )
                ):
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.px,),
                controller.showSearching.value?
                    Container(
                   height: 48.px,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.px),
                          color: greyColor
                      ),
                      child: TextFormField(
                        controller: controller.searchController,
                        style: MyTextStyle.customStyle(fontWeight: FontWeight.bold,color: primary3Color,
                        fontFamily: 'Lora'),
                        decoration: InputDecoration(
                          hintText: 'Search location...',
                          hintStyle: MyTextStyle.titleStyle14w,
                          suffixIcon: GestureDetector(
                            onTap: (){
                              controller.showSearching.value=false;
                            },
                              child: Icon(Icons.close,size: 25.px,color: primary3Color,)),
                          prefixIcon: Icon(Icons.search,size: 30.px,color:primary3Color,),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 13.px)
                        ),
                      ),

                    ):
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(StringConstants.connections,
                      style: MyTextStyle.customStyle(
                          fontFamily: "Lora",fontWeight: FontWeight.w700,fontSize: 24,color: primary3Color
                      ),),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            controller.showSearching.value=true;
                          },
                          child: Icon(Icons.search,size: 30.px,color:primary3Color,),
                        ),
                        SizedBox(
                          width: 5.px,
                        ),

                      ],
                    )
                  ],
                ),
                SizedBox(height: 10.px,),

                if(controller.expiringHouseList.isNotEmpty)
                SizedBox(
                  height: 165.px,
                  child: showExpiringList(),
                ),
                SizedBox(height: 20.px,),
                Container(
                  height: 40.px,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.px),
                    color: greyColor
                  ),
                  child: showTabList(),
                ),
                SizedBox(height: 10.px,),
                Expanded(
                    child: showTabByIndex()
                )

              ],
            ),
          ),
        );
      })
    );
  }

  Widget showTabByIndex(){
    switch (controller.currentTab.value){
      case 0:return showTravelingList();
      case 1:return showHostList();
      case 2:return showBookingList();
      default: return showTravelingList();
    }
  }

  Widget showExpiringList(){
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: controller.expiringHouseList.length,
        itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
              controller.clickOnExpiring(index);
            },
            child: Container(
              height: 160.px,
              width: 170.px,
              margin: EdgeInsets.all(5.px),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.px)
              ),
              clipBehavior: Clip.hardEdge,
              child: Stack(
                children: [
                  CommonWidgets.imageView(
                      image: controller.expiringHouseList[index].houseImagesUrls?[0]??'',
                    height: 160.px,
                    width: 170.px,
                  ),
                  Positioned(
                    left: 0.px,bottom: 0.px,
                      child: Container(
                        width: 170.px,
                        padding: EdgeInsets.all(10.px),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12.px),
                            bottomRight: Radius.circular(12.px),
                          ),
                        image: const DecorationImage(
                            image: AssetImage(ImageConstants.imgBlackBackground),
                          fit: BoxFit.fill
                        )
                        //  color: primary3Color.withOpacity(0.3)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text(controller.expiringHouseList[index].houseOwner?.name??'',
                            maxLines: 1,overflow: TextOverflow.ellipsis,
                            style: MyTextStyle.customStyle(fontSize: 14,color: primary3Color,fontWeight: FontWeight.w400,fontFamily: 'Lora'),),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.location_on_rounded,size: 20.px,color: primary3Color,),
                              SizedBox(width: 3.px,),
                              Flexible(
                                child: Text(controller.expiringHouseList[index].city??'',
                                  style: MyTextStyle.customStyle(fontSize: 12,color: primary3Color,fontWeight: FontWeight.w500,fontFamily: 'Lora'),
                                  maxLines: 1,overflow: TextOverflow.ellipsis,),
                              ),
                            ],
                          ),
                          ],
                        ),
                      )
                  ),
                  Positioned(
                    right: 10.px,top: 10.px,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.px,vertical: 8.px),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.px),
                          color: greyColor.withOpacity(0.25)
                        ),
                        child:  Text('10 Days',style: MyTextStyle.titleStyle10bw,),
                      )
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
  Widget showTabList(){
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: controller.tabList.length,
        padding: EdgeInsets.zero,
        itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
              controller.changeTab(index);
            },
            child: Container(
              height: 40.px,
              width: 90.px,
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.px),
                color: controller.currentTab.value==index?primary3Color:Colors.transparent,

              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  controller.currentTab.value==index?
                  CommonWidgets.gradientText(text:controller.tabList[index],style: MyTextStyle.customStyle(fontWeight: FontWeight.bold,fontFamily: 'Lora',fontSize: 12),):
                  Text(controller.tabList[index],style: MyTextStyle.customStyle(fontSize: 12,fontFamily: 'Lora',fontWeight: FontWeight.bold,color: primary3Color),),

                ],
              ),
            ),
          );
        }
    );
  }
  Widget showTravelingList(){
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: controller.travellingList.length,
        itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
              controller.clickOnTravelingUser(index);
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 85.px,
              margin: EdgeInsets.all(3.px),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.px),
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // index%2==0?
                      // Container(
                      //   width: 6.px,height: 6.px,
                      //   margin: EdgeInsets.all(3.px),
                      //   decoration: BoxDecoration(
                      //     color: Colors.blue.shade200,
                      //     borderRadius: BorderRadius.circular(3.px)
                      //   ),
                      // ):
                      SizedBox(width: 6.px,),
                      CommonWidgets.imageView(
                          image:controller.travellingList[index].house?.houseOwner?.profileimage??ApiUrlConstants.defaultUserProfile,
                        height: 50.px,width: 50.px,
                        defaultNetworkImage: ApiUrlConstants.defaultUserProfile,
                        borderRadius: BorderRadius.circular(25.px)
                      ),
                      SizedBox(width: 10.px,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(controller.travellingList[index].house?.houseOwner?.name??'',style: MyTextStyle.customStyle(fontWeight: FontWeight.bold,
                                  fontFamily: 'Lora',fontSize: 16,color: primary3Color),
                                  overflow: TextOverflow.ellipsis,),
                                  Padding(padding: EdgeInsets.all(3.px),
                                  child: Icon(Icons.circle,size: 3.px,color: textGolden,),),
                                  Text('New York'//controller.travellingList[index].house?.houseOwner?.country??,
                                      , style: MyTextStyle.customStyle(fontWeight: FontWeight.normal,
                                      fontFamily: 'Lora',fontSize: 12,color: primary3Color),),
                                ],
                              ),
                              Text(controller.travellingList[index].personalNote??'',style: MyTextStyle.titleStyle12w,
                              maxLines: 1,overflow: TextOverflow.ellipsis,),

                            ],
                          ),
                        ),
                        Container(
                          width: 100.px,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(controller.getTimeText(controller.travellingList[index].requestDate??''),
                                style: MyTextStyle.customStyle(fontSize: 12,fontWeight: FontWeight.normal,fontFamily: 'Lora',
                                color: primary3Color),),
                              SizedBox(height: 5.px,),
                              selectType(controller.travellingList[index].status??'Pending',controller.travellingList[index].lookingFor??'')
                            ],
                          ),
                        )

                    ],
                  ),
                  SizedBox(height: 5.px,),
                  Divider(thickness: 1.px,
                    color: primary3Color.withOpacity(0.2),
                  )
                ],
              ),
            ),
          );
        }
    );
  }
  Widget showHostList(){
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: controller.hostingList.length,
        itemBuilder: (context,index){

          return GestureDetector(
            onTap: (){
              controller.clickOnHostingUser(index);
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 85.px,
              margin: EdgeInsets.all(3.px),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.px),
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // index%2==0?
                      // Container(
                      //   width: 6.px,height: 6.px,
                      //   margin: EdgeInsets.all(3.px),
                      //   decoration: BoxDecoration(
                      //       color: Colors.blue.shade200,
                      //       borderRadius: BorderRadius.circular(3.px)
                      //   ),
                      // ):
                      SizedBox(width: 6.px,),
                      CommonWidgets.imageView(
                          image:controller.hostingList[index].user?.profileimage??ApiUrlConstants.defaultUserProfile,
                          height: 50.px,width: 50.px,
                          defaultNetworkImage: ApiUrlConstants.defaultUserProfile,
                          borderRadius: BorderRadius.circular(25.px)
                      ),
                      SizedBox(width: 10.px,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(controller.hostingList[index].user?.name??'',style: MyTextStyle.customStyle(fontWeight: FontWeight.bold,
                                    fontFamily: 'Lora',fontSize: 16,color: primary3Color),
                                  overflow: TextOverflow.ellipsis,),
                                Padding(padding: EdgeInsets.all(3.px),
                                  child: Icon(Icons.circle,size: 3.px,color: textGolden,),),
                                Text(controller.hostingList[index].user?.country??'',style: MyTextStyle.titleStyle10w,),
                              ],
                            ),
                            Text(controller.hostingList[index].personalNote??'',style: MyTextStyle.customStyle(fontSize: 12,fontFamily: 'Lora',
                                fontWeight: FontWeight.normal,color: primary3Color),maxLines: 1
                              ,overflow: TextOverflow.ellipsis,),

                          ],
                        ),
                      ),
                      Container(
                        width: 100.px,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(controller.getTimeText(controller.hostingList[index].requestDate??''),
                              style: MyTextStyle.customStyle(fontFamily: 'Lora',
                              fontWeight: FontWeight.normal,color: primary3Color,fontSize: 12),),
                            SizedBox(height: 5.px,),
                            selectType(controller.hostingList[index].status??'Pending',controller.hostingList[index].lookingFor??'',)
                          ],
                        ),
                      )

                    ],
                  ),
                  SizedBox(height: 5.px,),
                  Divider(thickness: 1.px,
                    color: primary3Color.withOpacity(0.2),
                  )
                ],
              ),
            ),
          );
        }
    );
  }

  Widget selectType(String status,String type){
    /*switch(status){
      case 'Pending':
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.px,vertical: 6.px),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.px),
                border: Border.all(color: textGolden,width: 1.px)
              ),
              child:Text('Pending $type',style: MyTextStyle.titleStyle10w,),

            ),
            if(type=='Swap')
            CommonWidgets.appImagesView(
                imagePath: IconConstants.icSwap,
              height: 25.px,
              width: 25.px,
            )
          ],
        );

      case 'Expired':
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 10.px,vertical: 6.px),
          decoration: BoxDecoration(
            color:  Colors.grey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(25.px),
               ),
          child:Text('offer Expired',style: MyTextStyle.titleStyle10w,),

        );
      case 'Confirmed':
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 10.px,vertical: 6.px),
          decoration: BoxDecoration(
            color:  textGolden,
            borderRadius: BorderRadius.circular(25.px),
          ),
          child:Text('$type Confirmed',style: MyTextStyle.titleStyle10w,),

        );
      case 'Cancelled':
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 10.px,vertical: 6.px),
          decoration: BoxDecoration(
            color:  Colors.grey.withOpacity(0.7),
            borderRadius: BorderRadius.circular(25.px),
          ),
          child:Text('Trip Cancelled',style: MyTextStyle.titleStyle10w,),

        );
        case 'Current':
        return Padding(
          padding:  EdgeInsets.only(right: 10.px,bottom: 10.px),
          child: Text('New Dates',style: MyTextStyle.customStyle(fontSize: 10,fontWeight: FontWeight.w500,color: Colors.green),),
        );
      default :
        return SizedBox();
    }*/
   return type=='Swap'?
      CommonWidgets.appImagesView(
        imagePath: IconConstants.icSwap,
        height: 25.px,
        width: 25.px,
      ):const SizedBox();
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
              height: 310.px,
              margin: EdgeInsets.all(5.px),
              padding: EdgeInsets.all(5.px),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.px),
                  color: primary3Color
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 215.px,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.px),
                          color: textGolden
                        ),
                      ),
                      Positioned(
                        bottom: 10.px,left: 10.px,
                          child: Row(
                            children: [
                              Text('Your ${item.lookingFor}:',style: MyTextStyle.titleStyle12bb,),
                              Text(' ${DateRangeFormat.dateRangeCount(item.startDate.toString(), item.endDate.toString())} nights',style: MyTextStyle.titleStyle12b,),

                            ],
                          )
                      ),
                      Positioned(
                        top: 0.px,left: 0.px,right: 0.px,
                          child: Stack(
                            children: [
                              CommonWidgets.imageView(
                                  image: item.house?.houseOwner?.profileimage??'',
                              height: 175.px,width: MediaQuery.of(context).size.width,
                              borderRadius: BorderRadius.circular(15.px)),
                              Positioned(
                                  top: 10.px,left: 10.px,
                                  child:   CommonWidgets.appImagesView(
                                      imagePath: IconConstants.icSwap,
                                      height: 25.px,
                                      width: 25.px
                                  )
                              ),
                              Positioned(
                                  bottom: 10.px,left: 10.px,right: 10.px,
                                  child:   Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(item.house?.houseOwner?.name??'',style: MyTextStyle.customStyle(
                                              fontWeight: FontWeight.w700,fontSize: 18,fontFamily: 'Buenard',
                                              color: primary3Color
                                            ),),
                                            Row(
                                              children: [
                                                Icon(Icons.location_on,size: 15.px,color: primary3Color,),
                                                SizedBox(width: 5.px,),
                                                Flexible(child: Text(item.house?.city??'',style: MyTextStyle.titleStyle10w,overflow: TextOverflow.ellipsis,))
                                              ],
                                            )
                                        
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 10.px,vertical: 6.px),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25.px),
                                        color: primary3Color.withOpacity(0.4)
                                      ),
                                        child: Row(
                                          children: [
                                            CommonWidgets.appImagesView(
                                                imagePath: IconConstants.icCalender,
                                            color: primary3Color,
                                            height: 25.px,width: 25.px),
                                            SizedBox(width: 5.px,),
                                            Text(item.startDate!=null?DateRangeFormat.formatDateRange(item.startDate.toString(), item.endDate.toString()):'',style: MyTextStyle.titleStyle12bw,)


                                          ],
                                        ),
                                      )
                                    ],
                                  )
                              ),
                            ],
                          ),

                      ),

                    ],
                  ),
                  SizedBox(height: 10.px,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CommonWidgets.imageView(
                          image:item.user?.profileimage??'',
                          height: 50.px,width: 50.px,
                          borderRadius: BorderRadius.circular(25.px),
                        defaultNetworkImage: ApiUrlConstants.defaultUserProfile
                      ),
                      SizedBox(width: 10.px,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(item.user?.name??'',style: MyTextStyle.titleStyle14bb,
                                  overflow: TextOverflow.ellipsis,),
                                Padding(padding: EdgeInsets.all(5.px),
                                  child: Icon(Icons.circle,size: 5.px,color: textGolden,),),
                                Text(item.user?.country??'',style: MyTextStyle.titleStyle10b,),
                              ],
                            ),
                            Text(item.personalNote??'',style: MyTextStyle.titleStyle12b,overflow: TextOverflow.ellipsis,
                            maxLines: 1,),

                          ],
                        ),
                      ),
                      SizedBox(
                        width: 100.px,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Now',style: MyTextStyle.titleStyle12b,),
                            SizedBox(width: 5.px,),
                            Icon(Icons.radio_button_checked,color: greenColor,size: 20.px,)
                             ],
                        ),
                      )

                    ],
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}
