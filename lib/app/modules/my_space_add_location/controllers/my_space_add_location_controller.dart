
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:google_places_flutter_api/google_places_flutter_api.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:home_swipping/app/data/constants/icons_constant.dart';
import 'package:home_swipping/app/data/constants/image_constants.dart';
import 'package:home_swipping/app/data/constants/string_constants.dart';
import 'package:home_swipping/app/routes/app_pages.dart';
import 'package:home_swipping/common/update_house_details.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';

class MySpaceAddLocationController extends GetxController {
  TextEditingController locationController=TextEditingController();
  TextEditingController neighborhoodDetailController=TextEditingController();
  FocusNode focusAboutMe = FocusNode();
  final isAboutMe = true.obs;
  final lat = 51.1657.obs;
  final lon = 10.4515.obs;
  LatLng mapPosition = const LatLng(51.1657, 10.4515);
  GoogleMapController? xController;
  final count = 0.obs;
  final changeText = true.obs;
  String country='';
   BitmapDescriptor customMarker=BitmapDescriptor.defaultMarker;
  void loadCustomMarker() async {
    customMarker = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(48, 48)),
      IconConstants.icMapPin,
    );
    increment(); // Trigger a rebuild to apply the custom marker.
  }
  @override
  void onInit() {
    loadCustomMarker();
    super.onInit();
    checkPermission();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  Future<void> checkPermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      showPermissionAlert();
    } else {
      if(UpdateHouseDetails.myHouseModel?.houseDetails?.lat!=null &&
          UpdateHouseDetails.myHouseModel?.houseDetails?.lat!=null){
        lat.value =double.parse(UpdateHouseDetails.myHouseModel?.houseDetails?.lat??'0.0');
        lon.value = double.parse(UpdateHouseDetails.myHouseModel?.houseDetails?.long??'0.0');
        locationController.text=UpdateHouseDetails.myHouseModel?.houseDetails?.city??'';
        country=UpdateHouseDetails.myHouseModel?.houseDetails?.country??'';
        neighborhoodDetailController.text=UpdateHouseDetails.myHouseModel?.houseDetails?.neighborhoodDetails?.details??'';
        increment();
      }else{
        getCurrentLocation();
      }
    }
  }

  Future<void> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      print('Permission Denied.....');
      showPermissionAlert();
    } else {
      print('Permission Granted.....');
      Position currentPosition = await Geolocator.getCurrentPosition();

      lat.value = currentPosition.latitude;
      lon.value = currentPosition.longitude;
      List<Placemark> placemarks = await placemarkFromCoordinates(
        currentPosition.latitude,
        currentPosition.longitude,
      );
      Placemark place = placemarks[0];
      String fullAddress = '${place.street}, ${place.subLocality}, ${place.locality}, '
          '${place.postalCode}, ${place.country}';
      locationController.text=fullAddress;
      country=place.country??'';
      //LocalData.setLatLon(lat, lon,fullAddress);
      //manageSession();
    }
  }

  void showPermissionAlert() {
    showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.px)), //this right here
            child: Container(
              height: 450.px,
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.location_on,size: 100.px,color: primaryColor,),
                  SizedBox(
                    height: 20.px,
                  ),
                  Text(
                    StringConstants.enableLocation, style: MyTextStyle.titleStyle20bb,),
                  SizedBox(
                    height: 10.px,
                  ),
                  Text(
                    StringConstants
                        .toUseThisServicesWeNeedPermissionToAccess,
                    style: MyTextStyle.titleStyle12b,
                    textAlign: TextAlign.center,
                  ),
                  CommonWidgets.commonElevatedButton(
                      onPressed: () async {
                        Get.back();
                        LocationPermission permission =
                        await Geolocator.requestPermission();
                        if (permission == LocationPermission.denied) {
                          print('Permission Denied.....');
                          showPermissionAlert();
                        } else {
                          print('Permission Granted.....');
                          getCurrentLocation();
                        }
                      },
                      child: Text(
                        StringConstants.enableLocation,
                        style: MyTextStyle.titleStyle16bw,
                      ),
                      buttonMargin: EdgeInsets.only(bottom: 10.px, top: 20)),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                      CommonWidgets.showSnackBar(context: context,message:
                          'Without location permission you can not use app...',status: false);
                      showPermissionAlert();
                    },
                    child: Container(
                      height: 50.px,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 10.px, bottom: 20.px),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.px),
                          color: primaryColor.withOpacity(0.8)),
                      child: Text(
                        StringConstants.cancel, style: MyTextStyle.titleStyle16bw,),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void onMapTapped(LatLng position) async {
    mapPosition = position;
    print("Position:-${position.latitude},${position.latitude}");
    List<Placemark> placemarks =
    await placemarkFromCoordinates(position.latitude, position.longitude);
    if (changeText.value)
      locationController.text =
      '${placemarks.reversed.last.locality ?? ''},${placemarks.reversed.last.street ?? ''},${placemarks.reversed.last.administrativeArea ?? ''},'
          '${placemarks.reversed.last.postalCode ?? ''},${placemarks.reversed.last.country ?? ''}';
    lat.value = position.latitude;
    lon.value = position.longitude;
    country=placemarks.reversed.last.country ?? '';
    xController!.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: position,
      zoom: 13,
    )));
    increment();
  }

  void clickOnLocation(Prediction prediction) async {
    locationController.text = prediction.description ?? "";
    locationController.selection = TextSelection.fromPosition(
        TextPosition(offset: prediction.description?.length ?? 0));
    final locations = await locationFromAddress(prediction.description ?? '');
    onMapTapped(LatLng(locations.first.latitude, locations.first.longitude));


  }
