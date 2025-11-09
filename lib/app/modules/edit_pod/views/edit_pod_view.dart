import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:home_swipping/app/data/constants/icons_constant.dart';
import 'package:home_swipping/common/update_profile_detail.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/edit_pod_controller.dart';

class EditPodView extends GetView<EditPodController> {
  const EditPodView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBarView(title: StringConstants.editAboutUs),
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      body:Obx((){
        controller.count.value;
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

           GridView.builder(
               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 3,
                   mainAxisSpacing: 5.px,
                   crossAxisSpacing: 5.px,
                   childAspectRatio: 100/150
               ),
               shrinkWrap: true,
               physics:const NeverScrollableScrollPhysics(),
               padding: EdgeInsets.symmetric(horizontal: 15.px),
               itemCount: (UpdateProfileDetails.getUserModel?.user?.partners?.length??0)+1,
               itemBuilder: (context,index){
                 return (index!=UpdateProfileDetails.getUserModel?.user?.partners?.length && UpdateProfileDetails.getUserModel!.user!.partners!=null)?
                 Stack(
                   children: [
                     Container(
                       height: 148.px,width: 96.px,
                       padding: const EdgeInsets.all(5),
                       decoration: BoxDecoration(
                           color: primary3Color,
                           borderRadius: BorderRadius.circular(100.px),
                           border: Border.all(
                               color: textGolden, width: 3.px
                           )
                       ),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           CommonWidgets.imageView(
                               image:UpdateProfileDetails.getUserModel?.user?.partners?[index].imageUrl??'',fit: BoxFit.cover,
                               width: 50.px, height: 50.px,borderRadius: BorderRadius.circular(25.px)
                           ),
                           SizedBox(height: 15.px,),
                           Text(
                             UpdateProfileDetails.getUserModel?.user?.partners?[index].name??'',
                             style: MyTextStyle.customStyle(color: labelColor,fontSize: 14.px,fontFamily: 'Lora',fontWeight: FontWeight.w600),
                           ),
                           Text(
                             UpdateProfileDetails.getUserModel?.user?.partners?[index].relation??'',
                             style: MyTextStyle.customStyle(color: labelColor,fontSize: 12.px,fontFamily: 'Lora',),
                           ),
                         ],
                       ),
                     ),
                     Positioned(
                        top: 10.px,right: 8.px,
                         child: GestureDetector(
                           onTap:(){
                             controller.clickOnCross(index);
                           },
                           child: Container(
                             height: 25.px,width: 25.px,
                             alignment:Alignment.center,
                             decoration: BoxDecoration(
                                 color: primary3Color,
                                 borderRadius: BorderRadius.circular(15.px),
                                 border: Border.all(
                                     color: textGolden, width: 3.px
                                 )
                             ),
                             child:Icon(Icons.close_rounded,size: 20.px,color:const Color(0xFF3E3E3E),),
                           ),
                         )
                     )
                   ],
                 ):
                 GestureDetector(
                   onTap: (){
                     controller.clickOnAddTraveler();
                   },
                   child: Container(
                     height: 148.px,width: 96.px,
                     padding: const EdgeInsets.all(5),
                     decoration: BoxDecoration(
                         color: primary3Color,
                         borderRadius: BorderRadius.circular(100.px),
                         border: Border.all(
                             color: const Color(0xFFDADADA), width: 3.px
                         )
                     ),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                        CommonWidgets.appImagesView(
                            imagePath: IconConstants.icAddGrey,
                          height: 60.px,width: 45.px,fit: BoxFit.cover
                        ),
                         SizedBox(height: 15.px,),
                         Text('Traveler',
                           style: MyTextStyle.customStyle(color: labelColor,fontSize: 12.px,fontFamily: 'Lora',),
                         ),
                       ],
                     ),
                   ),
                 );
               }
           ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.px),
                  border: Border.all(width: 2.px,color: textGrey)
              ),
              margin: EdgeInsets.only(left: 30.px,right: 30.px,bottom: 30.px),
              child: CommonWidgets.commonElevatedButton(
                onPressed: (){
                  controller.clickOnSaveButton();
                },
                child: Text(StringConstants.save,style: MyTextStyle.customStyle(fontSize: 18,fontWeight: FontWeight.w700,
                    color: textGrey,fontFamily: 'Lora'),),
                borderRadius: 25.px,
                buttonColor: primary3Color,
              ),
            ),
          ],
        );
      }),
    );
  }
}
