import '../app/data/constants/icons_constant.dart';
import '../app/data/constants/image_constants.dart';

class TotalDreamList{
  static List<Map<String,dynamic>> dreamList = [
    {
      'image':'assets/images/img_barcelona.png',
      'place':'Barcelona',
      'status':false
    },
    {
      'image':'assets/images/img_lisbon.png',
      'place':'Lisbon',
      'status':false
    },
    {
      'image':'assets/images/img_miami.png',
      'place':'Miami',
      'status':false
    },
    {
      'image':'assets/images/img_barcelona.png',
      'place':'Barcelona',
      'status':false
    },
    {
      'image':'assets/images/img_lisbon.png',
      'place':'Lisbon',
      'status':false
    },

  ];

  static Map<String,dynamic>? checkDream(String name){
    for(int i=0;i<dreamList.length;i++){
      if(name==dreamList[i]['place']){
        return dreamList[i];
      }
    }
    return null;
  }

}