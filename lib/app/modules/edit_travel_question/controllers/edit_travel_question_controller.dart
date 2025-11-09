import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_swipping/app/data/api_methods/api_methods.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/update_profile_detail.dart';
import '../../../data/api_constants/api_key_constants.dart';
import '../../../data/api_models/get_user_model.dart';

class EditTravelQuestionController extends GetxController {
  TextEditingController answer1=TextEditingController();
  TextEditingController answer2=TextEditingController();
  TextEditingController answer3=TextEditingController();
  TextEditingController answer4=TextEditingController();
  TextEditingController answer5=TextEditingController();
  TextEditingController answer6=TextEditingController();
  TextEditingController answer7=TextEditingController();

  final count = 0.obs;
  final isLoading = false.obs;

  List<String> questionList=[
    'What makes your house a home?',
    'What inspires you to travel?',
    'Helpful tips you learned during your travels.',
    'What makes you feel at home in new places?',
    'What’s one thing you can’t travel without?',
    'Do you have a favorite traveling quote?',
    'Whats your traveling pet peeve?'
  ];
  List<String> hintList=[
    'The bookshelf full of my favorite books, my extra-comfy couch, and the warm ambient lighting from my favorite lamp. My home is my favorite place to unwind and I hope you\'ll find it feel like home to you too.',
    'My moroccan rugs from the Marrakech markets.',
    'Everything CB2.',
    'Bringing home your cat for the first time',
    'effortlessly chic',
    'enter your answer',
    'enter your answer'
  ];
  List<String> answerList=['','','','','','',''];
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
    for(int i=0;i<UpdateProfileDetails.getUserModel!.user!.spaceQuestionAns!.length;i++){
      for(int j=0;j<questionList.length;j++){
        if(UpdateProfileDetails.getUserModel?.user?.spaceQuestionAns![i].question==questionList[j]){
          switch(j){
            case 0:{
              answer1.text=UpdateProfileDetails.getUserModel?.user?.spaceQuestionAns![i].answer??'';
              answerList[j]=answer1.text;
              break;
            }
            case 1:{
              answer2.text=UpdateProfileDetails.getUserModel?.user?.spaceQuestionAns![i].answer??'';
              answerList[j]=answer2.text;
              break;
            }
            case 2:{
              answer3.text=UpdateProfileDetails.getUserModel?.user?.spaceQuestionAns![i].answer??'';
              answerList[j]=answer3.text;
              break;
            }
            case 3:{
              answer4.text=UpdateProfileDetails.getUserModel?.user?.spaceQuestionAns![i].answer??'';
              answerList[j]=answer4.text;
              break;
            }
            case 4:{
              answer5.text=UpdateProfileDetails.getUserModel?.user?.spaceQuestionAns![i].answer??'';
              answerList[j]=answer5.text;
              break;
            }
            case 5:{
              answer6.text=UpdateProfileDetails.getUserModel?.user?.spaceQuestionAns![i].answer??'';
              answerList[j]=answer5.text;
              break;
            }
            case 6:{
              answer6.text=UpdateProfileDetails.getUserModel?.user?.spaceQuestionAns![i].answer??'';
              answerList[j]=answer5.text;
              break;
            }
          }
        }
      }
    }
    increment();
  }

  void setAnswer(int index,String answer){
    answerList[index]=answer;
  }

  void clickOnSaveButton(BuildContext context){
    List<Map<String,String>> data=[];
    for(int i=0;i<7;i++){
      if(answerList[i]!=''){
        data.add({
          "question": questionList[i],
          "answer":answerList[i]
        });
      }
    }
    if(data.length>1){
      callingUpdateQuestionApi(data,context);
    }else{
      CommonWidgets.showSnackBar(context: context,message: 'Please enter answer minimum 2 questions',status: false);
    }
    // Get.toNamed(Routes.TRAVELER_PROFILE_TRAVEL_LOVE);
  }


  void callingUpdateQuestionApi(List<Map<String,String>> data,BuildContext context) async {
    try {
      Map<String, dynamic> bodyParams = {
        ApiKeyConstants.spaceQuestionAns: data,

      };
      isLoading.value = true;
      GetUserModel? getUserModel =
      await ApiMethods.updateUserDetailApi(bodyParams: bodyParams);
      if (getUserModel != null && getUserModel.success == true) {
        isLoading.value = false;
        CommonWidgets.showSnackBar(context:context,message:'Successfully updated your profile...');
        print("Successfully update.......");
        UpdateProfileDetails.getUserModel=getUserModel;
        Get.back(result: true);
      } else {
        print("Failed update.......");
        CommonWidgets.showSnackBar(context: context,message: 'Failed updated your profile...',status: false);
      }
      isLoading.value = false;
    }catch(e){
      isLoading.value = false;
      CommonWidgets.showSnackBar(context: context,message:'Some thing is wrong...',status: false);
    }
  }
}
