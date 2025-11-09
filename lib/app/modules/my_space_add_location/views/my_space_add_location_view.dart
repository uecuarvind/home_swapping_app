import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/api_constants/api_key_constants.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/my_space_add_location_controller.dart';

class MySpaceAddLocationView extends GetView<MySpaceAddLocationController> {
  const MySpaceAddLocationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:
      CommonWidgets.gradientButton(
          onPressed: (){
            controller.openBottomSheet(context);
          },
          text: StringConstants.continueText,
          buttonMargin: EdgeInsets.only(bottom: 15.px)
      ),
      body: Obx((){
        controller.count.value;
        return SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.zero,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImageConstants.imgExploreBackground),
                    fit: BoxFit.fill
                )
            ),
            child: Stack(
              children: [

                Container(
                  height:MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top: 60.px),
                  child: GoogleMap(
                    mapType: MapType.normal,
                    zoomGesturesEnabled: true,
                    tiltGesturesEnabled: true,
                    markers: {
                      Marker(
                          markerId: const MarkerId('0'),
                          position: controller.mapPosition,
                          icon: controller.customMarker)
                    },
                    onCameraMove: (CameraPosition cameraPosition) async {
                      print(cameraPosition.zoom);
                    },
                    minMaxZoomPreference: const MinMaxZoomPreference(13, 17),
                    initialCameraPosition: CameraPosition(
                      target: controller.mapPosition,
                      zoom: 15,
                    ),
                    onTap: controller.onMapTapped,
                    onMapCreated: (GoogleMapController googlecontroller) {
                      controller.xController = googlecontroller;
                      controller.xController!.animateCamera(
                          CameraUpdate.newCameraPosition(CameraPosition(
                            target: controller.mapPosition,
                            zoom: 15,
                          )));
                    },
                  ),
                ),
                Positioned(
                  top: 0,
                    child: Transform.rotate(
                      angle: math.pi,
                      child: CommonWidgets.appImagesView(
                          imagePath: ImageConstants.imgBlackBackground,
                        height: 300.px,width: MediaQuery.of(context).size.width
                      ),
                    )
                ),
                Positioned(
                  top: 0.px,left: 0.px,right: 0.px,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: GestureDetector(
                          onTap: (){
                            Get.back();
                          },
                          child: CommonWidgets.appImagesView(
                              imagePath: IconConstants.icBack,
                              height: 35.px,width: 35.px
                          ),

                        ) ,
                        title:  Center(
                          child: Padding(
                            padding:  EdgeInsets.only(right: 50.px),
                            child: CommonWidgets.typingText(text: 'Location',style: MyTextStyle.customStyle(
                                fontFamily: 'Lora',fontSize: 18,fontWeight: FontWeight.w700,color: primary3Color
                            ),),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.px,),
                      // Container(
                      //   //height: 52.px,
                      //   margin: EdgeInsets.all(15.px),
                      //   decoration: BoxDecoration(
                      //       border: Border.all(color: textGrey,width: 1.px),
                      //       borderRadius: BorderRadius.circular(10.px),
                      //       color: primary3Color
                      //   ),
                      //   child: TextFormField(
                      //       controller: controller.locationController,
                      //       keyboardType: TextInputType.multiline,
                      //       maxLines: null,
                      //       decoration: InputDecoration(
                      //         hintText: 'Home Address',
                      //         prefixIcon: Icon(Icons.location_on_rounded,size: 25.px,color: textGrey,),
                      //         disabledBorder: InputBorder.none,
                      //         border: InputBorder.none,
                      //         enabledBorder:InputBorder.none,
                      //
                      //
                      //       ),
                      //       onTap: (){
                      //         controller.clickOnAllLocationsTextField();
                      //       }
                      //   ),
                      // ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 10.px),
                        child: GooglePlaceAutoCompleteTextField(

                          boxDecoration: BoxDecoration(
                              color: greyColor.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(10.px),
                              border: Border.all(color: primary3Color.withOpacity(0.1), width: 1.px)),
                          textEditingController: controller.locationController,
                          googleAPIKey: ApiKeyConstants.googleMapKey,
                          textStyle: MyTextStyle.titleStyle14w,
                          inputDecoration: InputDecoration(
                            hintText: StringConstants.location,
                            border: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            hintStyle: MyTextStyle.titleStyle14b,
                            contentPadding: EdgeInsets.zero,
                           // prefixIcon: Icon(Icons.location_on_rounded,size: 20.px,color: primary3Color,),
                          ),
                          debounceTime: 400,
                          countries: ["in", "it", "us"],
                          isLatLngRequired: true,
                          itemClick: (prediction) async {
                            controller.clickOnLocation(prediction );
                          },
                          seperatedBuilder: Divider(),
                          containerHorizontalPadding: 10,
                          isCrossBtnShown: true,

                        ),
                      ),

                      SizedBox(height: 40.px,),

                    ],
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
