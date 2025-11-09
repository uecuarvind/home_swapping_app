import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:home_swipping/app/data/constants/icons_constant.dart';
import 'package:home_swipping/common/common_widgets.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';
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
      backgroundColor:blackColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CommonWidgets.gradientButton(
          onPressed: (){
            controller.clickOnShareButton();
    },wantContentSizeButton: true,width: 230.px,height: 48.px,
      text: StringConstants.save),
      body: Obx((){
        controller.count.value;
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.px,vertical: 0.px),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                    leading: GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: CommonWidgets.appImagesView(imagePath: IconConstants.icBack,
                      height: 35.px,width: 35.px),
                    ),
                    title:Padding(
                      padding:  EdgeInsets.only(right: 50.px),
                      child: Center(
                        child:      Text('Edit space tape',style: MyTextStyle.customStyle(fontWeight: FontWeight.w700,
                            fontSize: 24.px,color:primary3Color,fontFamily: 'Lora'),),
                      ),
                    )
                ),
                  SizedBox(height: 10.px,),
                Row(
                  children: [
                   CommonWidgets.appImagesView(
                       imagePath: IconConstants.icRobort,
                   width: 35.px,height: 52),
                    SizedBox(width: 10.px,),
                    Expanded(
                      child: Text('Get the community excited to enjoy your space',style: MyTextStyle.customStyle(fontWeight: FontWeight.w400,
                          fontSize: 14.px,color: primary3Color,fontFamily: 'Lora'),
                      maxLines: 2,),
                    ),
                  ],
                ),
                Center(

                  child: ReorderableGridView.builder(
                    gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 180/180,
                      crossAxisCount: 2,),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: 8.px,vertical: 15.px),
                    itemCount: controller.selectFiles.length+1,
                    itemBuilder:(context,index){
                      return controller.selectFiles.length==index?
                      GestureDetector(
                        key: ValueKey('add_icon'),
                        onTap: (){
                          controller.pickGallery();
                        },
                        child: Container(

                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.px),
                            border: Border.all(color: primary3Color,width: 1.px)
                          ),
                          child:const Icon(Icons.add,color: primary3Color,size: 40,),
                        ),
                      ):Stack(
                        key: ValueKey(controller.selectFiles[index].path),
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.px),
                              color: primary3Color
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: Image.file(
                              controller.selectFiles[index],
                              width: 180.px,
                              height: 180.px,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                              top:5.px,right:5.px,
                              child: GestureDetector(
                                onTap:(){
                                  controller.removeItem(index);
                               },
                                child: CommonWidgets.appImagesView(
                                    imagePath: IconConstants.icEdit,
                                  color: primary3Color,
                                  height: 35.px,
                                  width: 35.px
                                ),
                              )
                          )
                        ],
                      );
                    },
                    onReorder: (oldIndex, newIndex) {
                      controller.changeSelectedImageOrder(oldIndex,newIndex);
                    },
                    dragEnabled: true,

                  ),
                ),
                /*    SizedBox(
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
              ),*/


              ],
            ),
          ),
        );
      })
    );
  }
}
