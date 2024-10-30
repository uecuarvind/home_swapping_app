import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/edit_dream_destinations_controller.dart';

class EditDreamDestinationsView
    extends GetView<EditDreamDestinationsController> {
  const EditDreamDestinationsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBarView(title: StringConstants.edit),
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      body:Obx((){
        controller.count.value;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.px,vertical: 5.px),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(StringConstants.yourDreamDestination,style: MyTextStyle.customStyle(fontSize: 24,fontWeight: FontWeight.w700,fontFamily: 'Lora',color:const Color(0xFFB7B8BE)),),
              Text(StringConstants.editAnyTime,style: MyTextStyle.customStyle(fontSize: 18,fontWeight: FontWeight.w600,fontFamily: 'Lora',color:const Color(0xFFB7B8BE)),),
              SizedBox(height: 20.px,),
              Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.px,
                        crossAxisSpacing: 10.px,
                        childAspectRatio: 1
                    ),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount:controller.dreamList.length,
                    itemBuilder: (context,index){
                      return Stack(
                        children: [
                          Container(
                              height: 150.px,width: 150.px,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.px),
                                  border: Border.all(color: textGolden,width: 2.px)
                              ),
                              clipBehavior: Clip.hardEdge,
                              child: CommonWidgets.appImagesView(
                                imagePath: controller.dreamList[index]['image']??'',
                                height: 150.px,width: 150.px,
                                borderRadius: 14.px,
                              )
                          ),
                          Positioned(
                              left:10.px,bottom:15.px,
                              child: Text(controller.dreamList[index]['place']??'',style: MyTextStyle.customStyle(fontSize: 18,fontWeight: FontWeight.w700,fontFamily: 'Buenard',color:primary3Color),)
                          )
                        ],
                      );
                    }
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.px),
                    border: Border.all(width: 2.px,color: textGrey)
                ),
                margin: EdgeInsets.only(left: 30.px,right: 30.px,bottom: 10.px,top: 20.px),
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
          ),
        );
      }),
    );
  }
}