import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/edit_my_space_essential_controller.dart';

class EditMySpaceEssentialView extends GetView<EditMySpaceEssentialController> {
  const EditMySpaceEssentialView({super.key});
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
            Padding(
              padding: EdgeInsets.only(left: 15.px),
              child: Text(StringConstants.spaceBasics,
                style: MyTextStyle.customStyle(
                    fontFamily: "Lora",fontWeight: FontWeight.w700,fontSize: 30,color: textGrey
                ),

              ),
            ),

            SizedBox(height: 20.px,),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10.px,
                  mainAxisSpacing: 10.px
              ),
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 15.px,vertical: 5.px),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.spaceCommonFeaturesList.length,
              itemBuilder:  (context, index) {
                return GestureDetector(
                  onTap: (){
                    controller.changeStatus(index);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    height: 90.px,width: 100.px,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.px),
                        border: Border.all(color: controller.spaceCommonFeaturesList[index]['status']?textGolden:primary3Color,width: 2.px),
                        color: primary3Color
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CommonWidgets.appImagesView(
                            imagePath: controller.spaceCommonFeaturesList[index]['featureIcon']??'',
                            fit: BoxFit.fill,height: 24.px,width: 24.px
                        ),
                        Text(controller.spaceCommonFeaturesList[index]['featureName']??'',
                          style: MyTextStyle.customStyle(
                              fontFamily: "Lora",fontWeight: FontWeight.w500,fontSize: 14.px,
                              color: textGolden
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
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
