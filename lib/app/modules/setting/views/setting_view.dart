import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:home_swipping/app/data/constants/icons_constant.dart';
import 'package:home_swipping/common/common_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      //appBar: CommonWidgets.appBarView(),
      body: Obx((){
        controller.count.value;
        return Container(
          height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImageConstants.imgExploreBackground),fit: BoxFit.cover
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 5.px),
                    child: GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: CommonWidgets.appImagesView(
                          imagePath: IconConstants.icBack,
                        height: 35.px,width: 35.px,

                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child:  InkWell(
                      onTap: (){
                       controller.openBottomSheetFeedback(context);
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.px),
                            side: BorderSide(color: textGolden,width: 3.px)
                        ),
                        margin: EdgeInsets.only(right: 20.px),
                        color: primary3Color,
                        elevation:6.px,
                        child: Container(
                          height: 48.px,width: 130.px,
                          decoration: BoxDecoration(
                            color:primary3Color ,
                            borderRadius: BorderRadius.circular(25.px),
                          ),
                          child: Center(
                            child: Text(StringConstants.feedback,
                              style: MyTextStyle.customStyle(fontSize: 20.px,fontFamily: 'Buenard',fontWeight: FontWeight.w700,
                                  color: textGolden
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: 20.px),
                    child: Text(StringConstants.account,style: MyTextStyle.customStyle(color: primary3Color,
                      fontWeight: FontWeight.w700,fontSize: 20,fontFamily: 'Buenard'
                    ),),
                  ),
                  Divider(thickness: 1.px,color: Colors.grey,),
                  ListTile(
                    title: Text(StringConstants.manageMembership,style: MyTextStyle.customStyle(color: primary3Color,
                        fontWeight: FontWeight.w500,fontSize: 16,fontFamily: 'Lora'
                    ),),
                    trailing: Icon(Icons.arrow_forward_ios,size: 25.px,color: primary3Color,),
                  ),
                  Divider(thickness: 1.px,color: Colors.grey,),
                  ListTile(
                    title: Text(StringConstants.phoneNumber,style: MyTextStyle.customStyle(color: primary3Color,
                        fontWeight: FontWeight.w500,fontSize: 16,fontFamily: 'Lora'
                    ),),
                    trailing: Icon(Icons.arrow_forward_ios,size: 25.px,color: primary3Color,),
                  ),
                  Divider(thickness: 1.px,color: Colors.grey,),
                  Padding(
                    padding:  EdgeInsets.only(left: 20.px,top: 20.px,bottom: 10.px),
                    child: Text(StringConstants.privacy,style: MyTextStyle.customStyle(color: primary3Color,
                        fontWeight: FontWeight.w700,fontSize: 20,fontFamily: 'Buenard'
                    ),),
                  ),
                  Divider(thickness: 1.px,color: Colors.grey,),
                  ListTile(
                    title: Text(StringConstants.blockedUsers,style: MyTextStyle.customStyle(color: primary3Color,
                        fontWeight: FontWeight.w500,fontSize: 16,fontFamily: 'Lora'
                    ),),
                    trailing: Icon(Icons.arrow_forward_ios,size: 25.px,color: primary3Color,),
                  ),
                  Divider(thickness: 1.px,color: Colors.grey,),
                  ListTile(
                    title: Text(StringConstants.permissions,style: MyTextStyle.customStyle(color: primary3Color,
                        fontWeight: FontWeight.w500,fontSize: 16,fontFamily: 'Lora'
                    ),),
                    trailing: Icon(Icons.arrow_forward_ios,size: 25.px,color: primary3Color,),
                  ),
                  Divider(thickness: 1.px,color: Colors.grey,),
                  Padding(
                    padding:  EdgeInsets.only(left: 20.px,top: 20.px,bottom: 10.px),
                    child: Text(StringConstants.ourPurpose,style: MyTextStyle.customStyle(color: primary3Color,
                        fontWeight: FontWeight.w700,fontSize: 20,fontFamily: 'Buenard'
                    ),),
                  ),
                  Divider(thickness: 1.px,color: Colors.grey,),
                  ListTile(
                    title: Text(StringConstants.sustainability,style: MyTextStyle.customStyle(color: primary3Color,
                        fontWeight: FontWeight.w500,fontSize: 16,fontFamily: 'Lora'
                    ),),
                    trailing: Icon(Icons.arrow_forward_ios,size: 25.px,color: primary3Color,),
                  ),
                  Divider(thickness: 1.px,color: Colors.grey,),
                  ListTile(
                    title: Text(StringConstants.homeMoreProject,style: MyTextStyle.customStyle(color: primary3Color,
                        fontWeight: FontWeight.w500,fontSize: 16,fontFamily: 'Lora'
                    ),),
                    trailing: Icon(Icons.arrow_forward_ios,size: 25.px,color: primary3Color,),
                  ),
                  Divider(thickness: 1.px,color: Colors.grey,),
                  Padding(
                    padding:  EdgeInsets.only(left: 20.px,top: 20.px,bottom: 10.px),
                    child: Text(StringConstants.helpCenter,style: MyTextStyle.customStyle(color: primary3Color,
                        fontWeight: FontWeight.w700,fontSize: 20,fontFamily: 'Buenard'
                    ),),
                  ),
                  Divider(thickness: 1.px,color: Colors.grey,),
                  ListTile(
                    title: Text(StringConstants.spaceSharing101,style: MyTextStyle.customStyle(color: primary3Color,
                        fontWeight: FontWeight.w500,fontSize: 16,fontFamily: 'Lora'
                    ),),
                    trailing: Icon(Icons.arrow_forward_ios,size: 25.px,color: primary3Color,),
                  ),
                  Divider(thickness: 1.px,color: Colors.grey,),
                  ListTile(
                    title: Text(StringConstants.contactUs,style: MyTextStyle.customStyle(color: primary3Color,
                        fontWeight: FontWeight.w500,fontSize: 16,fontFamily: 'Lora'
                    ),),
                    trailing: Icon(Icons.arrow_forward_ios,size: 25.px,color: primary3Color,),
                  ),
                  Divider(thickness: 1.px,color: Colors.grey,),
                  ListTile(
                    title: Text(StringConstants.termsOfService,style: MyTextStyle.customStyle(color: primary3Color,
                        fontWeight: FontWeight.w500,fontSize: 16,fontFamily: 'Lora'
                    ),),
                    trailing: Icon(Icons.arrow_forward_ios,size: 25.px,color: primary3Color,),
                  ),
                  Divider(thickness: 1.px,color: Colors.grey,),
                  ListTile(
                    title: Text(StringConstants.privacyPolicy,style: MyTextStyle.customStyle(color: primary3Color,
                        fontWeight: FontWeight.w500,fontSize: 16,fontFamily: 'Lora'
                    ),),
                    trailing: Icon(Icons.arrow_forward_ios,size: 25.px,color: primary3Color,),
                  ),
                  Divider(thickness: 1.px,color: Colors.grey,),
            
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.px)
                    ),
                    margin: EdgeInsets.only(left: 30.px,right: 30.px,top: 15.px),
                    elevation: 10.px,
                    child: CommonWidgets.commonElevatedButton(
                      onPressed: (){
                        controller.clickOnLogout();
                      },
            
                      child: Text(StringConstants.logOut,style: MyTextStyle.customStyle(fontSize: 18,fontWeight: FontWeight.w700,
                          color: const Color(0xFFEC7A7A),fontFamily: 'Lora'),),
                      borderRadius: 25.px,
                      buttonColor: primary3Color,
                    ),
                  ),
            
                  SizedBox(height: 30.px,)
                ],
              ),
            ),
          ),
        );
      })
    );
  }
}
