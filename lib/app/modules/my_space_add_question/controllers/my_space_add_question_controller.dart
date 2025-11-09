import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_swipping/app/routes/app_pages.dart';
import 'package:home_swipping/common/common_widgets.dart';
import 'package:home_swipping/common/update_house_details.dart';

class MySpaceAddQuestionController extends GetxController {
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
  List<String> answerList=['','','','','',''];
  @override
  void onInit() {
    super.onInit();
    checkSelectedAnswer();
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

  void checkSelectedAnswer(){
    if(UpdateHouseDetails.myHouseModel!=null &&UpdateHouseDetails.myHouseModel!.houseDetails!=null ){
      for(int i=0;i<UpdateHouseDetails.myHouseModel!.houseDetails!.spaceQuestionAns!.length;i++){
        for(int j=0;j<questionList.length;j++){
          if(UpdateHouseDetails.myHouseModel?.houseDetails?.spaceQuestionAns![i].question==questionList[j]){
            switch(j){
              case 0:{
                answer1.text=UpdateHouseDetails.myHouseModel?.houseDetails?.spaceQuestionAns![i].answer??'';
                answerList[j]=answer1.text;
                break;
              }
              case 1:{
                answer2.text=UpdateHouseDetails.myHouseModel?.houseDetails?.spaceQuestionAns![i].answer??'';
                answerList[j]=answer2.text;
                break;
              }
              case 2:{
                answer3.text=UpdateHouseDetails.myHouseModel?.houseDetails?.spaceQuestionAns![i].answer??'';
                answerList[j]=answer3.text;
                break;
              }
              case 3:{
                answer4.text=UpdateHouseDetails.myHouseModel?.houseDetails?.spaceQuestionAns![i].answer??'';
                answerList[j]=answer4.text;
                break;
              }
              case 4:{
                answer5.text=UpdateHouseDetails.myHouseModel?.houseDetails?.spaceQuestionAns![i].answer??'';
                answerList[j]=answer5.text;
                break;
              }
            }
          }
        }
      }
      increment();
    }

  }

  void setAnswer(int index,String answer){
    answerList[index]=answer;
   }

  void clickOnContinueButton(BuildContext context){
    List<Map<String,String>> data=[];
   for(int i=0;i<5;i++){
     if(answerList[i]!=''){
      data.add({
        "question": questionList[i],
        "answer":answerList[i]
      });
     }
   }
  if(data.length>1){
    UpdateHouseDetails.spaceQuestionAns=data;
    Get.toNamed(Routes.MY_SPACE_ADD_AMENITIES);
  }else{
    CommonWidgets.showSnackBar(context: context,message:'Please enter answer minimum 2 questions',status: false);
  }
  }

  void clickOnSkip(){
    Get.toNamed(Routes.MY_SPACE_ADD_AMENITIES);
  }
}
