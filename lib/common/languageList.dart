import '../app/data/constants/icons_constant.dart';
import '../app/data/constants/image_constants.dart';

class TotalLanguageList{
 static List<Map<String,dynamic>> languageList=[
    {
      'name':'English',
      'flag':ImageConstants.imgEnglishFlag,
      'status':false
    },
    {
      'name':'French',
      'flag':ImageConstants.imgFrenchFlag,
      'status':false
    },
    {
      'name':'Hindi',
      'flag':ImageConstants.imgIndiaFlag,
      'status':false
    },
    {
      'name':'Portuguese',
      'flag':IconConstants.icPortuguese,
      'status':false
    },
    {
      'name':'Italian',
      'flag':IconConstants.icItalian,
      'status':false
    },
    {
      'name':'German',
      'flag':IconConstants.icGerman,
      'status':false
    }
  ];

 static Map<String,dynamic>? checkLanguage(String name){
   for(int i=0;i<languageList.length;i++){
     if(name==languageList[i]['name']){
       return languageList[i];
     }
   }
   return null;
 }

}