/*
  clickOnAllLocationsTextField() async {
    changeText.value = false;
    Prediction? p = await PlacesAutocomplete.show(
      context: Get.context!,
      apiKey: "AIzaSyDT62NXFvZu9qKdh96SkstdkV43cXadFyc",
      mode: Mode.overlay,
    );
    if (p != null) {
      locationController.text = p.description ?? '';
      final locations = await locationFromAddress(p.description ?? '');
      onMapTapped(LatLng(locations.first.latitude, locations.first.longitude));
      changeText.value = true;
      print('Lat_Long :-$lat,$lon');
    } else {
      changeText.value = true;
    }
  }*/




  void clickOnContinueButton()async{
    await HapticFeedback.heavyImpact();
    await Haptics.vibrate(HapticsType.heavy);
    UpdateHouseDetails.lat=lat.value.toString();
    UpdateHouseDetails.long=lat.value.toString();
    UpdateHouseDetails.city=locationController.text.toString();
    UpdateHouseDetails.country=country;
    UpdateHouseDetails.neighborhoodDetails={
      "details":neighborhoodDetailController.text.toString(),
    };
    Get.back();
   // Get.toNamed(Routes.MY_SPACE_ADD_QUESTION);
    //Get.toNamed(Routes.MY_SPACE_ADD_AMENITIES);
    Get.toNamed(Routes.MY_SPACE_ADD_FEATURES);
  }

  void openBottomSheet(BuildContext context){
    double width=MediaQuery.of(context).size.width;
    showModalBottomSheet(
      context: context,
      elevation: 0,
      barrierColor: Colors.white.withOpacity(0),
      backgroundColor: Colors.transparent,
      builder: (context) =>SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 250.px,
              padding:  EdgeInsets.symmetric(vertical: 20,horizontal: 10.px),
              margin: EdgeInsets.only(left: 10.px,right: 10.px,bottom: 10.px),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft:  Radius.circular(20.0),
                  topRight:  Radius.circular(20.0),
                ),
                image: DecorationImage(
                    image: AssetImage(ImageConstants.imgLocationBackground),
                    fit: BoxFit.fill,
                  opacity: 0.9
                ),
              ),
              clipBehavior: Clip.hardEdge,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CommonWidgets.appImagesView(imagePath: IconConstants.icCamera,
                  height: 50.px,width: 50.px),
                  Container(
                    padding: EdgeInsets.all(5.px),
                    margin: EdgeInsets.only(left: 5.px,right: 5.px,top: 10.px,bottom: 20.px),
                    decoration: BoxDecoration(
                        color: primary3Color.withOpacity(0.20),
                        borderRadius: BorderRadius.circular(12.px),
                        border: Border.all(color: textGrey,width: 1.px)
                    ),
                    child: CommonWidgets.commonTextFieldForLoginSignUP(
                        hintText: 'Share what makes your neighborhood special to you. Any helpful transportation or safety tips?',
                        controller:neighborhoodDetailController,

                        autofocus: true,
                        isCard: true,
                        maxLines: 4,
                        contentPadding: EdgeInsets.zero,
                        keyboardType: TextInputType.text,
                        style: MyTextStyle.customStyle(fontWeight: FontWeight.w600,fontFamily: 'Lora',fontSize: 15,color: primary3Color),
                        hintStyle: MyTextStyle.customStyle(fontWeight: FontWeight.w500,fontFamily: 'Lora',fontSize: 14,color: primary3Color),
                    ),
                  ),



                ],
              ),
            ),

            CommonWidgets.gradientButton(
                onPressed: (){
                  if(neighborhoodDetailController.text.isNotEmpty){
                    clickOnContinueButton();
                  }else{
                    CommonWidgets.showSnackBar(context: context,message:'Please enter neighborhood details...',status: false);
                  }
                },text: StringConstants.continueText,
              buttonMargin: EdgeInsets.symmetric(vertical: 15.px)
            )
          ],
        ),
      ),
    );
  }
