import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchLocationController extends GetxController {

  TextEditingController locationController= TextEditingController();
   List<String> cityList = [
    'New York, New York',
    'New York City, New York',
    'Newport, Oregon',
    'New Windsor, New York',
  ];
   List<String> suggestions = [
  ];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    suggestions=cityList;
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
  void  searchCityName(String query) async {
  suggestions=cityList
      .where((suggestion) =>
  suggestion.toLowerCase().contains(query.toLowerCase()))
      .toList();
  increment();
  }


  void selectCity(int index){
    locationController.text=suggestions[index];
    increment();
  }
}
