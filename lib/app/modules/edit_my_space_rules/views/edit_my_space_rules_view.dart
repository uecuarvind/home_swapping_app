import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:home_swipping/app/data/constants/icons_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/edit_my_space_rules_controller.dart';

class EditMySpaceRulesView extends GetView<EditMySpaceRulesController> {
  const EditMySpaceRulesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary3Color,
      appBar: CommonWidgets.appBarView(title: StringConstants.editSpace,color: primary3Color),
      body: Obx((){
        controller.count.value;
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.px,),
              Padding(
                padding: EdgeInsets.only(left: 15.px),
                child: Text(StringConstants.yourHouseRules,
                  style: MyTextStyle.customStyle(
                      fontFamily: "Lora",fontWeight: FontWeight.w700,fontSize: 30,color:const Color(0xFFA1A1A1)
                  ),
                ),
              ),
              Divider(
                thickness: 1.px,color: textGolden,
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 15.px,vertical: 0.px),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
          
                    Text(controller.rulesList[0]['title'], style: MyTextStyle.customStyle(
                        fontFamily: "Lora",fontWeight: FontWeight.w700,fontSize: 16,color: textGrey
                    ),),
                    SizedBox(
                      width: 50.px,
                      child:  Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Switch(
                            value: controller.rulesList[0]['status'],
                            activeColor: primary3Color,
                            inactiveTrackColor:Colors.grey.withOpacity(0.6) ,
                            activeTrackColor:const Color(0xFFDCD3C7) ,
                            inactiveThumbColor:Colors.grey.withOpacity(0.6) ,
                            activeThumbImage: const AssetImage(IconConstants.icToggleCheck),
                            inactiveThumbImage : const AssetImage(IconConstants.icUnCheck),
                            onChanged: (value){
                              controller.changeValue(0,value);
                            }
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                thickness: 1.px,color: textGolden,
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 15.px,vertical: 0.px),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
          
                    Text(controller.rulesList[1]['title'], style: MyTextStyle.customStyle(
                        fontFamily: "Lora",fontWeight: FontWeight.w700,fontSize: 16,color: textGrey
                    ),),
                    SizedBox(
                      width: 50.px,
                      child:  Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Switch(
                            value: controller.rulesList[1]['status'],
                            activeColor: primary3Color,
                            inactiveTrackColor:Colors.grey.withOpacity(0.6) ,
                            activeTrackColor:const Color(0xFFDCD3C7) ,
                            inactiveThumbColor:Colors.grey.withOpacity(0.6) ,
                            activeThumbImage: const AssetImage(IconConstants.icToggleCheck),
                            inactiveThumbImage : const AssetImage(IconConstants.icUnCheck),
                            onChanged: (value){
                              controller.changeValue(1,value);
                            }
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                thickness: 1.px,color: textGolden,
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 15.px,vertical: 0.px),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
          
                    Text(controller.rulesList[2]['title'], style: MyTextStyle.customStyle(
                        fontFamily: "Lora",fontWeight: FontWeight.w700,fontSize: 16,color: textGrey
                    ),),
                    SizedBox(
                      width: 50.px,
                      child:  Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Switch(
                            value: controller.rulesList[2]['status'],
                            activeColor: primary3Color,
                            inactiveTrackColor:Colors.grey.withOpacity(0.6) ,
                            activeTrackColor:const Color(0xFFDCD3C7) ,
                            inactiveThumbColor:Colors.grey.withOpacity(0.6) ,
                            activeThumbImage: const AssetImage(IconConstants.icToggleCheck),
                            inactiveThumbImage : const AssetImage(IconConstants.icUnCheck),
                            onChanged: (value){
                              controller.changeValue(2,value);
                            }
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                thickness: 1.px,color: textGolden,
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 15.px,vertical: 0.px),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
          
                    Text(controller.rulesList[3]['title'], style: MyTextStyle.customStyle(
                        fontFamily: "Lora",fontWeight: FontWeight.w700,fontSize: 16,color: textGrey
                    ),),
                    SizedBox(
                      width: 50.px,
                      child:  Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Switch(
                            value: controller.rulesList[3]['status'],
                            activeColor: primary3Color,
                            inactiveTrackColor:Colors.grey.withOpacity(0.6) ,
                            activeTrackColor:const Color(0xFFDCD3C7) ,
                            inactiveThumbColor:Colors.grey.withOpacity(0.6) ,
                            activeThumbImage: const AssetImage(IconConstants.icToggleCheck),
                            inactiveThumbImage : const AssetImage(IconConstants.icUnCheck),
                            onChanged: (value){
                              controller.changeValue(3,value);
                            }
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                thickness: 1.px,color: textGolden,
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 15.px,vertical: 0.px),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
          
                    Text(controller.rulesList[4]['title'], style: MyTextStyle.customStyle(
                        fontFamily: "Lora",fontWeight: FontWeight.w700,fontSize: 16,color: textGrey
                    ),),
                    SizedBox(
                      width: 50.px,
                      child:  Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Switch(
                            value: controller.rulesList[4]['status'],
                            activeColor: primary3Color,
                            inactiveTrackColor:Colors.grey.withOpacity(0.6) ,
                            activeTrackColor:const Color(0xFFDCD3C7) ,
                            inactiveThumbColor:Colors.grey.withOpacity(0.6) ,
                            activeThumbImage: const AssetImage(IconConstants.icToggleCheck),
                            inactiveThumbImage : const AssetImage(IconConstants.icUnCheck),
                            onChanged: (value){
                              controller.changeValue(4,value);
                            }
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                thickness: 1.px,color: textGolden,
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 15.px,vertical: 10.px),
                child: Row(
                  children: [
                    SizedBox(
                      height: 25.px,
                      width: 25.px,
                      child: Checkbox(
                          value: controller.checkBoxValue.value,
                          checkColor: textGolden,
                          activeColor: primary3Color,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.px),
                            side: BorderSide(color: textGolden,width: 1.5.px)
                          ),
                          side:BorderSide(color: textGolden,width: 1.5.px) ,
                          onChanged: (value){
                            controller.checkBoxValue.value=value!;
          
                          }
                      ),
                    ),
                    Text(StringConstants.applySameSettingsToYourSearch,style: MyTextStyle.customStyle(
                        fontFamily: "Lora",fontWeight: FontWeight.w500,fontSize: 14,color: textGolden
                    ),)
                  ],
                ),
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
