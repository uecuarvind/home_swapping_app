import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/edit_favorite_destinations_controller.dart';

class EditFavoriteDestinationsView
    extends GetView<EditFavoriteDestinationsController> {
  const EditFavoriteDestinationsView({super.key});
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
              Text(StringConstants.yourFavoriteDestination,style: MyTextStyle.customStyle(fontSize: 24,fontWeight: FontWeight.w700,fontFamily: 'Lora',color:const Color(0xFFB7B8BE)),),
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
                    itemCount:controller.favoriteList.length,
                    itemBuilder: (context,index){
                      return  GestureDetector(
                        onTap: (){
                          controller.changeSelected(index);
                        },
                        child: Stack(
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.px),
                                  side: BorderSide(color:controller.favoriteList[index]['status']? textGolden:backgroundColor,width: 3.px)
                              ),
                              elevation:controller.favoriteList[index]['status']?10.px:0.px,
                              clipBehavior: Clip.hardEdge,
                              child: Container(
                                height: 150.px,width: 150.px,
                                alignment: Alignment.center,

                                child: CommonWidgets.appImagesView(
                                    imagePath: controller.favoriteList[index]['image']??'',
                                  height: 150.px,width: 150.px,
                                  borderRadius: 14.px,
                                )
                              ),
                            ),
                            Positioned(
                                left:10.px,top:120.px,
                                child: Text(controller.favoriteList[index]['place']??'',style: MyTextStyle.customStyle(fontSize: 18,fontWeight: FontWeight.w700,fontFamily: 'Buenard',color:primary3Color),)
                            )
                          ],
                        ),
                      );
                    }
                ),
              ),
              controller.isLoading.value?
              Padding(
                padding: EdgeInsets.only(bottom: 30.px),
                child: Center(child: CupertinoActivityIndicator(color: primary3Color,radius: 15.px,)),
              ):
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.px),
                    border: Border.all(width: 2.px,color: textGrey)
                ),
                margin: EdgeInsets.only(left: 30.px,right: 30.px,bottom: 10.px,top: 20.px),
                child: CommonWidgets.commonElevatedButton(
                  onPressed: (){
                    controller.clickOnSaveButton(context);
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
