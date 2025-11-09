import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/edit_travel_question_controller.dart';

class EditTravelQuestionView extends GetView<EditTravelQuestionController> {
  const EditTravelQuestionView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBarView(title: StringConstants.editTravelQuestion),
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      body:Obx((){
        controller.count.value;
        return Padding(
          padding: EdgeInsets.all(10.px),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(StringConstants.travelQuestion,
                  style: MyTextStyle.customStyle(
                      fontFamily: "Lora",fontWeight: FontWeight.w700,fontSize: 30,color: labelColor
                  ),
                ),
                SizedBox(height: 10.px,),
                Text(StringConstants.pleaseAnswer2Min,
                  style: MyTextStyle.titleStyle14grey,
                ),
                SizedBox(height: 10.px,),
                Text(controller.questionList[0],
                  style: MyTextStyle.customStyle(
                      fontFamily: "Buenard",fontWeight: FontWeight.w700,fontSize: 20,color:const Color(0xFF8E8E8E)
                  ),
                ),
                SizedBox(height: 10.px,),
                Stack(
                  children: [
                    Container(
                        padding: EdgeInsets.only(left: 15.px,right: 15.px,top: 5.px,bottom: 20.px),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.px),
                            border: Border.all(width: 1.px,color: textGrey),
                            color: primary3Color
                        ),
                        child:TextField(
                          controller: controller.answer1,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          style: MyTextStyle.customStyle(
                              fontFamily: "Buenard",fontWeight: FontWeight.w700,fontSize: 16,color: textColor
                          ),
                          decoration:  InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            hintText: controller.hintList[0],
                            disabledBorder: InputBorder.none,
                            border: InputBorder.none,
                            enabledBorder:InputBorder.none,
                              hintStyle: MyTextStyle.titleStyle14blb
                          ),
                          onChanged: (value){
                            controller.setAnswer(0,value);
                          },
                        )
                    ),
                    Positioned(
                        bottom: 10.px,right: 10.px,
                        child: CommonWidgets.appImagesView(
                            imagePath: IconConstants.icMic,
                            height: 24.px,width: 24.px
                        )
                    )
                  ],
                ),
                SizedBox(height: 10.px,),
                Text(controller.questionList[1],
                  style: MyTextStyle.customStyle(
                      fontFamily: "Buenard",fontWeight: FontWeight.w700,fontSize: 20,color:const Color(0xFF8E8E8E)
                  ),
                ),
                SizedBox(height: 10.px,),
                Stack(
                  children: [
                    Container(
                        padding: EdgeInsets.only(left: 15.px,right: 15.px,top: 5.px,bottom: 20.px),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.px),
                            border: Border.all(width: 1.px,color: textGrey),
                            color: primary3Color
                        ),
                        child:TextField(
                          controller: controller.answer2,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          style: MyTextStyle.customStyle(
                              fontFamily: "Buenard",fontWeight: FontWeight.w700,fontSize: 16,color: textColor
                          ),
                          decoration:  InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            hintText: controller.hintList[1],
                            disabledBorder: InputBorder.none,
                            border: InputBorder.none,
                            enabledBorder:InputBorder.none,
                              hintStyle: MyTextStyle.titleStyle14blb
                          ),
                          onChanged: (value){
                            controller.setAnswer(1,value);
                          },
                        )
                    ),
                    Positioned(
                        bottom: 10.px,right: 10.px,
                        child: CommonWidgets.appImagesView(
                            imagePath: IconConstants.icMic,
                            height: 24.px,width: 24.px
                        )
                    )
                  ],
                ),

                SizedBox(height: 10.px,),
                Text(controller.questionList[2],
                  style: MyTextStyle.customStyle(
                      fontFamily: "Buenard",fontWeight: FontWeight.w700,fontSize: 20,color:const Color(0xFF8E8E8E)
                  ),
                ),
                SizedBox(height: 10.px,),
                Stack(
                  children: [
                    Container(
                        padding: EdgeInsets.only(left: 15.px,right: 15.px,top: 5.px,bottom: 20.px),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.px),
                            border: Border.all(width: 1.px,color: textGrey),
                            color: primary3Color
                        ),
                        child:TextField(
                          controller: controller.answer3,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          style: MyTextStyle.customStyle(
                              fontFamily: "Buenard",fontWeight: FontWeight.w700,fontSize: 16,color: textColor
                          ),
                          decoration:  InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            hintText: controller.hintList[2],
                            disabledBorder: InputBorder.none,
                            border: InputBorder.none,
                            enabledBorder:InputBorder.none,
                              hintStyle: MyTextStyle.titleStyle14blb
                          ),
                          onChanged: (value){
                            controller.setAnswer(2,value);
                          },
                        )
                    ),
                    Positioned(
                        bottom: 10.px,right: 10.px,
                        child: CommonWidgets.appImagesView(
                            imagePath: IconConstants.icMic,
                            height: 24.px,width: 24.px
                        )
                    )
                  ],
                ),
                SizedBox(height: 10.px,),
                Text(controller.questionList[3],
                  style: MyTextStyle.customStyle(
                      fontFamily: "Buenard",fontWeight: FontWeight.w700,fontSize: 20,color:const Color(0xFF8E8E8E)
                  ),
                ),
                SizedBox(height: 10.px,),
                Stack(
                  children: [
                    Container(
                        padding: EdgeInsets.only(left: 15.px,right: 15.px,top: 5.px,bottom: 20.px),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.px),
                            border: Border.all(width: 1.px,color: textGrey),
                            color: primary3Color
                        ),
                        child:TextField(
                          controller: controller.answer4,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          style: MyTextStyle.customStyle(
                              fontFamily: "Buenard",fontWeight: FontWeight.w700,fontSize: 16,color: textColor
                          ),
                          decoration:  InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            hintText: controller.hintList[3],
                            disabledBorder: InputBorder.none,
                            border: InputBorder.none,
                            enabledBorder:InputBorder.none,
                              hintStyle: MyTextStyle.titleStyle14blb
                          ),
                          onChanged: (value){
                            controller.setAnswer(3,value);
                          },
                        )
                    ),
                    Positioned(
                        bottom: 10.px,right: 10.px,
                        child: CommonWidgets.appImagesView(
                            imagePath: IconConstants.icMic,
                            height: 24.px,width: 24.px
                        )
                    )
                  ],
                ),
                SizedBox(height: 10.px,),
                Text(controller.questionList[4],
                  style: MyTextStyle.customStyle(
                      fontFamily: "Buenard",fontWeight: FontWeight.w700,fontSize: 20,color:const Color(0xFF8E8E8E)
                  ),
                ),
                SizedBox(height: 10.px,),
                Stack(
                  children: [
                    Container(
                        padding: EdgeInsets.only(left: 15.px,right: 15.px,top: 5.px,bottom: 20.px),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.px),
                            border: Border.all(width: 1.px,color: textGrey),
                            color: primary3Color
                        ),
                        child:TextField(
                          controller: controller.answer5,
                          keyboardType: TextInputType.multiline,

                          maxLines: null,
                          style: MyTextStyle.customStyle(
                              fontFamily: "Buenard",fontWeight: FontWeight.w700,fontSize: 16,color: textColor
                          ),
                          decoration:  InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            hintText: controller.hintList[4],
                            disabledBorder: InputBorder.none,
                            border: InputBorder.none,
                            enabledBorder:InputBorder.none,
                              hintStyle: MyTextStyle.titleStyle14blb
                          ),
                          onChanged: (value){
                            controller.setAnswer(4,value);
                          },
                        )
                    ),
                    Positioned(
                        bottom: 10.px,right: 10.px,
                        child: CommonWidgets.appImagesView(
                            imagePath: IconConstants.icMic,
                            height: 24.px,width: 24.px
                        )
                    )
                  ],
                ),
                SizedBox(height: 10.px,),
                Text(controller.questionList[5],
                  style: MyTextStyle.customStyle(
                      fontFamily: "Buenard",fontWeight: FontWeight.w700,fontSize: 20,color:const Color(0xFF8E8E8E)
                  ),
                ),
                SizedBox(height: 10.px,),
                Stack(
                  children: [
                    Container(
                        padding: EdgeInsets.only(left: 15.px,right: 15.px,top: 5.px,bottom: 20.px),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.px),
                            border: Border.all(width: 1.px,color: textGrey),
                            color: primary3Color
                        ),
                        child:TextField(
                          controller: controller.answer6,
                          keyboardType: TextInputType.multiline,

                          maxLines: null,
                          style: MyTextStyle.customStyle(
                              fontFamily: "Buenard",fontWeight: FontWeight.w700,fontSize: 16,color: textColor
                          ),
                          decoration:  InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            hintText: controller.hintList[5],
                            disabledBorder: InputBorder.none,
                            border: InputBorder.none,
                            enabledBorder:InputBorder.none,
                            hintStyle: MyTextStyle.titleStyle14blb
                          ),
                          onChanged: (value){
                            controller.setAnswer(5,value);
                          },
                        )
                    ),
                    Positioned(
                        bottom: 10.px,right: 10.px,
                        child: CommonWidgets.appImagesView(
                            imagePath: IconConstants.icMic,
                            height: 24.px,width: 24.px
                        )
                    )
                  ],
                ),
                SizedBox(height: 10.px,),
                Text(controller.questionList[6],
                  style: MyTextStyle.customStyle(
                      fontFamily: "Buenard",fontWeight: FontWeight.w700,fontSize: 20,color:const Color(0xFF8E8E8E)
                  ),
                ),
                SizedBox(height: 10.px,),
                Stack(
                  children: [
                    Container(
                        padding: EdgeInsets.only(left: 15.px,right: 15.px,top: 5.px,bottom: 20.px),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.px),
                            border: Border.all(width: 1.px,color: textGrey),
                            color: primary3Color
                        ),
                        child:TextField(
                          controller: controller.answer7,
                          keyboardType: TextInputType.multiline,

                          maxLines: null,
                          style: MyTextStyle.customStyle(
                              fontFamily: "Buenard",fontWeight: FontWeight.w700,fontSize: 16,color: textGrey
                          ),
                          decoration:  InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            hintText: controller.hintList[6],
                            disabledBorder: InputBorder.none,
                            border: InputBorder.none,
                            enabledBorder:InputBorder.none,
                          ),
                          onChanged: (value){
                            controller.setAnswer(6,value);
                          },
                        )
                    ),
                    Positioned(
                        bottom: 10.px,right: 10.px,
                        child: CommonWidgets.appImagesView(
                            imagePath: IconConstants.icMic,
                            height: 24.px,width: 24.px
                        )
                    )
                  ],
                ),
                controller.isLoading.value?
                Padding(
                  padding: EdgeInsets.only(bottom: 30.px),
                  child: Center(child: CupertinoActivityIndicator(color: primary3Color,radius: 15.px,)),
                ):
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.px)
                  ),
                  margin: EdgeInsets.only(left: 10.px,right: 10.px,bottom: 50.px,top: 15.px),
                  elevation: 10.px,
                  child: CommonWidgets.commonElevatedButton(
                    onPressed: (){
                      controller.clickOnSaveButton(context);
                    },

                    child: Text(StringConstants.save,style: MyTextStyle.customStyle(fontSize: 18,fontWeight: FontWeight.w700,
                        color: text2Color,fontFamily: 'Lora'),),
                    borderRadius: 25.px,
                    buttonColor: primary3Color,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
