import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:home_swipping/app/data/api_constants/api_key_constants.dart';
import 'package:home_swipping/app/data/api_constants/api_url_constants.dart';
import 'package:home_swipping/app/data/constants/image_constants.dart';
import 'package:home_swipping/common/update_profile_detail.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/traveler_profile_pod_controller.dart';

class TravelerProfilePodView extends GetView<TravelerProfilePodController> {
  const TravelerProfilePodView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      resizeToAvoidBottomInset: false,
      body:Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(ImageConstants.imgExploreBackground,
            ),fit: BoxFit.fill)
        ),
        child: SafeArea(
          child: Obx((){
            controller.count.value;
            return controller.tabIndex.value==0?
            addTravelPod(context):controller.tabIndex.value==1?addTravel(context):conformTravelPod(context)
            ;
          }),
        ),
      ),
    );
  }
  Widget addTravelPod(BuildContext context){
    return Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(left:15.px,right: 15.px),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 0.px),
                leading: GestureDetector(
                  onTap: (){
                    Get.back();
                  },
                  child: CommonWidgets.appImagesView(
                      imagePath: IconConstants.icBack,
                      height: 35.px,width: 35.px
                  ),
                ),
                title:Padding(
                  padding:  EdgeInsets.only(right: 60.px),
                  child: Center(
                    child: CommonWidgets.typingText(text:'My travel pod',style: MyTextStyle.customStyle(
                        fontFamily: 'Lora',fontSize: 24,fontWeight: FontWeight.w500,color: primary3Color
                    ),),
                  ),
                )
            ),
               SizedBox(height: 20.px,),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                childAspectRatio: 130/42,
                mainAxisSpacing: 15.px

              ),
              itemCount: controller.myPodList.length,
              itemBuilder: (context, index) {
                return
                Container(
                  width: 120.px,height: 42.px,
                  padding:  EdgeInsets.all(10.px),
                  margin:  EdgeInsets.symmetric(horizontal: 10.px),
                  decoration: BoxDecoration(
                      color: primary3Color.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(30.px),
                      border: Border.all(
                          color: const Color(0xFF0D99FF).withOpacity(0.5), width: 2.px
                      )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CommonWidgets.imageView(
                          image:controller.myPodList[index].imageUrl??'',fit: BoxFit.cover,
                          width: 30.px, height: 30.px,borderRadius: BorderRadius.circular(15.px),
                          defaultNetworkImage: ApiUrlConstants.defaultUserProfile
                      ),
                      SizedBox(width: 5.px,),
                      Text(
                        controller.myPodList[index].name??'',
                        style: MyTextStyle.customStyle(color: primary3Color,fontSize: 12.px,fontFamily: 'Lora',fontWeight: FontWeight.w600),
                      ),

                    ],
                  ),
                );
              },
            ),

            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: (){
                  controller.tabIndex.value=1;
                },
                child:   Column(
                  children: [
                    CommonWidgets.appImagesView(imagePath: IconConstants.icAddPerson,
                        height: 90.px,width: 90.px),
                    SizedBox(height: 5.px,),
                    Text('Add Person',style: MyTextStyle.customStyle(fontWeight: FontWeight.w700,fontSize: 14,fontFamily: 'Lora',color: primary3Color),)
                  ],
                ),
              ),
            ),
            SizedBox(height: 50.px,),
            Align(
              alignment: Alignment.center,
              child: CommonWidgets.gradientButton(
                wantContentSizeButton: true,
                  width: 230.px,
                  height: 50.px,
                  onPressed: (){
                    controller.clickOnConfirmButton();
                  },
                text: StringConstants.confirm,
                buttonMargin: EdgeInsets.symmetric(horizontal: 15.px)
              ),
            ),
          ],
        )

    );
  }

  Widget addTravel(BuildContext context){
    return Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(left:15.px,right: 15.px,bottom: 15.px),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start  ,
          children: [

            ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 0.px),
                leading: GestureDetector(
                  onTap: (){
                    controller.tabIndex.value=0;
                  },
                  child: CommonWidgets.appImagesView(
                      imagePath: IconConstants.icBack,
                      height: 35.px,width: 35.px
                  ),
                ),
                title:Padding(
                  padding:  EdgeInsets.only(right: 60.px),
                  child: Center(
                    child: CommonWidgets.typingText(text:StringConstants.addATraveler,style: MyTextStyle.customStyle(
                        fontFamily: 'Lora',fontSize: 24,fontWeight: FontWeight.w700,color: primary3Color
                    ),),
                  ),
                )
            ),
            SizedBox(height: 50.px,),
            Text('What’s Your Name?',style: MyTextStyle.customStyle(fontSize: 15,fontWeight: FontWeight.w700,
                color: primary3Color,fontFamily: 'Lora'),),
            SizedBox(height: 20.px,),
            Container(
              height: 50.px,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.px),
                  border: Border.all(color: textGrey,width: 1.px)

              ),
              child: CommonWidgets.commonTextFieldForLoginSignUP(
                // hintText: StringConstants.phoneNo,
                  controller: controller.nameController,
                  autofocus: true,
                  isCard: true,
                  keyboardType: TextInputType.name,
                  contentPadding: EdgeInsets.zero,
                  style: MyTextStyle.titleStyle16bw
              ),
            ),
            SizedBox(height: 30.px,),
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.all(50.px),
                decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(150.px) ,
                    color: primary3Color.withOpacity(0.2),
                    border: const GradientBoxBorder(
                      gradient: LinearGradient(colors:
                      [Color(0xFF371A45), Color(0xFF415A99),Color(0xFFB7B8BE),
                        Color(0xFF4A99ED)]),
                      width: 4,
                    )
                ),
                child: Stack(
                  children: [
                    controller.travelImage.value!=null?
                    ClipRRect(
                      borderRadius: BorderRadius.circular(65.px),
                      child: Image.file(
                        height: 122.px,width: 122.px,
                        fit: BoxFit.cover,
                        File(
                          controller.travelImage.value!.path.toString(),
                        ),
                      ),
                    ):
                    Container(
                      height: 122.px,width: 122.px,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(color: primary3Color,width: 3.px),
                          borderRadius: BorderRadius.circular(65.px),
                          color: const Color(0xFFF0F0F0)
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Icon(
                        Icons.person,size: 62.px,color: Colors.grey,
                      ),
                    ),

                    Positioned(
                        bottom: 0.px,right: 0.px,
                        child: GestureDetector(
                          onTap: (){
                            controller.openBottomSheet(1);
                          },
                          child: CommonWidgets.appImagesView(imagePath: IconConstants.icCamera,
                            height: 46.px,width: 46.px,),
                        )
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 15.px,),

          /*  Wrap(
              children: controller.podTypeList.map((i) => GestureDetector(
                onTap: (){
                  controller.changeSelectedPodType(i);
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.px),
                    side: BorderSide(color: controller.selectedPodType.value==i?textGolden:textGrey,width: 1.px)
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 5.px,vertical: 8.px),

                  elevation: controller.selectedPodType.value==i?6.px:0.px,
                  color: controller.selectedPodType.value==i?primary3Color:transparentColor,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.px,vertical: 8.px),

                    child:   Text(i,style: MyTextStyle.customStyle(
                        fontFamily: 'Buenard',fontWeight: FontWeight.w700,fontSize: 15.px,color: text2Color
                    ),),
                  ),
                ),
              )).toList(),
            ),*/
            const Spacer(),
            controller.isLoading.value?
            Padding(
              padding: EdgeInsets.only(bottom: 30.px),
              child: Center(child: CupertinoActivityIndicator(color: primary3Color,radius: 15.px,)),
            ):
            Align(
              alignment: Alignment.center,
              child: CommonWidgets.gradientButton(
                  wantContentSizeButton: true,
                  width: 230.px,
                  height: 50.px,
                  onPressed: (){
                    if(controller.nameController.text.isNotEmpty && controller.travelImage.value!=null){
                      controller.clickOnSaveButton(context);
                    }else{
                      CommonWidgets.showSnackBar(context: context,message:'Please select name and profile image...',status: false);
                    }
                  },
                  text: StringConstants.save,
                  buttonMargin: EdgeInsets.symmetric(horizontal: 15.px)
              ),
            ),
          ],
        )

    );
  }

  Widget conformTravelPod(BuildContext context){
    return Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(left:15.px,right: 15.px,bottom: 15.px),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 0.px),
                leading: GestureDetector(
                  onTap: (){
                    controller.tabIndex.value=1;
                  },
                  child: CommonWidgets.appImagesView(
                      imagePath: IconConstants.icBack,
                      height: 35.px,width: 35.px
                  ),
                ),
                title:Padding(
                  padding:  EdgeInsets.only(right: 60.px),
                  child: Center(
                    child: CommonWidgets.typingText(text:StringConstants.createProfile,style: MyTextStyle.customStyle(
                        fontFamily: 'Lora',fontSize: 24,fontWeight: FontWeight.w500,color: primary3Color
                    ),),
                  ),
                )
            ),
            Text(StringConstants.confirmYourTravelPod,style: MyTextStyle.customStyle(
                fontSize: 24.px,fontWeight: FontWeight.w700,fontFamily: 'Lora',color:primary3Color
            ),),
            Text('Will anyone else be joining you on your adventures?',style: MyTextStyle.customStyle(fontSize: 16,fontFamily: 'Lora',fontWeight: FontWeight.w400,color:primary3Color)),
            SizedBox(height: 50.px,),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 180.px,height: 265.px,
                margin: EdgeInsets.only(left: 50.px,right: 50.px),
                padding: EdgeInsets.only(left:20.px,right: 20.px,top: 30.px),
                decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(150.px) ,
                    color: primary3Color.withOpacity(0.7),
                    border: Border.all(color: textGolden,width: 3.px)
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [

                        Container(
                          height: 122.px,width: 122.px,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(color: primary3Color,width: 3.px),
                              borderRadius: BorderRadius.circular(65.px),
                              color: Colors.grey.withOpacity(0.2)
                          ),
                          clipBehavior: Clip.hardEdge,
                          child: CommonWidgets.imageView(
                              image:UpdateProfileDetails.getUserModel?.user?.profileimage??'',
                            height: 122.px,width: 122.px,
                           borderRadius: BorderRadius.circular(61.px),
                          defaultNetworkImage: ApiUrlConstants.defaultUserProfile,
                          fit: BoxFit.cover)
                        ),
                        Positioned(
                            bottom: 0.px,right: 0.px,
                            child: GestureDetector(
                              onTap: (){
                               // controller.openBottomSheet(0);
                              },
                              child: CommonWidgets.appImagesView(imagePath: IconConstants.icCamera,
                                height: 48.px,width: 48.px,),
                            )
                        )
                      ],
                    ),
                    Text(UpdateProfileDetails.getUserModel?.user?.name??'',style: MyTextStyle.customStyle(fontSize: 24,fontWeight: FontWeight.w700,
                        color: text2Color,fontFamily: 'Lora'),textAlign: TextAlign.center,),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.px)
                      ),
                      elevation: 5.px,
                      color: primary3Color,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15.px,vertical: 8.px),
                        child: Text('Primary',style: MyTextStyle.customStyle(fontSize: 16,fontWeight: FontWeight.w400,
                            color: textGolden,fontFamily: 'Lora'),),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 10.px,),
            SizedBox(
              height: 148.px,
              child: ListView.builder(
                itemCount: controller.myPodList.length+1,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return controller.myPodList.length==index?
                  GestureDetector(
                    onTap: (){
                      controller.tabIndex.value=1;
                    },
                    child: Container(
                      height: 148.px,width: 96.px,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.px),
                          border: Border.all(color: textGrey,width: 3.px)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: 44.px,width: 44.px,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22.px),
                                  color: textGrey
                              ),
                              child: Icon(Icons.add,size: 30.px,color: primary3Color,)),
                          SizedBox(height: 10.px,),
                          Text('Traveler',style: MyTextStyle.customStyle(fontSize: 16,fontFamily: 'Lora',fontWeight: FontWeight.w400,color:text2Color)),

                        ],
                      ),
                    ),
                  ):
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Container(
                      height: 148.px,width: 96.px,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: primary3Color,
                          borderRadius: BorderRadius.circular(100.px),
                          border: Border.all(
                              color: textGolden, width: 2.px
                          )
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CommonWidgets.imageView(
                              image:controller.myPodList[index].imageUrl??'',fit: BoxFit.cover,
                              width: 42.px, height: 42.px,borderRadius: BorderRadius.circular(25.px),
                             defaultNetworkImage: ApiUrlConstants.defaultUserProfile
                          ),
                          SizedBox(width: 5.px,),
                          Text(
                            controller.myPodList[index].name??'',
                            style: MyTextStyle.customStyle(color: labelColor,fontSize: 14.px,fontFamily: 'Lora',fontWeight: FontWeight.w600),
                          ),
                          Text(
                            controller.myPodList[index].relation??'',
                            style: MyTextStyle.customStyle(color: labelColor,fontSize: 12.px,fontFamily: 'Lora',),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const Spacer(),


            CommonWidgets.gradientButton(
                wantContentSizeButton: true,
                width: MediaQuery.of(context).size.width,
                height: 50.px,
                onPressed: (){
                  controller.clickOnExploreButton();
                },
                text: StringConstants.confirm,
                buttonMargin: EdgeInsets.symmetric(horizontal: 15.px)
            ),
          ],
        )

    );
  }
}
