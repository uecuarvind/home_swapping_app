import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/edit_my_space_location_controller.dart';

class EditMySpaceLocationView extends GetView<EditMySpaceLocationController> {
  const EditMySpaceLocationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CommonWidgets.appBarView(title: StringConstants.editSpace),
      body: Obx((){
        controller.count.value;
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15.px,bottom: 10.px),
                child: Text(StringConstants.yourHome,
                  style: MyTextStyle.customStyle(
                      fontFamily: "Lora",fontWeight: FontWeight.w700,fontSize: 30,color: textGrey
                  )
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.px),
                child: Text(StringConstants.itOnlySharedWithGuestsAfterTheyHaveMade,
                  style: MyTextStyle.customStyle(
                      fontFamily: "Lora",fontWeight: FontWeight.w600,fontSize: 15,color: textGrey
                  )
                ),
              ),

              Container(
                height: 52.px,
                margin: EdgeInsets.all(15.px),
                decoration: BoxDecoration(
                  border: Border.all(color: textGrey,width: 1.px),
                  borderRadius: BorderRadius.circular(10.px),
                  color: primary3Color
                ),
                child: TextFormField(

                  controller: controller.locationController,
                  decoration: InputDecoration(
                      hintText: 'Home Address',
                      prefixIcon: Icon(Icons.location_on_rounded,size: 25.px,color: textGrey,),
                    disabledBorder: InputBorder.none,
                    border: InputBorder.none,
                    enabledBorder:InputBorder.none,
                  ),
                ),
              ),
          
              SizedBox(height: 20.px,),
              Card(
                elevation:1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.px),
                ),
                clipBehavior: Clip.hardEdge,
                child:Stack(
                  alignment: Alignment.center,
                  children: [
                    CommonWidgets.appImagesView(
                        imagePath: "assets/images/img_location.png",height: 390.px,width: 391.px,
                        fit: BoxFit.cover
                    ),
                    Positioned(
                      child: CommonWidgets.appImagesView(
                          imagePath: IconConstants.icMapPin,height: 150.px,width: 150.px,
                          fit: BoxFit.cover
                      ),
                    ),
                  ],
                ) ,
              ),
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
