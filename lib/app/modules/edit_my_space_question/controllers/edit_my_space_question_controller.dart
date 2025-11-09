import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EditMySpaceQuestionController extends GetxController {
  TextEditingController answer1=TextEditingController();
  TextEditingController answer2=TextEditingController();
  TextEditingController answer3=TextEditingController();
  TextEditingController answer4=TextEditingController();
  TextEditingController answer5=TextEditingController();

  final count = 0.obs;

  List<String> questionList=[
  'What makes you feel at home in your\n home?',
    'What\'s your most treasured home\n item?',
    'Your go to place for interior decorating',
    'Favourite memory in your home ',
    'How would you describe your \nspaces style'
  ];
  List<String> hintList=[
    'The bookshelf full of my favorite books, my extra-comfy couch, and the warm ambient lighting from my favorite lamp. My home is my favorite place to unwind and I hope you\'ll find it feel like home to you too.',
  'My moroccan rugs from the Marrakech markets.',
    'Everything CB2.',
    'Bringing home your cat for the first time',
    'effortlessly chic'
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
