import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/space_tape_controller.dart';

class SpaceTapeView extends GetView<SpaceTapeController> {
  const SpaceTapeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:const Color(0xff3E3E3E),
        appBar: CommonWidgets.appBarView(title: StringConstants.selectMedia,color: const Color(0xff3E3E3E),centerTitle: true),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          margin: EdgeInsets.only(left: 15.px,right: 15.px,bottom: 15.px),
          height: 50.px,width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.px),
              color: primary3Color
          ),
          child: InkWell(
            onTap: (){
              if(controller.selectedFile.isNotEmpty){
                controller.onTapCreate();
              }else{
                CommonWidgets.showSnackBar(context: context,message:'Please select image at least one image...',status: false);
              }
            },
            child: Center(
              child: Text(StringConstants.create,
                style: MyTextStyle.customStyle(color: labelColor,fontSize: 16.px,fontFamily: 'Lora'),),
            ),
          ),
        ),
        body: Obx(() {
          controller.count.value;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.px,top: 5.px),
                child: Text(StringConstants.youHaveGivenAryAccessToASelectNumberOf,style: MyTextStyle.titleStyle13w,),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.px,right: 10.px,bottom: 10.px),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(StringConstants.photoVideo,style: MyTextStyle.titleStyle16bw,),
                    GestureDetector(
                        onTap: (){
                          // controller.clickOnManage();
                        },
                        child: Text(StringConstants.manage,style: MyTextStyle.titleStyle16bw,))
                  ],
                ),
              ),
              Expanded(
                // child:Platform.isAndroid?showRecentImages():
                // showSelectedImage(),
                child:showRecentImages() ,

              ),
            ],
          );
        })
    );
  }

  Widget showRecentImages(){
    return
      GridView.builder(
        //controller: widget.scrollCtr,
          itemCount: controller.mediaList.length,
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){
                controller.changeSelected(index);
              },
              child: Container(
                  decoration: const BoxDecoration(
                    //borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: primary3Color
                  ),
                  clipBehavior: Clip.hardEdge,
                  margin: const EdgeInsets.all(1),
                  child:Stack(
                    children: [
                      controller.mediaList[index],
                      Positioned(
                          top: 5,right: 5,
                          child:Icon(controller.imageSelected(index)?Icons.check_circle:Icons.circle_outlined,size: 20.px,
                            color: primary3Color,)

                      ),
                    ],
                  )
                //child: _mediaList[index]
              ),
            );
          });
  }

}
