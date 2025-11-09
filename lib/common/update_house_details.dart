import 'package:home_swipping/app/data/api_models/my_house_model.dart';

class UpdateHouseDetails {
  static MyHouseModel? myHouseModel;
  static  String city='';
  static  String country='';
  static  String houseId='';
  static  String description='';
  static  String lat='';
  static  String long='';
  static  String specificInstructions='';
  static  String sharingContext='';
  static Map<String,dynamic> moreAboutSpace={
  };

  static Map<String,dynamic> neighborhoodDetails={
  };
  static List<Map<String,String>> spaceQuestionAns=[];
  static List<String> features=[];
  static List<String> safetyItems=[];
  static List<String> spaceStyle=[];
  static List<String> relaxingFeatures=[];
  static List<String> houseRules=[];
  static List<String> homeCare=[];
}