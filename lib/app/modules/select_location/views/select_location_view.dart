import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import 'package:get/get.dart';
import 'package:home_swipping/app/data/constants/string_constants.dart';
import 'package:home_swipping/common/MyTextStyle.dart';
import 'package:home_swipping/common/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../controllers/select_location_controller.dart';

class SelectLocationView extends GetView<SelectLocationController> {
  const SelectLocationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        resizeToAvoidBottomInset: false,
          appBar: AppBar(
            leading:GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Padding(
                padding: EdgeInsets.only(left: 10.px,top: 10.px,bottom: 10.px,right: 0.px),
                child:Icon(Icons.arrow_back_ios,size: 30.px,color: text2Color,),
              ),
            ),
            title: Text(
              StringConstants.search,
              style: MyTextStyle.customStyle(fontWeight: FontWeight.w700, color: text2Color,fontSize: 16.px,fontFamily: 'Lora'),
            ),
          ),
          body:Container(
            margin: EdgeInsets.only(left: 20.px,right: 20.px),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(StringConstants.whereTo,
                  style: MyTextStyle.customStyle(fontSize: 30.px,color: labelColor,fontFamily: 'Lora',fontWeight: FontWeight.w700),
                ),
                TypeAheadField(
                  controller:controller.locationController ,
                  builder: (context, controlller, focusNode) {
                    return TextFormField(
                      controller: controller.locationController,
                      focusNode: focusNode,
                      style: MyTextStyle.customStyle(color: primary3Color,fontFamily: 'Lora',fontSize: 16.px,fontWeight: FontWeight.w700),
                      decoration: InputDecoration(
                        hintText: StringConstants.enterDestination,
                        hintStyle: MyTextStyle.customStyle(color: labelColor,fontFamily: 'Lora',fontSize: 16.px),
                        filled: true,
                        focusColor: primary3Color,
                        fillColor: Colors.grey[300],
                        suffixIcon: IconButton(
                            icon:const Icon(Icons.close,color: primary3Color,),
                            onPressed: () {
                             controller.locationController.text='';
                            },
                        ),
                        prefixIcon: Icon(Icons.search,color: primary3Color,size: 25.px,),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            )
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        //labelText: 'Password',
                      ),
                      cursorColor: primary3Color,
                      cursorWidth: 2.px,
                    );
                  },
                  suggestionsCallback: (pattern) async {
                    return controller.suggestions
                        .where((suggestion) =>
                        suggestion.toLowerCase().contains(pattern.toLowerCase()))
                        .toList();
                  },
                  itemBuilder: (context, suggestion) {
                    return ListTile(
                      trailing: const Icon(Icons.location_on_sharp,color: Color(0xffDCD3C7),),
                      title: Text(suggestion,style:MyTextStyle.customStyle(color: Color(0xffB4A794),fontFamily: 'Lora',fontSize: 16.px,fontWeight: FontWeight.w700),),
                    );
                  },
                  onSelected: (suggestion) {
                    controller.locationController.text=suggestion;
                  },
                ),
                SizedBox(height: 10.px,),
                Text(StringConstants.topDestination,
                  style:  MyTextStyle.customStyle(fontWeight: FontWeight.w700, color: text2Color,fontSize: 20.px,fontFamily: 'Lora'),
                ),
                SizedBox(
                  height: 139.px,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.topDestinationList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            children: [
                              CommonWidgets.appImagesView(
                                  imagePath: controller.topDestinationList[index]['image']??'',
                                fit: BoxFit.cover,height: 138.px,width: 127.px, borderRadius: 12.px
                              ),
                              Positioned(
                                bottom: 10.px,left: 10.px,
                                child: Text(controller.topDestinationList[index]['location']??'',
                                  style:  MyTextStyle.customStyle(fontWeight: FontWeight.w700, color: primary3Color,fontSize: 14.px,fontFamily: 'Lora'),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                  ),
                ),
                SizedBox(height: 10.px,),
                Text(StringConstants.stillLookingFor,
                  style:  MyTextStyle.customStyle(fontWeight: FontWeight.w700, color: text2Color,fontSize: 20.px,fontFamily: 'Lora'),
                ),
                SizedBox(
                  height: 139.px,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.stillLookingForList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            CommonWidgets.appImagesView(
                                imagePath: controller.stillLookingForList[index]['image']??'',
                                fit: BoxFit.cover,height: 138.px,width: 127.px, borderRadius: 12.px
                            ),
                            Positioned(
                              bottom: 10.px,left: 10.px,
                              child: Text(controller.stillLookingForList[index]['location']??'',
                                style:  MyTextStyle.customStyle(fontWeight: FontWeight.w700, color: primary3Color,fontSize: 14.px,fontFamily: 'Lora'),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Spacer(),
                Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(100.px),
                  shadowColor: text2Color,
                  child: Container(
                    margin: EdgeInsets.only(left: 20.px,right: 20.px,),
                    height: 50.px,width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.px),
                        color: primary3Color
                    ),
                    child: InkWell(
                      onTap: (){
                        controller.onTapExplore();
                      },
                      child: Center(
                        child: Text(StringConstants.explore,
                          style: MyTextStyle.customStyle(color: labelColor,fontSize: 16.px,fontFamily: 'Lora'),),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10..px,)
              ],
            ),
          )
      );
    });
  }
}
