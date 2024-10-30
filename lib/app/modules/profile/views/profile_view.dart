import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:home_swipping/app/data/constants/icons_constant.dart';
import 'package:home_swipping/app/data/constants/string_constants.dart';
import 'package:home_swipping/common/MyTextStyle.dart';
import 'package:home_swipping/common/common_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../common/colors.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,//height: MediaQuery.of(context).size.height/2,
                  height: 500.px,
                  child: CommonWidgets.appImagesView(
                      imagePath:'assets/icons/traveller1.png',fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    height: 500.px,
                  ),
                ),
                Positioned(
                  top: 30.px,
                  child: Padding(
                    padding:  EdgeInsets.only(top: 10.px,left: 10.px,right: 10.px,),
                    child: GestureDetector(
                      onTap:(){
                        Get.back();
                      },
                      child: Container(
                        height: 30.px,
                        width: 30.px,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.px),
                          color: text2Color,
                        ),
                        child: Icon(Icons.arrow_back_ios_new_outlined,size: 20.px,color: primary3Color,),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10.px,
                  child: Container(
                    //margin: EdgeInsets.only(left: 10.px,right: 10.px),
                    height: 45.px,width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        itemCount: controller.favoriteThingsList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 10,right: 0),
                            child: Container(
                              height: 45.px,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: primary3Color,
                                borderRadius: BorderRadius.circular(100.px),
                                border: Border.all(
                                  color: textGolden, width: 2.px
                                )
                              ),
                              child: Center(
                                child: Text(
                                  controller.favoriteThingsList[index]['name']??'',
                                  style: MyTextStyle.customStyle(color: textGolden,fontSize: 15.px,fontFamily: 'Lora'),
                                ),
                              ),
                            ),
                          );
                        },
                    ),
                  ),
                ),
                Positioned(
                  bottom: 75.px,left: 10,right: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('. solo',
                            style: MyTextStyle.customStyle(
                              fontFamily: 'Lora',fontSize: 20.px,color: primary3Color,fontWeight: FontWeight.w700
                            ),
                          ),
                          Row(
                            children: [
                              Text('James',
                                style: MyTextStyle.customStyle(
                                  fontFamily: 'Lora',fontSize: 36.px,color: primary3Color,fontWeight: FontWeight.w800
                                ),
                              ),
                              SizedBox(width: 3.px,),
                              CommonWidgets.appImagesView(
                                  imagePath: IconConstants.icBlueTick,height: 23.px,width: 23.px,
                                fit: BoxFit.cover
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.location_pin,size: 20.px,color: primary3Color,),
                              SizedBox(width: 5.px,),
                              Text('New York',
                                style: MyTextStyle.customStyle(
                                  fontFamily: 'Lora',fontSize: 20.px,color: primary3Color,fontWeight: FontWeight.w700
                                ),
                              ),
                              SizedBox(width: 12.px,),
                              CommonWidgets.appImagesView(
                                  imagePath: IconConstants.icInstagram,height: 15.px,width: 15.px,
                                  fit: BoxFit.cover
                              ),
                              SizedBox(width: 5.px,),
                              Text('handle',
                                style: MyTextStyle.customStyle(
                                  fontFamily: 'Lora',fontSize: 20.px,color: primary3Color,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      CommonWidgets.appImagesView(
                          imagePath: IconConstants.icPlay,height: 75.px,width: 78.px,
                          fit: BoxFit.cover
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 20.px,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(StringConstants.speaks,
                    style: MyTextStyle.customStyle(
                      fontFamily: 'Lora',fontSize: 14.px,color: labelColor,fontWeight: FontWeight.w600
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
                      return Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10),
                        child: Container(
                          height: 45.px,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: primary3Color,
                              borderRadius: BorderRadius.circular(100.px),
                              border: Border.all(
                                  color: textGolden, width: 2.px
                              )
                          ),
                          child: Center(
                            child: Row(
                              children: [
                                CommonWidgets.appImagesView(
                                    imagePath:controller.languagelist[index]['icFlag']??'',fit: BoxFit.cover,
                                    width: 30.px, height: 30.px,borderRadius: 100.px
                                ),
                                SizedBox(width: 5.px,),
                                Text(
                                  controller.languagelist[index]['language']??'',
                                  style: MyTextStyle.customStyle(color: text2Color,fontSize: 14.px,fontFamily: 'Lora',fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.px),
            Container(
              padding: EdgeInsets.only(left: 10.px),
              child: Row(
                children: [
                  CommonWidgets.appImagesView(
                      imagePath:IconConstants.icMember,fit: BoxFit.cover,
                      width: 40.px, height: 40.px,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        StringConstants.member,
                        style: MyTextStyle.customStyle(color: text2Color,fontSize: 12.px,fontFamily: 'Lora'),
                      ),
                      Text(
                        'Since 2023',
                        style: MyTextStyle.customStyle(color: text2Color,fontSize: 14.px,fontFamily: 'Lora',fontWeight: FontWeight.w600),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 20.px,),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text("james's travel pod",
                style: MyTextStyle.customStyle(
                    color: labelColor,fontSize: 20.px,fontFamily: 'Lora',fontWeight: FontWeight.w600
                ),
              ),
            ),
            SizedBox(height: 10.px,),
            SizedBox(
              height: 148.px,width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: controller.travellerList.length,
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
                          CommonWidgets.appImagesView(
                              imagePath:controller.travellerList[index]['image']??'',fit: BoxFit.cover,
                              width: 42.px, height: 42.px,borderRadius: 100.px
                          ),
                          SizedBox(width: 5.px,),
                          Text(
                            controller.travellerList[index]['name']??'',
                            style: MyTextStyle.customStyle(color: labelColor,fontSize: 14.px,fontFamily: 'Lora',fontWeight: FontWeight.w600),
                          ),
                          Text(
                            controller.travellerList[index]['profile']??'',
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
                      Text("I live in New York. I like travelling, discover new culture and traditions, taste new food. I love meeting my guests and sharing my local...",
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
              padding: const EdgeInsets.only(left: 12),
              child: Text(StringConstants.dreamingOf,
                style: MyTextStyle.customStyle(
                    color: labelColor,fontSize: 20.px,fontFamily: 'Lora',fontWeight: FontWeight.w600
                ),
              ),
            ),
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
                              border: Border.all(
                                color: primary3Color,
                                width: 2.px
                              ),
                              borderRadius: BorderRadius.circular(31.px)
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: CommonWidgets.appImagesView(
                                imagePath: controller.dreamList[index]['image']??'',
                                fit: BoxFit.cover,height: 216.px,width: 160.px, borderRadius: 31.px
                            ),
                          ),
                          Positioned(
                            bottom: 16.px,left: 25.px,
                            child: Text(controller.dreamList[index]['place']??'',
                              style:  MyTextStyle.customStyle(fontWeight: FontWeight.w700, color: primary3Color,fontSize: 14.px,fontFamily: 'Lora'),
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
            Padding(
                padding: EdgeInsets.only(left: 10.px,right: 10.px),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(StringConstants.travelQuestion,
                    style: MyTextStyle.customStyle(
                        color: labelColor,fontSize: 20.px,fontFamily: 'Lora',fontWeight: FontWeight.w700
                    ),
                  ),
                  Stack(
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
                          padding: EdgeInsets.only(left: 40.px,right: 15.px,top: 10,bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("What makes you feel home in your city?",
                                style: MyTextStyle.customStyle(
                                    color: labelColor,fontSize: 14.px,fontFamily: 'Lora',fontWeight: FontWeight.w700
                                ),
                              ),
                              Text("The users favorite thing to do in their home they think someone else in their space would enjoy",
                                style: MyTextStyle.customStyle(
                                    color:text2Color,fontSize: 12.px,fontFamily: 'Lora',fontWeight: FontWeight.w500
                                ),
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
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.px,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 5,
                clipBehavior: Clip.hardEdge,
                color: primary3Color,
                surfaceTintColor: primary3Color,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.px)
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
                    margin: EdgeInsets.only(top: 130.px,left: 8.px,right: 8.px,bottom: 8.px),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.px),
                      color: Colors.white12
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CommonWidgets.appImagesView(
                            imagePath: IconConstants.icHome,height: 25.px,width: 30.px,fit: BoxFit.cover
                        ),
                        SizedBox(height: 5.px,),
                        Text("Jacob's  Space",
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
                            Text('4',style: MyTextStyle.titleStyle12bw,),
                            SizedBox(width: 10.px,),
                            CommonWidgets.appImagesView(
                                imagePath: IconConstants.icBed1,
                                height: 24.px,width: 24.px
                            ),
                            SizedBox(width: 5.px,),
                            Text('2',style: MyTextStyle.titleStyle12bw,),
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
            SizedBox(height: 10.px,),
            Container(
              margin: EdgeInsets.only(left: 15.px,right: 15.px,bottom: 15.px),
              height: 50.px,width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.px),
                  color: primary3Color,
                border: Border.all(color: text2Color)
              ),
              child: Center(
                child: Text(StringConstants.connect,
                  style: MyTextStyle.customStyle(color: labelColor,fontSize: 16.px,fontFamily: 'Lora'),),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 10.px),
              child: CommonWidgets.appImagesView(
                  imagePath: IconConstants.icAry,width: 50.px,height: 50.px,fit: BoxFit.cover
              ),
            ),
            SizedBox(height: 10.px,)
          ],
        ),
      )
    );
  }
}
