
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/edit_language_controller.dart';

class EditLanguageView extends GetView<EditLanguageController> {
  const EditLanguageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBarView(title: StringConstants.editLanguage),
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
              Text(StringConstants.myLanguages,style: MyTextStyle.customStyle(fontSize: 30,fontWeight: FontWeight.w700,fontFamily: 'Lora',color:const Color(0xFFB7B8BE)),),
              Text(StringConstants.selectAsManyAsYouCanSpeakFluently,style: MyTextStyle.customStyle(fontSize: 15,fontWeight: FontWeight.w700,fontFamily: 'Buenard',color:const Color(0xFFB7B8BE)),),
              SizedBox(height: 20.px,),
              Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.px,
                        crossAxisSpacing: 10.px,
                        childAspectRatio: 100/35
                    ),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount:controller.languageList.length,
                    itemBuilder: (context,index){
                      return GestureDetector(
                        onTap: (){
                          controller.changeSelectLanguage( index);
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.px),
                            side: BorderSide(color: textGolden,width: 1.px)
                          ),
                          elevation:controller.languageList[index]['status']?6:0 ,
                          color: controller.languageList[index]['status']?primary3Color:backgroundColor,
                          child: Container(
                            height: 45.px,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: 10.px,vertical: 10.px),
                            child: Row(
                              children: [
                                CommonWidgets.appImagesView(
                                    imagePath: controller.languageList[index]['flag'],
                                  height: 40.px,width: 40.px
                                ),
                                Padding(
                                  padding:  EdgeInsets.only(left: 8.px,right: 10.px),
                                  child: Text(controller.languageList[index]['name'],
                                    style: MyTextStyle.customStyle(
                                        color:text2Color,fontSize: 16.px,fontFamily: 'Buenard',fontWeight: FontWeight.w700
                                    ),overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                if(controller.languageList[index]['status'])
                                  Icon(Icons.check,size: 28.px,color: greenColor,)
                              ],
                            ),
                          ),
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
                margin: EdgeInsets.only(left: 30.px,right: 30.px,bottom: 20.px,top: 20.px),
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
