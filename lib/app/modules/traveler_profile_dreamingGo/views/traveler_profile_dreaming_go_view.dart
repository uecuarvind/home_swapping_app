import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/traveler_profile_dreaming_go_controller.dart';

class TravelerProfileDreamingGoView
    extends GetView<TravelerProfileDreamingGoController> {
  const TravelerProfileDreamingGoView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBarView(title: StringConstants.createProfile,centerTitle: true),
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:  Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.px)
        ),
        margin: EdgeInsets.only(left: 30.px,right: 30.px),
        elevation: 10.px,
        child: CommonWidgets.commonElevatedButton(
          onPressed: (){
            controller.clickOnContinueButton();
          },

          child: Text(StringConstants.continueText,style: MyTextStyle.customStyle(fontSize: 18,fontWeight: FontWeight.w700,
              color: text2Color,fontFamily: 'Lora'),),
          borderRadius: 25.px,
          buttonColor: primary3Color,
        ),
      ),
      body:Obx((){
        controller.count.value;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.px,vertical: 5.px),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Where are you dreaming to go?',style: MyTextStyle.customStyle(fontSize: 20,fontWeight: FontWeight.w700,fontFamily: 'Lora',color:text2Color),),
              Text('Please Choose 3!',style: MyTextStyle.customStyle(fontSize: 16,fontWeight: FontWeight.w600,fontFamily: 'Buenard',color:const Color(0xFFB7B8BE)),),
              SizedBox(height: 20.px,),
              Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.px,
                        crossAxisSpacing: 10.px,
                        childAspectRatio: 165/151
                    ),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount:controller.dreamList.length,
                    itemBuilder: (context,index){
                      return GestureDetector(
                        onTap: (){
                          controller.changeSelected(index);
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.px),
                            side: BorderSide(color:controller.dreamList[index]['status']? textGolden:backgroundColor,width: 3.px)
                          ),
                          elevation:controller.dreamList[index]['status']?10.px:0.px,
                          child: Stack(
                            children: [
                              CommonWidgets.appImagesView(
                                imagePath: controller.dreamList[index]['image']??'',
                                height: 151.px,width: 165.px,
                                borderRadius: 14.px,
                              ),
                              Positioned(
                                  left:10.px,top:110.px,
                                  child: Text(controller.dreamList[index]['place']??'',style: MyTextStyle.customStyle(fontSize: 18,fontWeight: FontWeight.w700,fontFamily: 'Buenard',color:primary3Color),)
                              )
                            ],
                          ),
                        ),
                      );
                    }
                ),
              ),

            ],
          ),
        );
      }),
    );
  }
}
