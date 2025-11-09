import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/edit_my_space_question_controller.dart';

class EditMySpaceQuestionView extends GetView<EditMySpaceQuestionController> {
  const EditMySpaceQuestionView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: CommonWidgets.appBarView(title: StringConstants.editSpace),
      body: Obx((){
        controller.count.value;
        return Padding(
          padding: EdgeInsets.all(10.px),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(StringConstants.spaceQuestion,
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
                      fontFamily: "Buenard",fontWeight: FontWeight.w700,fontSize: 20,color:const Color(0xFF424242)
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
                              fontFamily: "Buenard",fontWeight: FontWeight.w700,fontSize: 16,color: textGrey
                          ),
                          decoration:  InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            hintText: controller.hintList[0],
                            disabledBorder: InputBorder.none,
                            border: InputBorder.none,
                            enabledBorder:InputBorder.none,
                          ),
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
                      fontFamily: "Buenard",fontWeight: FontWeight.w700,fontSize: 20,color:const Color(0xFF424242)
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
                              fontFamily: "Buenard",fontWeight: FontWeight.w700,fontSize: 16,color: textGrey
                          ),
                          decoration:  InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            hintText: controller.hintList[1],
                            disabledBorder: InputBorder.none,
                            border: InputBorder.none,
                            enabledBorder:InputBorder.none,
                          ),
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
                      fontFamily: "Buenard",fontWeight: FontWeight.w700,fontSize: 20,color:const Color(0xFF424242)
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
                              fontFamily: "Buenard",fontWeight: FontWeight.w700,fontSize: 16,color: textGrey
                          ),
                          decoration:  InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            hintText: controller.hintList[2],
                            disabledBorder: InputBorder.none,
                            border: InputBorder.none,
                            enabledBorder:InputBorder.none,
                          ),
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
                      fontFamily: "Buenard",fontWeight: FontWeight.w700,fontSize: 20,color:const Color(0xFF424242)
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
                              fontFamily: "Buenard",fontWeight: FontWeight.w700,fontSize: 16,color: textGrey
                          ),
                          decoration:  InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            hintText: controller.hintList[3],
                            disabledBorder: InputBorder.none,
                            border: InputBorder.none,
                            enabledBorder:InputBorder.none,
                          ),
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
                      fontFamily: "Buenard",fontWeight: FontWeight.w700,fontSize: 20,color:const Color(0xFF424242)
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
                              fontFamily: "Buenard",fontWeight: FontWeight.w700,fontSize: 16,color: textGrey
                          ),
                          decoration:  InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            hintText: controller.hintList[4],
                            disabledBorder: InputBorder.none,
                            border: InputBorder.none,
                            enabledBorder:InputBorder.none,
                          ),
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
              ],
            ),
          ),
        );
      })
    );
  }
}
