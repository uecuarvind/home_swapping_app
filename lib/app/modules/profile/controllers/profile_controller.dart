import 'package:get/get.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController

  final count = 0.obs;
  List<Map<String,String>> favoriteThingsList = [
    {
      'name':'🪂 Adventure',
    },
    {
      'name':'📷 Photography',
    },
    {
      'name':'Design',
    },{
      'name':'👜 Shopping',
    },

  ];

  List<Map<String,String>> languagelist = [
    {
      'language':'Portuguese',
      'icFlag':'assets/icons/ic_portuguese.png'
    },
    {
      'language':'Italian',
      'icFlag':'assets/icons/ic_italian.png'
    },
    {
      'language':'English',
      'icFlag':'assets/icons/ic_english.png'
    },
    {
      'language':'German',
      'icFlag':'assets/icons/ic_german.png'
    },

  ];
  List<Map<String,String>> travellerList = [
    {
      'image':'assets/images/img_traveler.png',
      'name':'James',
      'profile':'Traveler'
    },
    {
      'image':'assets/images/Img_partner.png',
      'name':'Paula',
      'profile':'Partner'
    },
    {
      'image':'assets/images/img_traveler.png',
      'name':'James',
      'profile':'Traveler'
    },
    {
      'image':'assets/images/Img_partner.png',
      'name':'Paula',
      'profile':'Partner'
    },
  ];

  List<Map<String,String>> dreamList = [
    {
      'image':'assets/images/img_barcelona.png',
      'place':'Barcelona'
    },
    {
      'image':'assets/images/img_lisbon.png',
      'place':'Lisbon'
    },
    {
      'image':'assets/images/img_miami.png',
      'place':'Miami'
    }
  ];

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
}
