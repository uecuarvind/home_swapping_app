import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:home_swipping/app/data/constants/icons_constant.dart';
import 'package:home_swipping/app/data/constants/image_constants.dart';
import 'package:home_swipping/app/data/constants/string_constants.dart';
import 'package:home_swipping/common/MyTextStyle.dart';
import 'package:home_swipping/common/colors.dart';
import 'package:home_swipping/common/common_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/credits_controller.dart';

class CreditsView extends GetView<CreditsController> {
  const CreditsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: blackColor,
      body:Obx((){
        controller.count.value;
        return  Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImageConstants.imgExploreBackground),
                  fit: BoxFit.fill
              )
          ),
          child: SafeArea(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15.px),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Container(
                   padding: EdgeInsets.only(top: 0.px,bottom: 10.px,right: 10.px),

                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           GestureDetector(
                             onTap:(){
                               Get.back();
                             },
                             child: CommonWidgets.appImagesView(imagePath: IconConstants.icBack,
                             height: 30.px,width: 30.px),
                           ),
                           SizedBox(width: 8.px,),
                           CommonWidgets.appImagesView(
                               imagePath: ImageConstants.imgTravelingPhoto1,
                             height: 40.px,width: 40.px,
                             borderRadius: 20.px
                           ),
                           SizedBox(width: 5.px,),
                           Text('John Deo',style: MyTextStyle.customStyle(fontWeight: FontWeight.w700,fontSize: 24,fontFamily: 'Lora',
                           color:primary3Color),)
                         ],
                       ),
                      
                     ],
                   ),
                 ),
                  SizedBox(height: 20.px,),
                  Container(
                    padding: EdgeInsets.all(10.px),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: primary3Color.withOpacity(0.15),
                        border: Border.all(color: primary3Color.withOpacity(0.1))
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(top: 10.px),
                          child: CommonWidgets.appImagesView(
                              imagePath: ImageConstants.imgTicket,
                            height: 45.px,width: 60.px
                          ),
                        ),
                        Column(
                          children: [
                            Text(StringConstants.total,style: MyTextStyle.titleStyle20w,),
                            Text('18',style: MyTextStyle.customStyle(fontWeight: FontWeight.w700,fontSize: 30,fontFamily: 'Lora',
                                color:primary3Color),)
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20.px,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Credit History',style: MyTextStyle.customStyle(fontWeight: FontWeight.w700,fontSize: 24,fontFamily: 'Lora',
                          color:primary3Color),),
                      Text('Members earn 1 per night hosted',style: MyTextStyle.customStyle(fontWeight: FontWeight.w400,fontSize: 16,fontFamily: 'Lora',
                          color:primary3Color),),
            
                    ],
                  ),
                  SizedBox(height: 20.px,),
                  Expanded(child: showCreditList())
                ],
              ),
            ),
          ),
        );
      })
    );
  }

  Widget showCreditList(){
    return ListView.builder(
      itemCount: 5,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemBuilder: (context,index){
          return Container(
            margin: EdgeInsets.symmetric(vertical: 8.px),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: primary3Color.withOpacity(0.15),
                border: Border.all(color: primary3Color.withOpacity(0.1))
            ),
            child: ListTile(
             contentPadding: EdgeInsets.symmetric(horizontal: 15.px,vertical: 10.px),
              title:Text('Welcome Home ',style: MyTextStyle.customStyle(fontWeight: FontWeight.w700,fontSize: 18,fontFamily: 'Lora',
                  color:primary3Color),) ,
              subtitle: Text('29 Sep 2024',style: MyTextStyle.titleStyle14w,),
              trailing:Text('7 credits',style: MyTextStyle.customStyle(fontWeight: FontWeight.w700,fontSize: 16,fontFamily: 'Lora',
                  color:primary3Color),) ,
            ),
          );
        });
  }
}
