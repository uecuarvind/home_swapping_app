
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

import 'package:get/get.dart';
import 'package:home_swipping/app/data/constants/icons_constant.dart';
import 'package:home_swipping/app/data/constants/image_constants.dart';
import 'package:home_swipping/app/data/constants/string_constants.dart';
import 'package:home_swipping/app/modules/trips/views/trips_view.dart';
import 'package:home_swipping/common/MyTextStyle.dart';
import 'package:home_swipping/common/colors.dart';
import 'package:home_swipping/common/common_widgets.dart';
import 'package:home_swipping/common/map_container.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:swipe_cards/swipe_cards.dart';

import '../../../routes/app_pages.dart';
import '../controllers/explore_controller.dart';

class ExploreView extends GetView<ExploreController> {
  const ExploreView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: blackColor,
       body: Obx((){
        controller.count.value;
        return controller.isLoading.value?
           CommonWidgets.commonShimmer(
             height: MediaQuery.of(context).size.height,
             width: MediaQuery.of(context).size.width,
             shimmerWidget:Stack(
               children: [
                 Container(
                   height: MediaQuery.of(context).size.height-80,width: MediaQuery.of(context).size.width,
                   decoration: const BoxDecoration(
                     color: Colors.black45
                   ),
                 ),
                 Positioned(
                     top:60.px,
                     child:Container(
                       padding: EdgeInsets.symmetric(horizontal: 20.px),

                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                           Container(
                               height: 48.px,width: MediaQuery.of(context).size.width-100.px,
                               padding: EdgeInsets.symmetric(horizontal: 20.px,vertical: 0.px),
                               decoration: BoxDecoration(
                                   color:Colors.black87,
                                   borderRadius: BorderRadius.circular(100.px),
                               ),
                           ),
                           Container (
                               height: 50.px,width: 50.px,
                               margin: EdgeInsets.only(left: 10.px),
                               padding: EdgeInsets.all(8.px),
                               alignment: Alignment.center,
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(25.px),
                                 color:Colors.black87,
                               ),),
                         ],
                       ),
                     )
                 ),
                 Positioned(
                   bottom: 5.px,left: 10.px,right: 10.px,
                   child: Column(
                     children: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Expanded(
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Row(
                                   children: [
                                     Container(
                                       height: 50.px,width: 50.px,
                                       decoration: BoxDecoration(
                                         color:Colors.black87,borderRadius: BorderRadius.circular(25.px),
                                       ),
                                     ),
                                     SizedBox(width:5.px,),
                                     Column(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Container(
                                           height: 15.px,width: 100.px,
                                           margin: EdgeInsets.symmetric(vertical: 3.px),
                                           decoration: BoxDecoration(
                                             color:Colors.black87,borderRadius: BorderRadius.circular(2.px),
                                           ),
                                         ),
                                         Container(
                                           height: 15.px,width: 200.px,
                                           decoration: BoxDecoration(
                                             color:Colors.black87,borderRadius: BorderRadius.circular(2.px),
                                           ),
                                         ),
                                       ],
                                     )
                                   ],
                                 ),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   children: [
                                     Container(
                                       height: 20.px,width: 20.px,
                                       margin: EdgeInsets.symmetric(horizontal: 3.px,vertical: 5.px),
                                       decoration: BoxDecoration(
                                         color:Colors.black87,borderRadius: BorderRadius.circular(2.px),
                                       ),
                                     ),
                                     Container(
                                       height: 20.px,width: 100.px,
                                       decoration: BoxDecoration(
                                         color:Colors.black87,borderRadius: BorderRadius.circular(2.px),
                                       ),
                                     ),
                                         ],
                                 ),
                                 Container(
                                   height: 15.px,width: 200.px,
                                   margin: EdgeInsets.symmetric(horizontal: 3.px,vertical: 3.px),
                                   decoration: BoxDecoration(
                                     color:Colors.black87,borderRadius: BorderRadius.circular(2.px),
                                   ),
                                 ),
                                 Container(
                                   height: 15.px,width: 100.px,
                                   margin: EdgeInsets.symmetric(horizontal: 3.px,vertical: 3.px),
                                   decoration: BoxDecoration(
                                     color:Colors.black87,borderRadius: BorderRadius.circular(2.px),
                                   ),
                                 ),

                               ],
                             ),
                           ),
                           Container(
                             height: 64.px,width: 64.px,
                             margin: EdgeInsets.symmetric(horizontal: 5.px,vertical: 3.px),
                             decoration: BoxDecoration(
                               color:Colors.black87,borderRadius: BorderRadius.circular(32.px),
                             ),
                           ),
                         ],
                       ),
                       SizedBox(height: 10.px,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                           Container(
                             height:25.px,width: 110.px,
                             margin:  EdgeInsets.symmetric(vertical: 4.px,horizontal: 5.px),
                             decoration: BoxDecoration(
                                color:Colors.black87,
                                 borderRadius: BorderRadius.circular(8.px)
                             ),

                           ),
                           Container(
                             height:25.px,width: 110.px,
                             margin:  EdgeInsets.symmetric(vertical: 4.px,horizontal: 5.px),
                             decoration: BoxDecoration(
                                  color:Colors.black87,
                                 borderRadius: BorderRadius.circular(8.px)
                             ),

                           ),
                           Container(
                             height:25.px,width: 110.px,
                             margin:  EdgeInsets.symmetric(vertical: 4.px,horizontal: 5.px),
                             decoration: BoxDecoration(
                                 color:Colors.black87,
                                 borderRadius: BorderRadius.circular(8.px)
                             ),

                           ),
                         ],
                       ),
                       SizedBox(height: 10.px,),
                     ],
                   ),
                 ),
                 Positioned(
                   bottom: 155.px,right: 20.px,
                   child: Column(
                     children: [
                       Container(
                         height:50.px,width: 50.px,
                         margin:  EdgeInsets.symmetric(vertical: 4.px,horizontal: 6.px),
                         decoration: BoxDecoration(
                             color:Colors.black87,
                             borderRadius: BorderRadius.circular(25.px)
                         ),
                       ),
                       Container(
                         height:50.px,width: 50.px,
                         margin:  EdgeInsets.symmetric(vertical: 4.px,horizontal: 6.px),
                         decoration: BoxDecoration(
                             color:Colors.black87,
                             borderRadius: BorderRadius.circular(25.px)
                         ),
                       ),
                       Container(
                         height:50.px,width: 50.px,
                         margin:  EdgeInsets.symmetric(vertical: 4.px,horizontal: 6.px),
                         decoration: BoxDecoration(
                             color:Colors.black87,
                             borderRadius: BorderRadius.circular(25.px)
                         ),
                       ),
                     ],
                   ),
                 )
               ],
             )
           ):

          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              //color: Colors.redAccent,
              image: DecorationImage(
                  image: AssetImage(ImageConstants.imgExploreBackground),
                fit: BoxFit.fill
              )
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                ListView(
                padding: EdgeInsets.zero,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.px),
                    margin: EdgeInsets.only(top: 60.px,bottom: 10.px),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap:() {
                              controller.onTapWhereWeGo();
                            },
                            child: Container(
                                height: 48.px,
                                padding: EdgeInsets.symmetric(horizontal: 20.px,vertical: 0.px),
                                decoration: BoxDecoration(
                                    color: primary3Color.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(12.px),
                                    border: Border.all(color: primary3Color.withOpacity(0.1)),
                                  image: const DecorationImage(image: AssetImage(ImageConstants.imgBlurFull),fit: BoxFit.fill)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CommonWidgets.appImagesView(
                                        imagePath: IconConstants.icEarth,
                                        width: 22.px,height: 22.px,fit: BoxFit.cover
                                    ),
                                    SizedBox(width: 10.px,),
                                    Text("Where should we go, Josh?",
                                      //'${StringConstants.whereShouldWeGo} ${controller.name}?',
                                      style: MyTextStyle.customStyle(fontSize: 14.px,fontFamily: 'Lora',color:primary3Color,fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                )
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            controller.clickOnRobort();
                          },
                          child: Padding(
                            padding:  EdgeInsets.only(left: 10.px),
                            child: CommonWidgets.appImagesView(
                                imagePath: IconConstants.icRobort,height: 50.px,width: 36.px),
                          ),
                        )
                      ],
                    ),
                  ),
                  (controller.houseList.isNotEmpty && !controller.isEmptyItem.value)?
                  Container(
                    height: 1400.px,
                    width: MediaQuery.of(context).size.width,

                    margin: EdgeInsets.zero,

                    child: SwipeCards(
                      matchEngine: controller.matchEngine!,
                      itemBuilder: (BuildContext context, int pIndex1) {
                        return Column(
                          children: [
                            Stack(
                              children: [
                                CarouselSlider(
                                  carouselController:controller.sliderController ,
                                  items: List.generate(
                                      controller.houseList[controller.currentHouseIndex.value].houseImagesUrls!.length,
                                          (index) =>Container(
                                        child: CommonWidgets.imageView(
                                            image:controller.houseList[controller.currentHouseIndex.value].houseImagesUrls![index]??'',
                                            height: 570.px,width: MediaQuery.of(context).size.width,
                                            fit: BoxFit.cover
                                        ),
                                      )
                                  ),
                                  options: CarouselOptions(
                                      height: 570.px,
                                      viewportFraction:1.0,
                                      initialPage: 0,
                                      enableInfiniteScroll: true,
                                      reverse: false,
                                      autoPlay: true,
                                      pageSnapping: false,
                                      autoPlayInterval: const Duration(seconds: 3),
                                      autoPlayAnimationDuration:
                                      const Duration(milliseconds: 10),
                                      autoPlayCurve: Curves.easeInOut,
                                      enlargeCenterPage: true,
                                      enlargeFactor: 0.01,
                                      scrollDirection: Axis.horizontal,
                                      onPageChanged: (val, _) {
                                        controller.currentIndex.value=val;
                                      }

                                  ),
                                ),
                                Positioned(
                                    top: 0.px,left: 0.px,right: 0.px,bottom:0.px,
                                    child: Container(
                                      color: Colors.transparent,
                                    )
                                ),
                                Positioned(
                                    left: 0.px,right: 0.px,bottom:0.px,
                                    child: CommonWidgets.appImagesView(
                                        imagePath: ImageConstants.imgBlackBackground,
                                    height: 250.px,)
                                ),

                                Positioned(
                                  top: 10.px,left: 20.px,right: 20.px,
                                  child: Column(
                                    children: [
                                      SizedBox(height: 10.px,),
                                      Obx((){
                                        controller.currentIndex.value;
                                        return  DotsIndicator(
                                          dotsCount: controller.houseList[controller.currentHouseIndex.value].houseImagesUrls!.length,
                                          position: controller.currentIndex.value,
                                          decorator: DotsDecorator(
                                              color: Colors.black, // Inactive color
                                              activeColor: primary3Color,
                                              size: Size(8.px,8.px ),
                                              spacing: EdgeInsets.all(4.px)
                                          ),
                                        );
                                      }),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            onTap:(){
                                              if (controller.currentHouseIndex.value > 0) {
                                                controller.currentHouseIndex.value--;  // Go to the previous item
                                                controller.matchEngine = MatchEngine(swipeItems: controller.swipeItems);
                                              controller.increment();
                                              }
                                              print('Refresh index:-${controller.currentHouseIndex.value}');
                                              print('Refresh index pIndex:-${pIndex1}');
                                           },
                                            child: CommonWidgets.appImagesView(
                                                imagePath: IconConstants.icRefresh,height: 40.px,width: 40.px
                                            ),
                                          ),
                                          // CommonWidgets.appImagesView(
                                          //     imagePath: IconConstants.icSwap,height: 40.px,width: 40.px
                                          // )
                                        ],
                                      ),
                                      // SizedBox(height: 50.px,),
                                      // if(controller.showActionIcon.value)
                                      //   CommonWidgets.appImagesView(
                                      //       imagePath: controller.rightLeftSwap.value?IconConstants.icLike:IconConstants.icUnLike,
                                      //     width: 80.px,height: 80.px
                                      //   )
                                    ],
                                  ),
                                ),

                                Positioned(
                                  bottom: 5.px,left: 10.px,right: 10.px,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,

                                    children: [
                                      Text("Desert Oasis",style: MyTextStyle.customStyle(fontFamily: 'Lora',fontSize: 24.px,color:primary3Color,
                                      fontWeight: FontWeight.bold),),
                                      SizedBox(height: 10.px,),
                                      Row(
                                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 30.px,
                                                width: 55.px,
                                                alignment: Alignment.center,
                                                margin: EdgeInsets.symmetric(horizontal: 5.px),
                                                decoration: BoxDecoration(
                                                  color:primary3Color.withOpacity(0.20),
                                                  borderRadius: BorderRadius.circular(20.px),
                                                ),
                                                child:  Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    CommonWidgets.appImagesView(imagePath: IconConstants.icPerson1,
                                                        height: 18.px,width: 18.px),
                                                    SizedBox(width: 2.px,),
                                                    Text("3",style:
                                                    MyTextStyle.customStyle(fontFamily: 'Lora',color:primary3Color,fontSize: 16.px,fontWeight: FontWeight.w500),),
                                                  ],
                                                ),

                                              ),
                                              Container(
                                                height: 30.px,
                                                width: 55.px,
                                                alignment: Alignment.center,
                                                margin: EdgeInsets.symmetric(horizontal: 5.px),
                                                decoration: BoxDecoration(
                                                  color:primary3Color.withOpacity(0.20),
                                                  borderRadius: BorderRadius.circular(20.px),
                                                ),
                                                child:  Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    CommonWidgets.appImagesView(imagePath: IconConstants.icBed1,
                                                        height: 18.px,width: 18.px),
                                                    SizedBox(width: 2.px,),
                                                    Text("4",style:
                                                    MyTextStyle.customStyle(fontFamily: 'Lora',color:primary3Color,fontSize: 16.px,fontWeight: FontWeight.w500),),
                                                  ],
                                                ),

                                              ),
                                              Container(
                                                height: 30.px,
                                                width: 55.px,
                                                alignment: Alignment.center,
                                                margin: EdgeInsets.symmetric(horizontal: 5.px),
                                                decoration: BoxDecoration(
                                                  color:primary3Color.withOpacity(0.20),
                                                  borderRadius: BorderRadius.circular(20.px),
                                                ),
                                                child:  Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    CommonWidgets.appImagesView(imagePath: IconConstants.icBathTub1,
                                                        height: 18.px,width: 18.px),
                                                    SizedBox(width: 2.px,),
                                                    Text("2",style:
                                                    MyTextStyle.customStyle(fontFamily: 'Lora',color:primary3Color,fontSize: 16.px,fontWeight: FontWeight.w500),),
                                                  ],
                                                ),

                                              ),
                                            ],
                                          ),
                                          Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              CommonWidgets.appImagesView(
                                                  imagePath: ImageConstants.imgMap,
                                                  height: 50.px,
                                                  width: 150.px
                                              ),
                                              Positioned(
                                                left: 10.px,right: 10.px,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      height: 35.px,
                                                      alignment: Alignment.center,
                                                      padding: EdgeInsets.symmetric(horizontal: 10.px,vertical: 5.px
                                                      ),
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(20.px),
                                                          color: greyColor
                                                      ),
                                                      child: Text('New York',style: MyTextStyle.titleStyle14bw,),
                                                    ),
                                                    Icon(Icons.circle,size: 10.px,color: primary3Color,)
                                                  ],
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      Divider(
                                        thickness: 1.px,color: primary3Color.withOpacity(0.5),
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                              controller.openTravellerProfile();
                                            },
                                            child: Row(
                                              children: [
                                                CommonWidgets.imageView(
                                                    image:controller.houseList[controller.currentHouseIndex.value].houseOwner?.profileimage??'',borderRadius: BorderRadius.circular(25.px),
                                                    height: 40.px,width: 40.px
                                                ),
                                                SizedBox(width:5.px,),
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(controller.houseList[controller.currentHouseIndex.value].houseOwner?.name??'',style: MyTextStyle.customStyle(fontFamily: 'Lora',fontSize: 16.px,color:primary3Color,fontWeight: FontWeight.w800),),
                                                        CommonWidgets.appImagesView(
                                                            imagePath: IconConstants.icBlueTick,height: 30.px,width: 30.px,
                                                            fit: BoxFit.cover
                                                        )
                                                      ],
                                                    ),

                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Icon(Icons.location_on,size: 20.px,color: primary3Color,),
                                              Expanded(
                                                child: Text(controller.houseList[controller.currentHouseIndex.value].city??"",style: MyTextStyle.customStyle(fontFamily: 'Lora',color:primary3Color,fontSize: 14.px,fontWeight: FontWeight.w700),
                                                  overflow: TextOverflow.ellipsis,),
                                              ),
                                            ],
                                          ),

                                        ],
                                      ),
                                      SizedBox(height: 10.px,),
                                      SizedBox(
                                        height: 30.px,
                                        child: ListView.builder(
                                          itemCount: controller.horizontalList.length,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context,index){
                                              return Container(
                                                padding:  EdgeInsets.symmetric(vertical: 4.px,horizontal: 8.px),
                                                margin: EdgeInsets.symmetric(horizontal: 5.px),
                                                decoration: BoxDecoration(
                                                    color: primary3Color.withOpacity(0.15),
                                                   borderRadius: BorderRadius.circular(15.px)
                                                ),
                                                clipBehavior: Clip.hardEdge,
                                                child: Center(
                                                  child: Text(controller.horizontalList[index],style: MyTextStyle.titleStyle12bw,),
                                                ),
                                              );
                                            }
                                        ),
                                      ),

                                      SizedBox(height: 10.px,),
                                      Text(controller.houseList[controller.currentHouseIndex.value].description??".....",style: MyTextStyle.customStyle(fontFamily: 'Lora',fontWeight: FontWeight.w500,
                                        fontSize: 12.px,color:primary3Color,),maxLines: 2,overflow: TextOverflow.ellipsis,),
                                      SizedBox(height: 10.px,),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                color: blackColor
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 10.px),
                                    child: Row(
                                      children: [
                                        CommonWidgets.appImagesView(
                                            imagePath: IconConstants.icFlight,height:18.px,width: 18.px
                                        ),
                                        SizedBox(width: 15.px,),
                                        Text('New York (Dec. 6-15)',
                                          style: MyTextStyle.customStyle(
                                              fontFamily: "Lora",fontWeight: FontWeight.w700,fontSize: 12,color: primary3Color
                                          ),
                                        ),
                                        SizedBox(width: 15.px,),
                                        Text('Paris (May 2-6)',
                                          style: MyTextStyle.customStyle(
                                              fontFamily: "Lora",fontWeight: FontWeight.w700,fontSize: 12,color: primary3Color
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 68.px,
                                    margin: EdgeInsets.only(top: 15.px,bottom: 15.px,
                                        left: 10.px,right: 10.px),
                                    padding: EdgeInsets.only(left: 20.px,right: 5.px,),
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        color:primary3Color.withOpacity(0.20),
                                        borderRadius: BorderRadius.circular(34.px),
                                        border: Border.all(color: primary3Color.withOpacity(0.25),width: 1.px)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:  EdgeInsets.only(top: 10.px,right: 5.px),
                                              child: CommonWidgets.appImagesView(
                                                  imagePath: ImageConstants.imgTicket,height:20.px,width: 20.px,
                                                  fit: BoxFit.cover
                                              ),
                                            ),
                                            Text("Dec 3-7th",style:
                                            MyTextStyle.customStyle(fontFamily: 'Lora',color:primary3Color,fontSize: 14.px,fontWeight: FontWeight.w700),),
                                            Padding(
                                              padding:  EdgeInsets.symmetric(horizontal: 10.px),
                                              child: CommonWidgets.appImagesView(
                                                  imagePath: IconConstants.icTransfer,height:12.px,width: 16.px
                                              ),
                                            ),
                                            Text("Dec 3-7th",style:
                                            MyTextStyle.customStyle(fontFamily: 'Lora',color:primary3Color,fontSize: 14.px,fontWeight: FontWeight.w700),),


                                          ],
                                        ),

                                        CommonWidgets.gradientButton(
                                            width: 140.px,wantContentSizeButton: true,height: 48.px,
                                            onPressed: (){
                                              controller.clickOnTravelPlan();
                                            },
                                            text: StringConstants.connect
                                        )
                                      ],
                                    ),
                                  ),

                                  SizedBox(height: 16.px,),
                                  Container(
                                    padding: EdgeInsets.only(left: 10.px,right: 10.px),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        if(controller.houseList[controller.currentHouseIndex.value].spaceQuestionAns!.isNotEmpty)
                                          SizedBox(
                                            height: 190.px,
                                            child: ListView.builder(
                                                shrinkWrap: true,
                                                scrollDirection: Axis.horizontal,
                                                itemCount: controller.houseList[controller.currentHouseIndex.value].spaceQuestionAns?.length??0,
                                                itemBuilder: (context,index){
                                                  return Card(
                                                    elevation: 0,
                                                    color:primary3Color.withOpacity(0.20),

                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(16.px),
                                                        side: BorderSide(color: primary3Color.withOpacity(0.5),width: 1.px)
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          CommonWidgets.appImagesView(
                                                              imagePath: IconConstants.icComma,height: 18.px,width: 22.px,
                                                              fit: BoxFit.cover,color: primary3Color
                                                          ),
                                                          SizedBox(height: 6.px,),
                                                          Text(controller.houseList[controller.currentHouseIndex.value].spaceQuestionAns?[index].question??"",
                                                            style: MyTextStyle.customStyle(
                                                                fontFamily: "Lora",fontWeight: FontWeight.w700,fontSize: 14,color: textGrey
                                                            ),
                                                            maxLines: 2,overflow: TextOverflow.ellipsis,
                                                          ),
                                                          SizedBox(height: 6.px,),
                                                          Text(controller.houseList[controller.currentHouseIndex.value].spaceQuestionAns?[index].answer??"",
                                                            style: MyTextStyle.customStyle(
                                                                fontFamily: "Lora",fontWeight: FontWeight.w500,fontSize: 14,color: textGrey
                                                            ),
                                                            maxLines: 4,overflow: TextOverflow.ellipsis,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                }
                                            ),
                                          ),

                                        SizedBox(height: 10.px,),

                                        CommonWidgets.appImagesView(
                                            imagePath: ImageConstants.imgWhatWillHave,
                                            height: 131.px,
                                            width: MediaQuery.of(context).size.width
                                        ),

                                        SizedBox(height: 10.px,),
                                        Text(StringConstants.inCommon,
                                          style: MyTextStyle.customStyle(
                                              fontFamily: "Lora",fontWeight: FontWeight.w700,fontSize: 18.px,color: primary3Color
                                          ),
                                        ),
                                        SizedBox(height: 10.px,),
                                        SizedBox(
                                          height: 190.px,
                                          child: ListView.builder(
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              itemCount: controller.inCommonList.length,
                                              itemBuilder: (context,index){
                                                return Container(
                                                  width:( MediaQuery.of(context).size.width/2)-50,
                                                  margin: EdgeInsets.symmetric(horizontal: 5.px),
                                                  padding: EdgeInsets.all(15.px),
                                                  decoration: BoxDecoration(
                                                      color:primary3Color.withOpacity(0.20),
                                                      borderRadius: BorderRadius.circular(16.px),
                                                      border: Border.all(color: primary3Color.withOpacity(0.5),width: 1.px)
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(controller.inCommonList[index]['title']??"",
                                                        style: MyTextStyle.customStyle(
                                                            fontFamily: "Lora",fontWeight: FontWeight.w700,fontSize: 16,color: primary3Color
                                                        ),
                                                      ),
                                                      SizedBox(height: 6.px,),
                                                      Row(
                                                        children: [
                                                          SizedBox(width: 5.px,),
                                                          Icon(Icons.circle,size: 8.px,color: primary3Color,),
                                                          SizedBox(width: 5.px,),
                                                          Text(controller.inCommonList[index]['1']??"",
                                                            style: MyTextStyle.customStyle(
                                                                fontFamily: "Lora",fontWeight: FontWeight.w500,fontSize: 14,color: primary3Color
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 6.px,),
                                                      Row(
                                                        children: [
                                                          SizedBox(width: 5.px,),
                                                          Icon(Icons.circle,size: 8.px,color: primary3Color,),
                                                          SizedBox(width: 5.px,),
                                                          Text(controller.inCommonList[index]['2']??"",
                                                            style: MyTextStyle.customStyle(
                                                                fontFamily: "Lora",fontWeight: FontWeight.w500,fontSize: 14,color: primary3Color
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 6.px,),
                                                      Row(
                                                        children: [
                                                          SizedBox(width: 5.px,),
                                                          Icon(Icons.circle,size: 8.px,color: primary3Color,),
                                                          SizedBox(width: 5.px,),
                                                          Text(controller.inCommonList[index]['3']??"",
                                                            style: MyTextStyle.customStyle(
                                                                fontFamily: "Lora",fontWeight: FontWeight.w500,fontSize: 14,color: primary3Color
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 6.px,),
                                                      Row(
                                                        children: [
                                                          SizedBox(width: 5.px,),
                                                          Icon(Icons.circle,size: 8.px,color: primary3Color,),
                                                          SizedBox(width: 5.px,),
                                                          Text(controller.inCommonList[index]['4']??"",
                                                            style: MyTextStyle.customStyle(
                                                                fontFamily: "Lora",fontWeight: FontWeight.w500,fontSize: 14,color: primary3Color
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              }
                                          ),
                                        ),
                                        SizedBox(height: 50.px,),
                                        /*    Text(StringConstants.neighborhood,
                              style: MyTextStyle.customStyle(
                                  fontFamily: "Lora",fontWeight: FontWeight.w700,fontSize: 20.px,color: labelColor
                              ),
                            ),
                            Card(
                              elevation:3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.px),
                              ),
                              clipBehavior: Clip.hardEdge,
                              margin: EdgeInsets.only(bottom: 10.px),
                              child:GoogleMapContainer(latitude: double.parse(controller.houseList[controller.currentHouseIndex.value].lat??'38.7946'), longitude: double.parse(controller.houseList[controller.currentHouseIndex.value].long??'106.5348'),
                                  height: 198.px, width: MediaQuery.of(context).size.width,
                                  markerIconPath: IconConstants.icMapPin) ,
                            ),
                          if(controller.houseList[controller.currentHouseIndex.value].neighborhoodDetails!=null)
                            Container(
                              color: primary3Color,
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(StringConstants.theSoulOfNeighbor,
                                    style: MyTextStyle.customStyle(
                                        fontFamily: "Lora",fontWeight: FontWeight.w700,fontSize: 20,color: labelColor
                                    ),
                                  ),
                                  Text(controller.houseList[controller.currentHouseIndex.value].neighborhoodDetails?.details??"",
                                    style: MyTextStyle.customStyle(
                                        fontFamily: "Lora",fontWeight: FontWeight.w400,fontSize: 14,color: text2Color
                                    ),
                                  ),
                                  Text(StringConstants.readMore,
                                    style: MyTextStyle.customStyle(
                                        fontFamily: "Lora",fontWeight: FontWeight.w700,fontSize: 14,color: text2Color
                                    ),
                                  ),
                                ],
                              ),
                            ),*/
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        );
                      },
                      onStackFinished: () {
                        // controller.currentHouseIndex.value=0;
                        // controller.matchEngine = MatchEngine(swipeItems: controller.swipeItems);
                        controller.isEmptyItem.value=true;
                        controller.increment();
                        print('length :---${controller.houseList.length}');
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Stack Finished"),
                          duration: Duration(milliseconds: 500),
                        ));
                      },
                      itemChanged: (SwipeItem item, int index) {
                        print("item: ${item.content.city}, index: $index");
                        controller.currentHouseIndex.value=index;
                      },
                      leftSwipeAllowed: true,
                      rightSwipeAllowed: true,
                      upSwipeAllowed: false,
                      fillSpace: true,
                      likeTag: Container(
                        margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.all(3.0),

                        child: CommonWidgets.appImagesView(
                            imagePath: IconConstants.icLike,
                            width: 80.px,height: 80.px
                        ),
                      ),
                      nopeTag: Container(
                        margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.all(3.0),

                        child: CommonWidgets.appImagesView(
                            imagePath: IconConstants.icUnLike,
                            width: 80.px,height: 80.px
                        ),
                      ),
                      superLikeTag: Container(
                        margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.orange)
                        ),
                        child: Text('Super Like'),
                      ),
                    ),
                  ):
                  Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        //color: Colors.redAccent,
                          image: DecorationImage(
                              image: AssetImage(ImageConstants.imgEmptyBackground),
                              fit: BoxFit.fill
                          )
                      ),
                      child: Stack(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CommonWidgets.appImagesView(imagePath: ImageConstants.imgAllian,
                              height: 170.px,width: 100.px),
                              SizedBox(height: 20.px,),
                              Center(child: Text('No More Spaces In This City..',style: MyTextStyle.customStyle(
                                fontWeight: FontWeight.w700,fontSize: 16,fontFamily: 'Lora',color: primary3Color
                              ),)),
                              CommonWidgets.gradientButton(onPressed: (){


                              },
                                text: 'Similar Destinations',
                                buttonMargin: EdgeInsets.symmetric(vertical: 20.px)
                              ),
                              SizedBox(height: 150.px,)
                            ],
                          ),
                          GestureDetector(
                            onTap:(){
                              controller.matchEngine = MatchEngine(swipeItems: controller.swipeItems);
                              controller.isEmptyItem.value=false;
                              controller.increment();
                            },
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 10.px,vertical: 15.px),
                              child: CommonWidgets.appImagesView(
                                  imagePath: IconConstants.icRefresh,height: 40.px,width: 40.px
                              ),
                            ),
                          ),
                        ],
                      )),

                ],
                        ),
                customBottomBar(context),
              ],
            ),
          );
      })
    );
  }


  /// BottomBar
  Widget customBottomBar(BuildContext context){
    return Container(
      height: 90.px,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(bottom: 10.px),
      decoration:  const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImageConstants.imgBlackBackground),
              fit: BoxFit.fill
          )
      ),
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: (){
              controller.changeTabIndex(0);
            },
            child: CommonWidgets.appImagesView(
                imagePath: IconConstants.icExplore,height: 24.px,width: 24.px),
          ),
          GestureDetector(
              onTap: (){
                controller.changeTabIndex(1);

              },
              child: CommonWidgets.appImagesView(imagePath: IconConstants.icTrips,
                  height: 48.px,width: 48.px)
          ),
          GestureDetector(
            onTap: (){
              controller.changeTabIndex(2);
              // controller.onTapGoToProfile();
            },
            child: CommonWidgets.appImagesView(imagePath:'assets/images/user_profile.png',height: 30.px,width: 30.px,fit: BoxFit.cover,borderRadius: 100.px),
          ),
        ],
      ),

    );
  }
}
