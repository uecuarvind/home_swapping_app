import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:home_swipping/app/data/constants/icons_constant.dart';
import 'package:home_swipping/app/data/constants/string_constants.dart';
import 'package:home_swipping/common/colors.dart';
import 'package:home_swipping/common/common_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../controllers/edit_my_space_basic_controller.dart';

class EditMySpaceBasicView extends GetView<EditMySpaceBasicController> {
  const EditMySpaceBasicView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CommonWidgets.appBarView(title: StringConstants.editSpace),
      body: Obx((){
        controller.count.value;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.px,),
            Padding(
              padding: EdgeInsets.only(left: 15.px),
              child: Text(StringConstants.spaceBasics,
                style: MyTextStyle.customStyle(
                    fontFamily: "Lora",fontWeight: FontWeight.w700,fontSize: 30,color: textGolden
                ),

              ),
            ),
            SizedBox(height: 50.px,),
            Divider(
              thickness: 1.px,color: textGrey,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15.px,vertical: 8.px),
              child: Row(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(right: 10.px),
                    child: CommonWidgets.appImagesView(
                        imagePath: IconConstants.icCardPersions,
                        height: 36.px,width: 36.px
                    ),
                  ),
                  Expanded(child: Text(StringConstants.guests, style: MyTextStyle.customStyle(
                      fontFamily: "Lora",fontWeight: FontWeight.w500,fontSize: 16,color: Colors.black
                  ),)),
                  SizedBox(
                    width: 110.px,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: (){
                            if(controller.guestNumber.value>0){
                              controller.decreaseNumber(0);
                            }

                          },
                          child: CommonWidgets.appImagesView(
                              imagePath: IconConstants.icMinus,
                              height: 32.px,width: 32.px
                          ),
                        ),
                        Text(controller.guestNumber.value.toString(),style: MyTextStyle.titleStyle16bb,),
                        GestureDetector(
                          onTap: (){
                            controller.increaseNumber(0);
                          },
                          child: CommonWidgets.appImagesView(
                              imagePath: IconConstants.icPlus,
                              height: 32.px,width: 32.px
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Divider(
              thickness: 1.px,color: textGrey,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15.px,vertical: 8.px),
              child: Row(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(right: 10.px),
                    child: CommonWidgets.appImagesView(
                        imagePath: IconConstants.icCardBed,
                        height: 36.px,width: 36.px
                    ),
                  ),
                  Expanded(child: Text(StringConstants.bedrooms, style: MyTextStyle.customStyle(
                      fontFamily: "Lora",fontWeight: FontWeight.w500,fontSize: 16,color: Colors.black
                  ),)),
                  SizedBox(
                    width: 110.px,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: (){
                            if(controller.bedRoomsNumber.value>0){
                              controller.decreaseNumber(1);
                            }
                          },
                          child: CommonWidgets.appImagesView(
                              imagePath: IconConstants.icMinus,
                              height: 32.px,width: 32.px
                          ),
                        ),
                        Text(controller.bedRoomsNumber.value.toString(),style: MyTextStyle.titleStyle16bb,),
                        GestureDetector(
                          onTap: (){
                            controller.increaseNumber(1);
                          },
                          child: CommonWidgets.appImagesView(
                              imagePath: IconConstants.icPlus,
                              height: 32.px,width: 32.px
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Divider(
              thickness: 1.px,color: textGrey,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15.px,vertical: 8.px),
              child: Row(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(right: 10.px),
                    child: CommonWidgets.appImagesView(
                        imagePath: IconConstants.icCardBed,
                        height: 36.px,width: 36.px
                    ),
                  ),
                  Expanded(child: Text(StringConstants.bed, style: MyTextStyle.customStyle(
                      fontFamily: "Lora",fontWeight: FontWeight.w500,fontSize: 16,color: Colors.black
                  ),)),
                  SizedBox(
                    width: 110.px,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: (){
                            if(controller.bedNumber.value>0){
                              controller.decreaseNumber(2);
                            }
                          },
                          child: CommonWidgets.appImagesView(
                              imagePath: IconConstants.icMinus,
                              height: 32.px,width: 32.px
                          ),
                        ),
                        Text(controller.bedNumber.value.toString(),style: MyTextStyle.titleStyle16bb,),
                        GestureDetector(
                          onTap: (){
                            controller.increaseNumber(2);
                          },
                          child: CommonWidgets.appImagesView(
                              imagePath: IconConstants.icPlus,
                              height: 32.px,width: 32.px
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Divider(
              thickness: 1.px,color: textGrey,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15.px,vertical: 8.px),
              child: Row(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(right: 10.px),
                    child: CommonWidgets.appImagesView(
                        imagePath: IconConstants.icCardTub,
                        height: 36.px,width: 36.px
                    ),
                  ),
                  Expanded(child: Text(StringConstants.bathrooms, style: MyTextStyle.customStyle(
                      fontFamily: "Lora",fontWeight: FontWeight.w500,fontSize: 16,color: Colors.black
                  ),)),
                  SizedBox(
                    width: 110.px,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: (){
                            if(controller.bathRoomNumber.value>0){
                              controller.decreaseNumber(3);
                            }
                          },
                          child: CommonWidgets.appImagesView(
                              imagePath: IconConstants.icMinus,
                              height: 32.px,width: 32.px
                          ),
                        ),
                        Text(controller.bathRoomNumber.value.toString(),style: MyTextStyle.titleStyle16bb,),
                        GestureDetector(
                          onTap: (){
                            controller.increaseNumber(3);
                          },
                          child: CommonWidgets.appImagesView(
                              imagePath: IconConstants.icPlus,
                              height: 32.px,width: 32.px
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Divider(
              thickness: 1.px,color: textGrey,
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.px),
                  border: Border.all(width: 2.px,color: textGrey)
              ),
              margin: EdgeInsets.only(left: 30.px,right: 30.px,bottom: 30.px),
              child: CommonWidgets.commonElevatedButton(
                onPressed: (){
                  controller.clickOnSaveButton();
                },
                child: Text(StringConstants.save,style: MyTextStyle.customStyle(fontSize: 18,fontWeight: FontWeight.w700,
                    color: textGrey,fontFamily: 'Lora'),),
                borderRadius: 25.px,
                buttonColor: primary3Color,
              ),
            ),
          ],
        );
      }),
    );
  }
}
