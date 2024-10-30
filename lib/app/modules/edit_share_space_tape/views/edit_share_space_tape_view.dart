import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:home_swipping/common/common_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/edit_share_space_tape_controller.dart';

class EditShareSpaceTapeView extends GetView<EditShareSpaceTapeController> {
  const EditShareSpaceTapeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xff3E3E3E),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.only(top: 10.px,left: 10.px,right: 10.px,bottom: 10.px),
              child: GestureDetector(
                onTap:(){
                  controller.onTapBack();
                },
                child: Container(
                  height: 30.px,
                  width: 30.px,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.px),
                    color: Colors.black,
                  ),
                  child: Icon(Icons.arrow_back_ios_new_outlined,size: 20.px,color: primary3Color,),
                ),
              ),
            ),
                SizedBox(
                  height: 430.px,
                  child: Obx(() {
                    controller.count.value;
                    return ListView.builder(
                        itemCount: controller.selectFiles.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context,int index){
                          final item = controller.selectFiles[index];
                          return Dismissible(
                            key: Key(item.path),
                            direction: DismissDirection.up,
                            onDismissed: (direction) {
                              print('SelectFiles length before deleting ${controller.selectFiles.length}');
                              controller.selectFiles.removeAt(index);
                              CommonWidgets.showToastMessage("Image deleted successfully !!");
                              print('SelectFiles length after deleting ${controller.selectFiles.length}');
                            },
                            child: Card(
                              shape:RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.px)
                              ) ,
                              clipBehavior: Clip.hardEdge,
                              margin: EdgeInsets.only(left: 15.px,right: 15.px),
                              child: Image.file(
                                item,
                                width: 260.px,
                                height: 430.px,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }
                    );
                  })
                ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                  padding: EdgeInsets.only(left: 10.px,right: 10.px,top: 15.px),
                child: Text(StringConstants.dragDropToMakeChange,style: MyTextStyle.titleStyle20bw,),
              ),
            ),
            const Spacer(),
            Container(
              margin: EdgeInsets.only(left: 20.px,right: 20.px,bottom: 20.px),
              height: 50.px,width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.px),
                  color: primary3Color
              ),
              child: InkWell(
                onTap: (){
                controller.clickOnShareButton();
                },
                child: Center(
                  child: Text(StringConstants.share,
                    style: MyTextStyle.customStyle(color: labelColor,fontSize: 16.px,fontFamily: 'Lora'),),
                ),
              ),
            ),
        
          ],
        ),
      ),
    );
  }
}
