import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:home_swipping/app/data/constants/image_constants.dart';
import 'package:home_swipping/common/update_house_details.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/update_profile_detail.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/edit_my_profile_controller.dart';

class EditMyProfileView extends GetView<EditMyProfileController> {
  const EditMyProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primary3Color,
        body: Obx((){
          controller.count.value;
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,//height: MediaQuery.of(context).size.height/2,
                      height: 320.px,
                      child: CommonWidgets.appImagesView(
                        imagePath:ImageConstants.imgTravellingPlace,fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                        height: 320.px,
                      ),
                    ),
                    Positioned(
                        top: 30.px,left: 5.px,right: 10.px,
                        child: ListTile(
                          leading: GestureDetector(
                            onTap:(){
                              Get.back();
                            },
                            child: Container(
                              height: 35.px,
                              width: 35.px,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.px),
                                color: text2Color,
                              ),
                              child: Icon(Icons.arrow_back_ios_new_outlined,size: 25.px,color: primary3Color,),
                            ),
                          ),
                          title: Center(
                            child: Text(StringConstants.travelerProfile,
                              style: MyTextStyle.customStyle(color: primary3Color,fontSize: 16.px,fontFamily: 'Lora',fontWeight: FontWeight.w700),
                            ),
                          ),
                        )
                    ),

                    Positioned(
                      bottom: 0.px,
                      child: Container(
                        height: 105.px,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(15.px),topRight: Radius.circular(15.px)),
                            color: primary3Color.withOpacity(0.3)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 5.px,),
                            Text(UpdateProfileDetails.getUserModel?.user?.name??'',
                              style: MyTextStyle.customStyle(
                                  fontFamily: 'Lora',fontSize: 20.px,color: primary3Color,fontWeight: FontWeight.w700
                              ),
                            ),
                            SizedBox(height: 5.px,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Icon(Icons.location_pin,size: 20.px,color: primary3Color,),
                                SizedBox(width: 3.px,),
                                Text(UpdateProfileDetails.getUserModel?.user?.country??'',
                                  style: MyTextStyle.customStyle(
                                      fontFamily: 'Lora',fontSize: 12.px,color: primary3Color,fontWeight: FontWeight.w400
                                  ),
                                ),

                              ],
                            ),
                            SizedBox(height: 10.px,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CommonWidgets.appImagesView(
                                  imagePath: IconConstants.icFacebook,height: 25.px,width: 25.px,),
                                SizedBox(width: 10.px,),
                                CommonWidgets.appImagesView(
                                  imagePath: IconConstants.icTwitter,height: 25.px,width: 25.px,),
                                SizedBox(width: 10.px,),
                                CommonWidgets.appImagesView(
                                  imagePath: IconConstants.icCircleInstagram,height: 25.px,width: 25.px,),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        top: 80.px,
                        child: Stack(
                          fit:StackFit.passthrough ,
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 100.px,width: 100.px,
                              padding: EdgeInsets.all(5.px),
                              margin: EdgeInsets.all(10.px),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.px),
                                  color: primary3Color
                              ),
                              child: CommonWidgets.imageView(
                                  image:UpdateProfileDetails.getUserModel?.user?.profileimage??'',
                                  width: 90.px,
                                  height: 90.px,
                                  borderRadius: BorderRadius.circular(45.px)
                              ),
                            ),
                            Positioned(
                                bottom: 35.px,right: 0.px,
                                child: Container(
                                  height: 35.px,width: 35.px,
                                  padding: EdgeInsets.all(5.px),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18.px),
                                      color: primary3Color
                                  ),
                                  child: CommonWidgets.appImagesView(
                                      imagePath:IconConstants.icSheild,
                                      width: 25.px,
                                      height: 25.px,
                                      borderRadius: 13.px
                                  ),
                                )
                            ),
                            Positioned(
                                bottom: 0.px,
                                child: Container(
                                  height: 30.px,width: 90.px,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.px),
                                      color: primary3Color
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CommonWidgets.appImagesView(
                                          imagePath:IconConstants.icCamera,
                                          width: 25.px,
                                          height: 25.px,
                                          borderRadius: 15.px
                                      ),
                                      SizedBox(width: 5.px,),
                                      Text(StringConstants.edit,
                                        style: MyTextStyle.customStyle(
                                            fontFamily: 'Lora',fontSize: 14.px,color: textGolden,fontWeight: FontWeight.w700
                                        ),
                                      )
                                    ],
                                  ),
                                )
                            ),
                          ],
                        )
                    ),
                  ],
                ),
                SizedBox(height: 20.px,),
                Padding(
                  padding:  EdgeInsets.only(left: 10.px,right: 10.px),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${UpdateProfileDetails.getUserModel?.user?.name}'s travel pod",
                        style: MyTextStyle.customStyle(
                            color: labelColor,fontSize: 20.px,fontFamily: 'Buenard',fontWeight: FontWeight.w600
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          controller.clickOnAboutPodButton();
                        },
                        child: CommonWidgets.appImagesView(
                            imagePath: IconConstants.icEdit,
                            height: 30.px,width: 30.px,
                            borderRadius: 15.px
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10.px,),
                SizedBox(
                  height: 148.px,width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: UpdateProfileDetails.getUserModel?.user?.partners?.length??0,
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
                                        image:UpdateProfileDetails.getUserModel?.user?.partners?[index].imageUrl??'',fit: BoxFit.cover,
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
                                UpdateProfileDetails.getUserModel?.user?.partners?[index].name??'',
                                style: MyTextStyle.customStyle(color: labelColor,fontSize: 14.px,fontFamily: 'Lora',fontWeight: FontWeight.w600),
                              ),
                              Text(UpdateProfileDetails.getUserModel?.user?.partners?[index].relation??'',
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
                              GestureDetector(
                                onTap: (){
                                  controller.clickOnAboutEditButton();
                                },
                                child: CommonWidgets.appImagesView(
                                    imagePath: IconConstants.icEdit,
                                    height: 30.px,width: 30.px,
                                    borderRadius: 15.px
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10.px,),
                          Text(UpdateProfileDetails.getUserModel!.user?.description??"",
                            style: MyTextStyle.customStyle(
                                fontWeight: FontWeight.w600,fontSize: 16.px,color: text2Color,fontFamily: 'Lora'
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.px,),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.px,vertical: 0.px),
                  horizontalTitleGap: 5.px,
                  leading:  CommonWidgets.appImagesView(
                      imagePath: IconConstants.icWork,height: 40.px,width: 40.px
                  ),
                  title: Text(StringConstants.work,style: MyTextStyle.customStyle(fontFamily: 'Lora',fontWeight: FontWeight.w500,fontSize: 14,
                      color:const Color(0xFF878787)),),
                  subtitle: Text('Creative Director - Digital Nomad',style: MyTextStyle.customStyle(fontFamily: 'Lora',fontWeight: FontWeight.w600,fontSize: 14,
                      color:const Color(0xFF606060)),),
                  trailing: GestureDetector(
                    onTap: (){
                      controller.clickOnLanguageEditButton();
                    },
                    child: CommonWidgets.appImagesView(
                        imagePath: IconConstants.icEdit,
                        height: 30.px,width: 30.px,
                        borderRadius: 15.px
                    ),
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.px,vertical: 0.px),
                  horizontalTitleGap: 5.px,
                  leading:  CommonWidgets.appImagesView(
                      imagePath: IconConstants.icSpeaks,height: 40.px,width: 40.px
                  ),
                  title: Text(StringConstants.speaks,style: MyTextStyle.customStyle(fontFamily: 'Lora',fontWeight: FontWeight.w500,fontSize: 14,
                      color:const Color(0xFF878787)),),
                  subtitle: Text(UpdateProfileDetails.getUserModel!.user?.languages.toString()??'',style: MyTextStyle.customStyle(fontFamily: 'Lora',fontWeight: FontWeight.w600,fontSize: 14,
                      color:const Color(0xFF606060)),),
                ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.px,vertical: 0.px),
                  horizontalTitleGap: 5.px,
                  leading:  CommonWidgets.appImagesView(
                      imagePath: IconConstants.icMember,height: 40.px,width: 40.px
                  ),
                  title: Text(StringConstants.member,style: MyTextStyle.customStyle(fontFamily: 'Lora',fontWeight: FontWeight.w500,fontSize: 14,
                      color:const Color(0xFF878787)),),
                  subtitle: Text('Since 2023',style: MyTextStyle.customStyle(fontFamily: 'Lora',fontWeight: FontWeight.w600,fontSize: 14,
                      color:const Color(0xFF606060)),),
                ),

                SizedBox(height: 20.px,),
                Padding(
                  padding:  EdgeInsets.only(left: 10.px,right: 10.px),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(StringConstants.dreamDestinations,
                        style: MyTextStyle.customStyle(
                            color: labelColor,fontSize: 20.px,fontFamily: 'Buenard',fontWeight: FontWeight.w700
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          controller.clickOnDreamEditButton();
                        },
                        child: CommonWidgets.appImagesView(
                            imagePath: IconConstants.icEdit,
                            height: 30.px,width: 30.px,
                            borderRadius: 15.px
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 160.px,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.dreamList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.px)
                          ),
                          child: Stack(
                            children: [
                              Container(
                                decoration:BoxDecoration(
                                    border: Border.all(
                                        color: primary3Color,
                                        width: 2.px
                                    ),
                                    borderRadius: BorderRadius.circular(15.px)
                                ),
                                clipBehavior: Clip.hardEdge,
                                child: CommonWidgets.appImagesView(
                                    imagePath: controller.dreamList[index]['image']??'',
                                    fit: BoxFit.cover,height: 150.px,width: 170.px, borderRadius: 15.px
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
                SizedBox(height: 20.px,),
                Padding(
                  padding:  EdgeInsets.only(left: 10.px,right: 10.px),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(StringConstants.favoriteDestinations,
                        style: MyTextStyle.customStyle(
                            color: labelColor,fontSize: 20.px,fontFamily: 'Buenard',fontWeight: FontWeight.w700
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          controller.clickOnFavoriteEditButton();
                        },
                        child: CommonWidgets.appImagesView(
                            imagePath: IconConstants.icEdit,
                            height: 30.px,width: 30.px,
                            borderRadius: 15.px
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 160.px,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.favoritesList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.px)
                          ),
                          child: Stack(
                            children: [
                              Container(
                                decoration:BoxDecoration(
                                    border: Border.all(
                                        color: primary3Color,
                                        width: 2.px
                                    ),
                                    borderRadius: BorderRadius.circular(15.px)
                                ),
                                clipBehavior: Clip.hardEdge,
                                child: CommonWidgets.appImagesView(
                                    imagePath: controller.favoritesList[index]['image']??'',
                                    fit: BoxFit.cover,height: 150.px,width: 170.px, borderRadius: 15.px
                                ),
                              ),
                              Positioned(
                                bottom: 16.px,left: 25.px,
                                child: Text(controller.favoritesList[index]['place']??'',
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(StringConstants.whenITravelILove,
                            style: MyTextStyle.customStyle(
                                color: labelColor,fontSize: 20.px,fontFamily: 'Lora',fontWeight: FontWeight.w700
                            ),
                          ),

                          GestureDetector(
                            onTap: (){
                              controller.clickOnTravelInterestButton();
                            },
                            child: CommonWidgets.appImagesView(
                                imagePath: IconConstants.icEdit,
                                height: 30.px,width: 30.px,
                                borderRadius: 15.px
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20.px,),
                      SizedBox(
                        height: 150.px,
                        child: GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 10.px,
                                crossAxisSpacing: 10.px,
                                childAspectRatio: 35/100
                            ),
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount:controller.travelInterest.length,
                            itemBuilder: (context,index){
                              return Container(
                                height: 35.px,
                                padding: EdgeInsets.symmetric(horizontal: 10.px,vertical: 10.px),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.px),
                                    border: Border.all(color: textGolden,width: 2.px)
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [

                                    Icon(Icons.airplanemode_on,size: 20.px,color: textGolden,),
                                    SizedBox(width: 5.px,),
                                    Expanded(
                                      child: Text(controller.travelInterest[index],
                                        style: MyTextStyle.customStyle(
                                            color:textGolden,fontSize: 14.px,fontFamily: 'Lora',fontWeight: FontWeight.w700
                                        ),overflow: TextOverflow.ellipsis,
                                      ),
                                    ),

                                  ],
                                ),
                              );
                            }
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 24.px,),
                Padding(
                  padding: EdgeInsets.only(left: 10.px,right: 10.px),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(StringConstants.travelQuestion,
                            style: MyTextStyle.customStyle(
                                color: labelColor,fontSize: 20.px,fontFamily: 'Lora',fontWeight: FontWeight.w700
                            ),
                          ),

                          GestureDetector(
                            onTap: (){
                              controller.clickOnTravelQuestionButton();
                            },
                            child: CommonWidgets.appImagesView(
                                imagePath: IconConstants.icEdit,
                                height: 30.px,width: 30.px,
                                borderRadius: 15.px
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 150.px,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: UpdateProfileDetails.getUserModel!.user?.spaceQuestionAns?.length,
                            itemBuilder: (context,index){
                              return Card(
                                elevation: 5,
                                clipBehavior: Clip.hardEdge,
                                color: primary3Color,
                                surfaceTintColor: primary3Color,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.px)
                                ),
                                child: Container(
                                  height: 150.px,width: 300.px,
                                  padding: EdgeInsets.all(15.px),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CommonWidgets.appImagesView(
                                          imagePath: IconConstants.icComma,width: 22.px,height: 18.px,
                                          fit: BoxFit.cover
                                      ),
                                      SizedBox(height: 10.px,),
                                      Text(UpdateProfileDetails.getUserModel!.user?.spaceQuestionAns?[index].question??"",
                                        maxLines: 2,
                                        style: MyTextStyle.customStyle(
                                            color: labelColor,fontSize: 14.px,fontFamily: 'Lora',fontWeight: FontWeight.w700
                                        ),overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 10.px,),
                                      Text(UpdateProfileDetails.getUserModel!.user?.spaceQuestionAns?[index].answer??"",
                                        style: MyTextStyle.customStyle(
                                            color:text2Color,fontSize: 12.px,fontFamily: 'Lora',fontWeight: FontWeight.w500
                                        ),overflow: TextOverflow.ellipsis,
                                      ),

                                    ],
                                  ),
                                ),
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
                    elevation: 5,
                    clipBehavior: Clip.hardEdge,
                    color: primary3Color,
                    surfaceTintColor: primary3Color,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.px)
                    ),
                    child: Container(
                      height: 270.px,width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
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
                            Text("${UpdateProfileDetails.getUserModel!.user?.name}'s  Space",
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
                                Text(UpdateHouseDetails.myHouseModel!.houseDetails?.moreAboutSpace?.guests.toString()??'0',style: MyTextStyle.titleStyle12bw,),
                                SizedBox(width: 10.px,),
                                CommonWidgets.appImagesView(
                                    imagePath: IconConstants.icBed1,
                                    height: 24.px,width: 24.px
                                ),
                                SizedBox(width: 5.px,),
                                Text(UpdateHouseDetails.myHouseModel!.houseDetails?.moreAboutSpace?.bed.toString()??'0',style: MyTextStyle.titleStyle12bw,),
                                SizedBox(width: 10.px,),
                                CommonWidgets.appImagesView(
                                    imagePath: IconConstants.icBathTub1,
                                    height: 24.px,width: 24.px
                                ),
                                SizedBox(width: 5.px,),
                                Text(UpdateHouseDetails.myHouseModel!.houseDetails?.moreAboutSpace?.bathrooms.toString()??'0',style: MyTextStyle.titleStyle12bw,)
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
                  ),
                  child: Center(
                    child: Text(StringConstants.shareWithFriends,
                      style: MyTextStyle.customStyle(color:const  Color(0xFFB7B8BE),fontSize: 16.px,fontFamily: 'Lora',fontWeight: FontWeight.w700),),
                  ),
                ),

                SizedBox(height: 10.px,)
              ],
            ),
          );
        })
    );
  }
}
