import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:home_swipping/app/data/constants/image_constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/house_owner_details_controller.dart';

class HouseOwnerDetailsView extends GetView<HouseOwnerDetailsController> {
  const HouseOwnerDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton:    Container(
          height: 68.px,
          margin: EdgeInsets.only(top: 15.px,bottom: 15.px,
              left: 10.px,right: 10.px),
          padding: EdgeInsets.only(left: 20.px,right: 5.px,),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color:greyColor.withOpacity(0.9),
              borderRadius: BorderRadius.circular(34.px),
              border: Border.all(color: primary3Color.withOpacity(0.25),width: 1.px),
            image: DecorationImage(
                image: AssetImage(ImageConstants.imgBlackBackground),
            fit: BoxFit.fill)
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

                  },
                  text: StringConstants.connect
              )
            ],
          ),
        ),
        body: Obx((){
          controller.count.value;
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration:const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageConstants.imgExploreBackground),
                fit: BoxFit.fill
              )
            ),
            child: controller.isLoading.value?
            Center(child: CupertinoActivityIndicator(color: primary3Color,radius: 15.px,)):
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,//height: MediaQuery.of(context).size.height/2,
                        height: 600.px,
                        child: CommonWidgets.imageView(
                          image:controller.houseOwnerDetail?.user?.profileimage??'',fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                          height: 600.px,
                        ),
                      ),
                      Positioned(
                        bottom: 0.px,
                        child: CommonWidgets.appImagesView(
                            imagePath: ImageConstants.imgBlackBackground,
                            height: 350.px,width: MediaQuery.of(context).size.width
                        ),
                      ),
                      Positioned(
                        top: 40.px,left: 5.px,
                        child: Padding(
                          padding:  EdgeInsets.only(top: 10.px,left: 10.px,right: 10.px,),
                          child: InkWell(
                            onTap:(){
                              Get.back();
                            },
                            child: CommonWidgets.appImagesView(
                                imagePath: IconConstants.icBack,
                                height: 30.px,width: 30.px),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10.px,left: 10.px,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(controller.houseOwnerDetail?.user?.name??'',
                                  style: MyTextStyle.customStyle(
                                      fontFamily: 'Lora',fontSize: 30.px,color: primary3Color,fontWeight: FontWeight.w800
                                  ),
                                ),
                                CommonWidgets.appImagesView(
                                    imagePath: IconConstants.icBlueTick,height: 30.px,width: 30.px,
                                    fit: BoxFit.cover
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.location_pin,size: 20.px,color: primary3Color,),
                                SizedBox(width: 5.px,),
                                Text(controller.houseOwnerDetail?.user?.country??'New York',
                                  style: MyTextStyle.customStyle(
                                      fontFamily: 'Lora',fontSize: 20.px,color: primary3Color,fontWeight: FontWeight.w700
                                  ),
                                ),
                                SizedBox(width: 12.px,),
                                CommonWidgets.appImagesView(
                                    imagePath: IconConstants.icConnectRobort,height: 25.px,width: 25.px,
                                    fit: BoxFit.cover
                                ),
                                SizedBox(width: 5.px,),
                                Text('Member - Since 2023',
                                  style: MyTextStyle.customStyle(
                                      fontFamily: 'Lora',fontSize: 14.px,color: primary3Color,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              //margin: EdgeInsets.only(left: 10.px,right: 10.px),
                              height: 30.px,
                              margin: EdgeInsets.only(top: 10.px,bottom: 15.px),
                              width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                itemCount: controller.favoriteThingsList.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding:  EdgeInsets.symmetric(vertical: 4.px,horizontal: 8.px),
                                    margin: EdgeInsets.symmetric(horizontal: 5.px),
                                    decoration: BoxDecoration(
                                        color: primary3Color.withOpacity(0.15),
                                        borderRadius: BorderRadius.circular(15.px)
                                    ),
                                    clipBehavior: Clip.hardEdge,
                                    child: Center(
                                      child: Text(
                                        controller.favoriteThingsList[index]['name']??'',
                                        style:MyTextStyle.titleStyle12bw,),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Text(controller.houseOwnerDetail?.user?.description??'',
                              style: MyTextStyle.customStyle(
                                  fontFamily: 'Lora',fontSize: 12.px,color: textGolden,fontWeight: FontWeight.w400
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 10.px,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(StringConstants.speaks,
                          style: MyTextStyle.customStyle(
                              fontFamily: 'Lora',fontSize: 18.px,color: primary3Color,fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      SizedBox(height: 10.px,),
                      SizedBox(
                        height: 45.px,width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          itemCount: controller.languagelist.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 45.px,
                              padding:  EdgeInsets.symmetric(horizontal: 10.px,vertical: 5.px),
                              margin: const EdgeInsets.only(left: 10,right: 10),
                              decoration: BoxDecoration(
                                  color: primary3Color.withOpacity(0.25),
                                  borderRadius: BorderRadius.circular(100.px),
                                  border: Border.all(
                                      color: Colors.blue.withOpacity(0.6), width: 2.px
                                  )
                              ),
                              child: Center(
                                child: Row(
                                  children: [
                                    CommonWidgets.appImagesView(
                                        imagePath:controller.languagelist[index]['flag']??'',fit: BoxFit.cover,
                                        width: 30.px, height: 30.px,borderRadius: 100.px
                                    ),
                                    SizedBox(width: 5.px,),
                                    Text(
                                      controller.languagelist[index]['name']??'',
                                      style: MyTextStyle.customStyle(color: primary3Color,fontSize: 14.px,fontFamily: 'Lora',fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.px,),
                  /*  Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text("${controller.houseOwnerDetail?.user?.name}'s travel pod",
                    style: MyTextStyle.customStyle(
                        color: labelColor,fontSize: 20.px,fontFamily: 'Lora',fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                SizedBox(height: 10.px,),
                SizedBox(
                  height: 148.px,width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: controller.houseOwnerDetail?.user?.partners?.length??0,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10),
                        child: Container(
                          height: 148.px,width: 96.px,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: primary3Color,
                              borderRadius: BorderRadius.circular(100.px),
                              border: Border.all(
                                  color: textGolden, width: 2.px
                              )
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 5.px),
                                    child: CommonWidgets.imageView(
                                        image:controller.houseOwnerDetail?.user?.partners?[index].imageUrl??'',fit: BoxFit.cover,
                                        width: 42.px, height: 42.px,borderRadius: BorderRadius.circular(100.px)
                                    ),
                                  ),
                                  Positioned(
                                      right: 0.px,bottom: 0.px,
                                      child:CommonWidgets.appImagesView(
                                          imagePath: IconConstants.icBlueTick,height: 18.px,width: 18.px,
                                          fit: BoxFit.fill
                                      )
                                  )
                                ],
                              ),
                              SizedBox(width: 5.px,),
                              Text(
                                controller.houseOwnerDetail?.user?.partners?[index].name??'',
                                style: MyTextStyle.customStyle(color: labelColor,fontSize: 14.px,fontFamily: 'Lora',fontWeight: FontWeight.w600),
                              ),
                              Text(controller.houseOwnerDetail?.user?.partners?[index].relation??'',
                                style: MyTextStyle.customStyle(color: labelColor,fontSize: 12.px,fontFamily: 'Lora',),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20.px,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 5,
                    color: primary3Color,
                    surfaceTintColor: primary3Color,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.px)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(StringConstants.aboutUS,
                                style: MyTextStyle.customStyle(
                                    fontWeight: FontWeight.w600,fontSize: 20.px,color: labelColor,fontFamily: 'Lora'
                                ),
                              ),
                              CommonWidgets.appImagesView(
                                imagePath:IconConstants.icSpeaker,fit: BoxFit.cover,
                                width: 24.px, height: 24.px,
                              ),
                            ],
                          ),
                          SizedBox(height: 10.px,),
                          Text(controller.houseOwnerDetail?.user?.description??"",
                            style: MyTextStyle.customStyle(
                                fontWeight: FontWeight.w600,fontSize: 16.px,color: text2Color,fontFamily: 'Lora'
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.px,),
                Padding(
                  padding:  EdgeInsets.only(left: 12,bottom: 10.px),
                  child: Text(StringConstants.dreamingOf,
                    style: MyTextStyle.customStyle(
                        color: primary3Color,fontSize: 20.px,fontFamily: 'Lora',fontWeight: FontWeight.w600
                    ),
                  ),
                ),*/
                  SizedBox(
                    height: 216.px,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.dreamList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(31.px)
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  decoration:BoxDecoration(
                                    // border: Border.all(
                                    //     color: primary3Color,
                                    //     width: 2.px
                                    // ),
                                      borderRadius: BorderRadius.circular(20.px)
                                  ),
                                  clipBehavior: Clip.hardEdge,
                                  child: CommonWidgets.appImagesView(
                                      imagePath: controller.dreamList[index]['image']??'',
                                      fit: BoxFit.cover,height: 216.px,width: 160.px, borderRadius: 20.px
                                  ),
                                ),
                                Positioned(
                                  bottom: 16.px,left: 25.px,
                                  child: Text(controller.dreamList[index]['place']??'',
                                    style:  MyTextStyle.customStyle(fontWeight: FontWeight.w700, color: primary3Color,fontSize: 16.px,fontFamily: 'Lora'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 24.px,),
                  /* Padding(
                  padding: EdgeInsets.only(left: 10.px,right: 10.px),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(StringConstants.travelQuestion,
                        style: MyTextStyle.customStyle(
                            color: labelColor,fontSize: 20.px,fontFamily: 'Lora',fontWeight: FontWeight.w700
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints(minHeight: 80.px,maxHeight: 120.px),
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.houseOwnerDetail?.user?.spaceQuestionAns?.length,
                            itemBuilder: (context,index){
                              return Stack(
                                children: [
                                  Card(
                                    elevation: 5,
                                    clipBehavior: Clip.hardEdge,
                                    color: primary3Color,
                                    surfaceTintColor: primary3Color,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12.px)
                                    ),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width-100.px,
                                      padding: EdgeInsets.only(left: 40.px,right: 15.px,top: 10,bottom: 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(controller.houseOwnerDetail?.user?.spaceQuestionAns![index].question??"",
                                            maxLines: 2,
                                            style: MyTextStyle.customStyle(
                                                color: labelColor,fontSize: 14.px,fontFamily: 'Lora',fontWeight: FontWeight.w700
                                            ),overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(controller.houseOwnerDetail?.user?.spaceQuestionAns![index].answer??"",
                                            style: MyTextStyle.customStyle(
                                                color:text2Color,fontSize: 12.px,fontFamily: 'Lora',fontWeight: FontWeight.w500
                                            ),overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 16.px,left: 13.px,
                                    child: CommonWidgets.appImagesView(
                                        imagePath: IconConstants.icComma,width: 22.px,height: 18.px,
                                        fit: BoxFit.cover
                                    ),
                                  )
                                ],
                              );
                            }
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20.px,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 10,
                    clipBehavior: Clip.hardEdge,
                    color: primary3Color,
                    surfaceTintColor: primary3Color,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.px),
                        side: BorderSide(color: primary3Color,width: 2.px)
                    ),
                    child: Container(
                      height: 270.px,width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/img_house.png'),fit: BoxFit.cover
                          )
                      ),
                      child:Container(
                        height: 100.px,width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(top: 130.px,left: 10.px,right: 10.px,bottom: 10.px),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.px),
                            color: Colors.white24
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CommonWidgets.appImagesView(
                                imagePath: IconConstants.icHome,height: 25.px,width: 30.px,fit: BoxFit.cover
                            ),
                            SizedBox(height: 5.px,),
                            Text("${controller.houseOwnerDetail?.user?.name}'s  Space",
                              style: MyTextStyle.customStyle(
                                  color:primary3Color,fontSize: 16.px,fontFamily: 'Lora',fontWeight: FontWeight.w500
                              ),
                            ),
                            SizedBox(height: 5.px,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CommonWidgets.appImagesView(
                                    imagePath: IconConstants.icPerson1,
                                    height: 24.px,width: 24.px
                                ),
                                SizedBox(width: 5.px,),
                                Text('3',style: MyTextStyle.titleStyle12bw,),
                                SizedBox(width: 10.px,),
                                CommonWidgets.appImagesView(
                                    imagePath: IconConstants.icBed1,
                                    height: 24.px,width: 24.px
                                ),
                                SizedBox(width: 5.px,),
                                Text('1',style: MyTextStyle.titleStyle12bw,),
                                SizedBox(width: 10.px,),
                                CommonWidgets.appImagesView(
                                    imagePath: IconConstants.icBathTub1,
                                    height: 24.px,width: 24.px
                                ),
                                SizedBox(width: 5.px,),
                                Text('2',style: MyTextStyle.titleStyle12bw,)
                              ],
                            )
                          ],
                        ),
                      ) ,
                    ),
                  ),
                ),
                SizedBox(height: 30.px,)
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.px)
                  ),
                  margin: EdgeInsets.only(left: 70.px,right: 70.px),
                  elevation: 10.px,
                  child: CommonWidgets.commonElevatedButton(
                    onPressed: (){
                      controller.clickOnConnectButton();
                    },

                    child: Text(StringConstants.connect,style: MyTextStyle.customStyle(fontSize: 18,fontWeight: FontWeight.w700,
                        color: textGolden,fontFamily: 'Lora'),),
                    borderRadius: 25.px,
                    buttonColor: primary3Color,
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(left: 10.px),
                  child: CommonWidgets.appImagesView(
                      imagePath: IconConstants.icConnectRobort,width: 50.px,height: 50.px,fit: BoxFit.fill
                  ),
                ),*/
                  SizedBox(height: 50.px,)
                ],
              ),
            ),
          )
            ;
        })
    );
  }
}
