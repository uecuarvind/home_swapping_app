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
import '../../../data/constants/image_constants.dart';
import '../controllers/select_location_controller.dart';

class SelectLocationView extends GetView<SelectLocationController> {
  const SelectLocationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        backgroundColor: blackColor,
        resizeToAvoidBottomInset: false,
          body:Container(
            height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImageConstants.imgExploreBackground),fit: BoxFit.cover
              ),
            ),
            child: Padding(
              padding:  EdgeInsets.only(left: 20.px,right: 20.px,top: 50.px),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row(
                  //   children: [
                  //     GestureDetector(
                  //       onTap: () {
                  //         Get.back();
                  //       },
                  //       child: Icon(Icons.arrow_back_ios,size: 30.px,color: primary3Color,),
                  //     ),
                  //     Padding(
                  //       padding:  EdgeInsets.only(left: 10.px),
                  //       child: Text(StringConstants.search,
                  //         style: MyTextStyle.customStyle(color: text2Color,fontWeight: FontWeight.w700,fontSize: 20.px,fontFamily: 'Lora'),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(height: 25.px,),
                  // Text(StringConstants.whereTo,
                  //   style: MyTextStyle.customStyle(fontSize: 30.px,color: primary3Color,fontFamily: 'Lora',fontWeight: FontWeight.w700),
                  // ),
                  SizedBox(height: 20.px,),
                  GestureDetector(
                    onTap: (){
                      controller.clickOnSearch();
                    },
                    child: Container(
                      height: 50.px,
                      padding: EdgeInsets.symmetric(horizontal: 10.px),
                      decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(12.px),
                        color: primary3Color.withOpacity(0.15)
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.search,color: primary3Color,size: 25.px,),
                          SizedBox(width: 5.px,),
                          Expanded(
                            child: Text('Where should we go?',style:MyTextStyle.customStyle(fontFamily: 'Lora',
                            fontSize: 16,fontWeight: FontWeight.w500,color: primary3Color) ,),
                          ),
                          IconButton(
                            icon:const Icon(Icons.close,color: primary3Color,),
                            onPressed: () {
                              controller.locationController.text='';
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                 /* TypeAheadField(
                    showOnFocus: false,
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
                          fillColor: primary3Color.withOpacity(0.2),
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
                      // return ListTile(
                      //   trailing: const Icon(Icons.location_on_sharp,color: Color(0xffDCD3C7),),
                      //   title: Text(suggestion,style:MyTextStyle.customStyle(color: Color(0xffB4A794),fontFamily: 'Lora',fontSize: 16.px,fontWeight: FontWeight.w700),),
                      // );
                      return Container(
                        padding:  EdgeInsets.symmetric(vertical: 5.px),
                        decoration: const BoxDecoration(
                          color: Colors.transparent
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 5.px,),
                            CommonWidgets.appImagesView(
                                imagePath: 'assets/images/paris.png',
                              height: 90.px,width: 90.px,borderRadius: 20.px
                            ),
                            SizedBox(width: 10.px,),
                            Text(suggestion,style: MyTextStyle.titleStyle16bb,)
                          ],
                        ),
                      );
                    },
                    onSelected: (suggestion) {
                      controller.locationController.text=suggestion;
                    },
                  ),*/
                  SizedBox(height: 10.px,),
                  Text(StringConstants.topDestination,
                    style:  MyTextStyle.customStyle(fontWeight: FontWeight.w500, color: primary3Color,fontSize: 20.px,fontFamily: 'Lora'),
                  ),
                  SizedBox(
                    height: 139.px,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.topDestinationList.length,
                        itemBuilder: (context, index) {
                          return  GestureDetector(
                              onTap: (){
                                controller.selectDestinationIndex.value=index;
                                controller.increment();
                              },
                              child: Container(
                                margin:  EdgeInsets.all(8.0.px),
                               decoration: BoxDecoration(

                                 borderRadius: BorderRadius.circular(12.px),
                                 border: Border.all(color:controller.selectDestinationIndex.value==index?primary3Color:transparentColor,width: 1 ),
                                 boxShadow:controller.selectDestinationIndex.value==index? const[
                                    BoxShadow(
                                     color: primary3Color,
                                     spreadRadius: 0,
                                     blurRadius: 12,
                                     offset:  Offset(0, 4), // changes position of shadow
                                   ),
                                 ]:null
                               ),
                               // surfaceTintColor: primary3Color,
                                clipBehavior: Clip.hardEdge,
                              // elevation: controller.selectDestinationIndex.value==index?15.px:0.px,
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
                          )
                          );
                        },
                    ),
                  ),
                  SizedBox(height: 10.px,),
                  Text(StringConstants.stillLookingFor,
                    style:  MyTextStyle.customStyle(fontWeight: FontWeight.w500, color: primary3Color,fontSize: 20.px,fontFamily: 'Lora'),
                  ),
                  SizedBox(
                    height: 139.px,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.stillLookingForList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (){
                            controller.selectLookingIndex.value=index;
                            controller.increment();
                          },
                          child: Container(
                            margin:  EdgeInsets.all(8.0.px),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.px),
                                border: Border.all(color:controller.selectLookingIndex.value==index?primary3Color:transparentColor,width: 1 ),
                                boxShadow:controller.selectLookingIndex.value==index? const[
                                  BoxShadow(
                                    color: primary3Color,
                                    spreadRadius: 0,
                                    blurRadius: 12,
                                    offset:  Offset(0, 4), // changes position of shadow
                                  ),
                                ]:null
                            ),
                           // surfaceTintColor: primary3Color,
                            clipBehavior: Clip.hardEdge,
                          //  elevation: controller.selectLookingIndex.value==index?15.px:0.px,
                            child: Stack(
                              children: [
                                CommonWidgets.appImagesView(
                                    imagePath: controller.stillLookingForList[index]['image']??'',
                                    fit: BoxFit.cover,height: 139.px,width: 127.px, borderRadius: 12.px
                                ),
                                Positioned(
                                  bottom: 10.px,left: 10.px,
                                  child: Text(controller.stillLookingForList[index]['location']??'',
                                    style:  MyTextStyle.customStyle(fontWeight: FontWeight.w700, color: primary3Color,fontSize: 14.px,fontFamily: 'Lora'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const Spacer(),
                  Center(
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.px)
                      ),
                      color: primary3Color,
                      surfaceTintColor: primary3Color,
                      shadowColor: Colors.blue,
                      elevation: 15.px,
                      child: Container(
                        height: 50.px,width:160.px,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.px),
                            color: primary3Color
                        ),
                        child: InkWell(
                          onTap: (){
                            controller.onTapExplore();
                          },
                          child: Center(
                            child: Text(StringConstants.set,
                              style: MyTextStyle.customStyle(color:const Color(0xFF090909),fontSize: 16.px,fontFamily: 'Lora',
                              fontWeight: FontWeight.w700),),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30..px,)
                ],
              ),
            ),
          )
      );
    });
  }
}
