import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:home_swipping/app/data/api_constants/api_key_constants.dart';
import 'package:home_swipping/app/data/api_constants/api_url_constants.dart';
import 'package:home_swipping/app/data/api_models/get_user_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/dateRangeFormate.dart';
import '../../../../common/update_profile_detail.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';
import '../controllers/send_swap_offer_controller.dart';

class SendSwapOfferView extends GetView<SendSwapOfferController> {
  const SendSwapOfferView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: blackColor,
        body: Obx((){
          controller.count.value;
          return ListView(
            padding: EdgeInsets.zero,
            children: [

              SizedBox(
                height: 400.px,width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    CarouselSlider(
                      carouselController:controller.sliderController ,
                      items: List.generate(
                          controller.houseDetails.houseImagesUrls?.length??0,
                              (index) =>Container(
                            child: CommonWidgets.imageView(
                                image: controller.houseDetails.houseImagesUrls?[index]??'',
                                height: 400.px,width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover
                            ),
                          )
                      ),
                      options: CarouselOptions(
                          height: MediaQuery.of(context).size.height,
                          viewportFraction:1.0,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
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
                      bottom: 0.px,left:0.px,right: 0.px,
                      child: CommonWidgets.appImagesView(
                          height:200.px,width: MediaQuery.of(context).size.width,
                          imagePath: ImageConstants.imgBlackBackground,
                          borderRadius: 0.px
                      ),
                    ),
                    Positioned(
                      top: 50.px,left: 10.px,right: 10.px,
                      child: Column(
                        children: [
                          SizedBox(height: 10.px,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Get.back();
                                },
                                child: CommonWidgets.appImagesView(
                                    imagePath: IconConstants.icBack,width: 40.px,height: 40.px)
                              ),
                              Container(
                                height: 40.px,
                                width: 100.px,
                                alignment: Alignment.center,
                                margin: EdgeInsets.symmetric(horizontal: 10.px),
                                decoration: BoxDecoration(
                                  color:greyColor.withOpacity(0.60),
                                  borderRadius: BorderRadius.circular(20.px),
                                  border: Border.all(color: primary3Color.withOpacity(0.2),width: 1.px)
                                ),
                                child:  Text(StringConstants.viewProfile,style:
                                MyTextStyle.customStyle(fontFamily: 'Lora',color:primary3Color,fontSize: 12.px,fontWeight: FontWeight.w500),),

                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 5.px,left: 10.px,right: 10.px,
                      child: Column(
                        children: [

                          Obx((){
                            controller.currentIndex.value;
                            return  DotsIndicator(
                              dotsCount: controller.houseDetails.houseImagesUrls?.length??0,
                              position: controller.currentIndex.value,
                              decorator: DotsDecorator(
                                  color: greyColor, // Inactive color
                                  activeColor: primary3Color,
                                  size: Size(8.px,8.px ),
                                  spacing: EdgeInsets.all(4.px)
                              ),
                            );
                          }),
                          SizedBox(height: 10.px,),
                          Text(StringConstants.confirmTripDetails,
                            style: MyTextStyle.customStyle(
                                fontFamily: "Lora",fontWeight: FontWeight.bold,fontSize: 20,color: primary3Color
                            ),
                          ),
                          SizedBox(height: 20.px,),
                          Align(
                            alignment:Alignment.center,
                            child: Container(
                              height: 40.px,
                              width: 260.px,
                              decoration: BoxDecoration(
                                color:greyColor ,
                                borderRadius: BorderRadius.circular(10.px),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: (){
                                      controller.changeTabIndex(0);
                                    },
                                    child: Container(
                                      height: 40.px,width: 130.px,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color:controller.tabIndex.value==0?primary3Color:transparentColor ,
                                        borderRadius: BorderRadius.circular(10.px),
                                      ),
                                      child: controller.tabIndex.value==0?
                                          CommonWidgets.gradientText(
                                            text:StringConstants.swap,
                                          ):
                                      Text(StringConstants.swap,
                                        style: MyTextStyle.customStyle(fontSize: 14.px,fontFamily: 'lora',fontWeight: FontWeight.bold,
                                            color:primary3Color
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      controller.changeTabIndex(1);
                                    },
                                    child: Container(
                                      height: 40.px,width: 130.px,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color:controller.tabIndex.value==1?primary3Color:transparentColor ,
                                        borderRadius: BorderRadius.circular(10.px),
                                      ),
                                      child: controller.tabIndex.value==1?
                                      CommonWidgets.gradientText(
                                        text:StringConstants.stay,
                                      ):
                                      Text(StringConstants.stay,
                                        style: MyTextStyle.customStyle(fontSize: 14.px,fontFamily: 'lora',fontWeight: FontWeight.bold,
                                            color:primary3Color
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20.px,),

                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50.px,
                    margin: EdgeInsets.only(left: 10.px,right: 10.px),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CommonWidgets.appImagesView(
                              imagePath: IconConstants.icCalender,height: 25.px,
                              width: 25.px,color: primary3Color),
                            SizedBox(width: 10.px,),
                            Text(controller.startDate.isNotEmpty?DateRangeFormat.formatDateRange(controller.startDate,controller.endDate):'',
                              style: MyTextStyle.customStyle(fontSize: 18.px,fontFamily: 'Buenard',fontWeight: FontWeight.w700,
                                  color: primary3Color
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: (){
                            controller.clickOnEditButton();
                          },
                          child: Container(
                            height: 35.px,width: 90.px,
                            decoration: BoxDecoration(
                              color:blackColor ,
                              borderRadius: BorderRadius.circular(10.px),
                              border: Border.all(color: primary3Color.withOpacity(0.3))
                            ),
                            child: Center(
                              child: Text(
                                StringConstants.edit,style: MyTextStyle.titleStyle12bw,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5.px,),
                  Divider(thickness: 1.px,color: primary3Color.withOpacity(0.2),),

                  SizedBox(height: 5.px,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text('Travellers',
                      style: MyTextStyle.customStyle(
                          color: primary3Color,fontSize: 20.px,fontFamily: 'Lora',fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  if(UpdateProfileDetails.getUserModel!=null && UpdateProfileDetails.getUserModel!.user!=null&&
                      UpdateProfileDetails.getUserModel!.user!.partners!=null)
                  Container(
                    height: 60.px,
                    margin: EdgeInsets.only(top: 15.px,bottom: 15.px,
                    left: 10.px,right: 10.px),
                    padding: EdgeInsets.symmetric(horizontal: 15.px),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color:primary3Color.withOpacity(0.20),
                        borderRadius: BorderRadius.circular(30.px),
                        border: Border.all(color: primary3Color.withOpacity(0.25),width: 1.px)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Wrap(
                          direction: Axis.horizontal,
                          spacing: -12.0, // Negative spacing for overlap
                          children: UpdateProfileDetails.getUserModel!.user!.partners!.map((travellingPartners) {
                            return Container(
                              height: 31.px,width: 31.px,
                              decoration: BoxDecoration(
                                  border: Border.all(color: primary3Color,width: 1.5.px),
                                  borderRadius: BorderRadius.circular(16.px)
                              ),
                              child: CommonWidgets.imageView(
                                  image: travellingPartners.imageUrl??'',
                                  borderRadius: BorderRadius.circular(15.px)
                              ),
                            );
                          }).toList(),
                        ),
                        Container(
                          height: 35.px,width:80.px,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color:Colors.black,
                              borderRadius: BorderRadius.circular(10.px),
                          ),
                          child: Text(
                            StringConstants.edit,style: MyTextStyle.titleStyle12bw,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10.px,),
                  Padding(
                    padding:  EdgeInsets.only(left: 10,bottom: 10.px),
                    child: Text(StringConstants.sendAPersonalNote,
                      style: MyTextStyle.customStyle(
                          color: primary3Color,fontSize: 20.px,fontFamily: 'Lora',fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5.px),
                    margin: EdgeInsets.only(left: 10.px,right: 10.px),
                    decoration: BoxDecoration(
                        color: blackColor,
                        borderRadius: BorderRadius.circular(10.px),
                        border: Border.all(color: controller.isAboutMe.value?primary3Color:textGrey,width: 2.px)
                    ),
                    child: Stack(
                      children: [
                        CommonWidgets.commonTextFieldForLoginSignUP(
                          focusNode: controller.focusNodeAboutMe,
                            hintText:'Hi traveler, tell "James" the reason for your trip and any other information you want to share whether about yourself or questions if you’re curious about their home.',
                            controller: controller.aboutMeController,
                           // autofocus: false,
                            isCard: true,
                            maxLines: 5,
                            contentPadding: EdgeInsets.zero,
                            keyboardType: TextInputType.multiline,
                            style: MyTextStyle.customStyle(fontWeight: FontWeight.w600,fontFamily: 'Buenard',fontSize: 16,color: primary3Color),
                            hintStyle: MyTextStyle.customStyle(fontWeight: FontWeight.w400,fontFamily: 'Buenard',fontSize: 16,color: textGrey),

                           onChanged: (value){
                              controller.increment();
                           }
                        ),

                        // Positioned(
                        //   top: 5.px,right: 5.px,
                        //   child: GestureDetector(
                        //     onTap: (){
                        //       FocusManager.instance.primaryFocus?.unfocus();
                        //     },
                        //     child: Container(
                        //       height: 25.px,width: 25.px,
                        //         decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(15.px),
                        //           color: greyColor
                        //         ),
                        //         child: Icon(Icons.close,size: 20.px,color: primary3Color,)),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                  /*Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.px)
                    ),
                    color: primary3Color,
                    elevation: 3.px,
                    margin: EdgeInsets.all(10.px),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.px,vertical: 15.px),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(StringConstants.yourProfile,
                            style: MyTextStyle.customStyle(
                                color: labelColor,fontSize: 16.px,fontFamily: 'Lora',fontWeight: FontWeight.w600
                            ),
                          ),
                          SizedBox(height: 5.px,),
                          Row(
                            children: [
                              CommonWidgets.imageView(
                                  image: UpdateProfileDetails.getUserModel?.user?.profileimage??ApiUrlConstants.defaultUserProfile,
                                height: 62.px,width: 62.px,borderRadius: BorderRadius.circular(31.px),
                                defaultNetworkImage: ApiUrlConstants.defaultUserProfile
                              ),
                              SizedBox(width: 10.px,),
                              Text(UpdateProfileDetails.getUserModel?.user?.name??'',
                                style: MyTextStyle.customStyle(
                                    color: text2Color,fontSize: 20.px,fontFamily: 'Lora',fontWeight: FontWeight.w700
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.px,),
                          Text(UpdateProfileDetails.getUserModel?.user?.description??'',
                            style: MyTextStyle.customStyle(
                                color: text2Color,fontSize: 12.px,fontFamily: 'Lora',fontWeight: FontWeight.w500
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10.px,),*/
                  SizedBox(height: 20.px,),
                  if(controller.aboutMeController.text.isNotEmpty)
                    Align(
                      alignment: Alignment.center,
                      child: CommonWidgets.gradientButton(
                        wantContentSizeButton: true,
                        width: 240.px,
                        height: 48.px,
                        onPressed: (){
                          controller.clickOnSendOfferButton(context);
                        },
                        text: StringConstants.sendOffer,

                      ),
                    ),
                  SizedBox(height: 30.px,),
                  Center(
                    child: Text('48 hours to cancel',style: MyTextStyle.customStyle(fontSize: 18,fontWeight: FontWeight.w700,
                        color: const Color(0xFFFAAAAA),fontFamily: 'Lora'),),
                  ),
                  SizedBox(height: 50.px,),
                ],
              ),
            ],
          );
        })
    );
  }
}
