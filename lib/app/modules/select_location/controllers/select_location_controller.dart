import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SelectLocationController extends GetxController {
  //TODO: Implement SelectLocationController
  Map<String, String?> parameter = Get.parameters;

  TextEditingController locationController= TextEditingController();
   final selectDestinationIndex=0.obs;
   final selectLookingIndex=0.obs;
  final List<String> suggestions = [
    'New York, New York',
    'New York City, New York',
    'Newport, Oregon',
    'New Windsor, New York',
  ];
  List<Map<String,String>> topDestinationList=[
    {
      'location':"Paris",
      'image':"assets/images/paris.png"
    },
    {
      'location':"New York",
      'image':"assets/images/newyork.png"
    },
    {
      'location':"Amsterdam",
      'image':"assets/images/amsterdam.png"
    },
    {
      'location':"Mexico city",
      'image':"assets/images/maxicoCity.png"
    }
  ];
  List<Map<String,String>> stillLookingForList=[
    {
      'location':"Japan",
      'image':"assets/images/japan.png"
    },
    {
      'location':"Rome",
      'image':"assets/images/rome.png"
    },
    {
      'location':"Mexico city",
      'image':"assets/images/maxicoCity.png"
    },
    {
      'location':"Mexico city",
      'image':"assets/images/amsterdam.png"
    }
  ];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
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

  void clickOnSearch(){
    Get.toNamed(Routes.SEARCH_LOCATION);
  }

  onTapExplore(){
    String location = parameter['location']??'';
    location=locationController.text;
    print("Selected location :: "+location);
    Get.back(result: location);
  }
}