/*
  void openBottomSheet(){
    showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      barrierColor: Colors.transparent.withOpacity(0.5),
      backgroundColor: primary3Color,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topRight: Radius.circular(15.px),topLeft: Radius.circular(15.px)),
      ),
      builder: (BuildContext context) {
        return Container(
          constraints: BoxConstraints(minHeight: 400.px,maxHeight:MediaQuery.of(context).size.height-120.px),
          padding: EdgeInsets.all(15.px),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: (){
                    Get.back();
                  },
                    child: Icon(Icons.close,size: 20.px,color: Colors.black,)),
              ),
              Text('The Soul of the neighborhood',style: MyTextStyle.customStyle(fontSize: 20,fontWeight: FontWeight.w700,
                  color: text2Color,fontFamily: 'Lora'),),

              Container(
                padding: EdgeInsets.all(5.px),
                margin: EdgeInsets.only(left: 5.px,right: 5.px,top: 20.px,bottom: 20.px),
                decoration: BoxDecoration(
                    color: primary3Color,
                    borderRadius: BorderRadius.circular(12.px),
                    border: Border.all(color: textGrey,width: 1.px)
                ),
                child: CommonWidgets.commonTextFieldForLoginSignUP(
                    hintText: 'Share what makes your neighborhood special to you. Any helpful transportation or safety tips?',
                    controller:neighborhoodDetailController,

                    autofocus: true,
                    isCard: true,
                    maxLines: 5,
                    contentPadding: EdgeInsets.zero,
                    keyboardType: TextInputType.text,
                    style: MyTextStyle.customStyle(fontWeight: FontWeight.w500,fontFamily: 'Buenard',fontSize: 15,color: text2Color)
                ),
              ),
              SizedBox(height: 20.px,),
              DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(15.px),
                padding: EdgeInsets.all(0.px),
                dashPattern: [15,12],
                color: textGolden,
                child: Container(
                  height: 130.px,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.all(5.px),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.px),
                    color: const Color(0xFFFFFBF2)
                  ),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonWidgets.appImagesView(
                          imagePath: IconConstants.icRectangularGallery,
                      height: 30.px,width: 30.px),
                      SizedBox(height: 10.px,),
                      Text(StringConstants.uploadPictures,style: MyTextStyle.customStyle(fontSize: 16,fontWeight: FontWeight.w700,
                          color: text2Color,fontFamily: 'Buenard'),),
                    ],
                  ) ,
                ),
              ),
              SizedBox(height: 20.px,),
              DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(15.px),
                padding: EdgeInsets.all(0.px),
                dashPattern: [15,12],
                color: textGolden,
                child: Container(
                  height: 130.px,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.all(5.px),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.px),
                      color: const Color(0xFFFFFBF2)
                  ),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonWidgets.appImagesView(
                          imagePath: IconConstants.icVideo,
                          height: 30.px,width: 30.px),
                      SizedBox(height: 10.px,),
                      Text(StringConstants.uploadVideo,style: MyTextStyle.customStyle(fontSize: 16,fontWeight: FontWeight.w700,
                          color: text2Color,fontFamily: 'Buenard'),),
                    ],
                  ) ,
                ),
              ),
              SizedBox(height: 40.px,),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.px)
                ),
                margin: EdgeInsets.only(left: 30.px,right: 30.px),
                elevation: 10.px,
                child: CommonWidgets.commonElevatedButton(
                  onPressed: (){
                   if(neighborhoodDetailController.text.isNotEmpty){
                     clickOnContinueButton();
                   }else{
                     CommonWidgets.showSnackBar(context: context,message:'Please enter neighborhood details...',status: false);
                   }
                  },
                  child: Text(StringConstants.continueText,style: MyTextStyle.customStyle(fontSize: 18,fontWeight: FontWeight.w700,
                      color: text2Color,fontFamily: 'Lora'),),
                  borderRadius: 25.px,
                  buttonColor: primary3Color,
                ),
              ),
              SizedBox(height: 12.px,),
              GestureDetector(
                onTap: (){
                  clickOnSkip();
                },
                child: Center(
                  child: Text(
                    StringConstants.skipForNow,
                    style: MyTextStyle.customStyle(
                        fontSize: 16.px,
                        color: text2Color,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Lora'
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.px,)
            ],
          ),
        );
      },
    );
  }*/
}
