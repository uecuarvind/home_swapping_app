import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/edit_travel_interest_controller.dart';

class EditTravelInterestView extends GetView<EditTravelInterestController> {
  const EditTravelInterestView({super.key});
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
              Text(StringConstants.whenITravelILove,style: MyTextStyle.customStyle(fontSize: 30,fontWeight: FontWeight.w700,fontFamily: 'Buenard',color:const Color(0xFF7F7F7F)),),
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
          ),
        );
      }),
    );
  }
}
