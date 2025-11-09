import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:home_swipping/app/data/api_constants/api_key_constants.dart';
import 'package:home_swipping/app/data/api_constants/api_url_constants.dart';
import 'package:home_swipping/app/data/api_models/get_chat_message_model.dart';
import 'package:home_swipping/app/data/constants/image_constants.dart';
import 'package:home_swipping/app/data/constants/string_constants.dart';
import 'package:home_swipping/common/dateRangeFormate.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../controllers/request_chat_controller.dart';

class RequestChatView extends GetView<RequestChatController> {
  const RequestChatView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx((){
      controller.count.value;
      return Scaffold(

          backgroundColor: blackColor,

          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Container(
           // height: controller.selectedFile != null ? 170.px :90.px,
            padding: EdgeInsets.symmetric(horizontal: 10.px,vertical: 20.px),
           // margin: EdgeInsets.only(bottom: 20.px),
            decoration: BoxDecoration(
              color: primary3Color.withOpacity(0.15)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (controller.selectedFile != null)
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.px),
                        child: Image.file(
                          controller.selectedFile!,
                          height: 80.px,
                          fit: BoxFit.fill,
                          width: 80.px,
                        ),
                      ),
                      Positioned(
                        top: 2.px,
                        right: 2.px,
                        child: GestureDetector(
                          onTap: () {
                            controller.selectedFile = null;
                            controller.increment();
                          },
                          child: Icon(
                            Icons.close,
                            size: 25.px,
                            color: Colors.redAccent,
                          ),
                        ),
                      )
                    ],
                  ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        controller.clickOnCalender();
                      },
                      child: CommonWidgets.appImagesView(
                          imagePath: IconConstants.icCalender,
                          height: 25.px,width: 24.px,
                          color:primary3Color
                      ),
                    ),
                    SizedBox(width: 5.px,),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15.px,),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.px),
                            color: blackColor.withOpacity(0.4),
                            border: Border.all(color:controller.isMessage.value?textGolden:primary3Color,
                                width: 1.px)
                        ),
                        child: TextFormField(
                          controller: controller.messageController,
                          focusNode: controller.messageFocus,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          style: MyTextStyle.customStyle(fontFamily: 'Lora',
                              fontSize: 14,fontWeight: FontWeight.w600,color: primary3Color),
                          onChanged: (value){
                            if(controller.messageController.text.isNotEmpty){
                              controller.showSendButton.value=true;
                            }else{
                              controller.showSendButton.value=false;
                            }
                          },
                          decoration: InputDecoration(
                            hintText: 'Write a message',
                            hintStyle: MyTextStyle.customStyle(fontFamily: 'Lora',
                                fontSize: 14,fontWeight: FontWeight.w500,color: primary3Color),
                            disabledBorder: InputBorder.none,
                            border: InputBorder.none,
                            enabledBorder:InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 10.px,horizontal: 0.px),
                            suffixIconConstraints: BoxConstraints(maxWidth: 25.px),
                              suffixIcon:  Obx((){
                              controller.showSendButton.value;
                              return GestureDetector(
                                onTap: (){
                                  if(controller.messageController.text.isNotEmpty || controller.selectedFile!=null){
                                    controller.sendMessage();
                                  }else{
                                    CommonWidgets.showSnackBar(message: 'Please enter message first...', context: context);
                                  }
                                },
                                child: controller.showSendButton.value?
                                Icon(Icons.send,size: 30.px,color: textGolden,):
                                SizedBox(width: 5.px,)
                              );
                            })



                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5.px,),
                    GestureDetector(
                      onTap: (){
                        controller.selectImageType(context);
                      },
                      child: CommonWidgets.appImagesView(
                          imagePath: IconConstants.icRectangularGallery,
                          height: 25.px,width: 25.px,color: primary3Color
                      ),
                    ),
                    SizedBox(width: 5.px,),
                    CommonWidgets.appImagesView(
                      imagePath: IconConstants.icBlackMic,
                      height: 40.px,width: 40.px,
                    ),

                  ],
                ),
              ],
            ),
          ),
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(5.0.px),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          controller.clickOnProfile();
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CommonWidgets.imageView(image: controller.bookingRequests.house?.houseOwner?.profileimage??'',
                                defaultNetworkImage: ApiUrlConstants.defaultUserProfile,height: 44.px,width: 44.px,
                                borderRadius: BorderRadius.circular(22.px)),

                            Text(
                              controller.bookingRequests.house?.houseOwner?.name??'',
                              style: MyTextStyle.customStyle(fontSize: 14,fontWeight: FontWeight.w700,color: Colors.black,fontFamily: 'Lora'),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  controller.bookingRequests.startDate!=null?DateRangeFormat.formatDateRange(controller.bookingRequests.startDate.toString(), controller.bookingRequests.endDate.toString()):'',
                                  style: MyTextStyle.titleStyle10grey,
                                ),
                                Icon(Icons.location_on,size: 20.px,color:textGolden,),
                                Text(
                                  controller.bookingRequests.house?.city??'',
                                  style: MyTextStyle.titleStyle10grey,overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        left: 10.px,top: 0.px,
                        child: GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: CommonWidgets.appImagesView(imagePath: IconConstants.icBack,
                            height: 35.px,width: 35.px)),
                      ),
                      Positioned(
                        right: 10.px,top: 0.px,
                        child: GestureDetector(
                          onTap: (){

                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 15.px,vertical: 6.px),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.px),
                                color: greyColor,
                            ),
                            child: Text(
                              '${controller.bookingRequests.lookingFor} ${controller.bookingRequests.status} ',
                              style: MyTextStyle.customStyle(fontSize: 12,fontWeight: FontWeight.w600,color: primary3Color,fontFamily: 'Lora'),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Divider(thickness: 1.px,color: primary3Color.withOpacity(0.2),),
                SizedBox(height: 10.px,),
                controller.parameter[ApiKeyConstants.type]=='My'?
                GestureDetector(
                  onTap: (){
                    controller.clickOnReviewOffer();
                  },
                  child: Column(
                    children: [
                      Text('You sent dates to ${controller.bookingRequests.lookingFor} for ${DateRangeFormat.formatDateRange(controller.bookingRequests.startDate.toString(),
                          controller.bookingRequests.endDate.toString())}',style: MyTextStyle.customStyle(fontSize: 12,fontWeight: FontWeight.w600,color: const Color(0xFFB7B8BE),
                          fontFamily: 'Lora'),),
                      Text('Review Offer',style: MyTextStyle.customStyle(fontFamily: 'Lora',fontWeight: FontWeight.w700,fontSize: 12,
                          color: const Color(0xFFCFBDA5)),)
                    ],
                  ),
                ):
                GestureDetector(
                  onTap: (){
                    controller.clickOnViewDetails();
                  },
                  child: Column(
                    children: [
                      Text('Your received ${controller.bookingRequests.lookingFor} offer ${controller.bookingRequests.status}',style: MyTextStyle.customStyle(fontSize: 12,fontWeight: FontWeight.w600,color: const Color(0xFFB7B8BE),
                          fontFamily: 'Lora'),),
                      Text('View Details',style: MyTextStyle.customStyle(fontFamily: 'Lora',fontWeight: FontWeight.w700,fontSize: 12,
                          color: const Color(0xFFCFBDA5)),)
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.messages.length,
                      shrinkWrap: true,
                     // physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context,index){
                      ChatMessageModel item=controller.messages[index];
                        return Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 7.px),
                          child: Align(
                            alignment: item.msgByUserId==controller.otherUserId?Alignment.centerLeft:Alignment.centerRight,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: item.msgByUserId==controller.otherUserId?MainAxisAlignment.start:MainAxisAlignment.end,
                              children: [
                                if(controller.parameter[ApiKeyConstants.type]=='My')
                                 Padding(padding: EdgeInsets.only(bottom: 20.px),
                                 child:  CommonWidgets.imageView(
                                     image: controller.bookingRequests.user?.profileimage??
                                         ApiUrlConstants.defaultUserProfile,
                                     defaultNetworkImage: ApiUrlConstants.defaultUserProfile,
                                     height: 40.px,width: 40.px,
                                     borderRadius: BorderRadius.circular(20.px)
                                 ),),
                                Container(
                                  constraints: BoxConstraints(maxWidth: 300.px,minWidth: 60.px),
                                    margin: EdgeInsets.symmetric(horizontal: 15.px,vertical: 20.px),
                                    padding: EdgeInsets.all(10.px),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10.px),
                                        topLeft: Radius.circular(10.px),
                                        bottomRight: item.msgByUserId==controller.otherUserId?Radius.circular(10.px):Radius.circular(0.px),
                                        bottomLeft:item.msgByUserId==controller.otherUserId?Radius.circular(0.px):Radius.circular(10.px),
                                      ),
                                      color: item.msgByUserId==controller.otherUserId?primary3Color.withOpacity(0.3):primary3Color
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        if(item.imageUrl!=null && item.imageUrl!='')
                                          CommonWidgets.imageView(
                                              image: item.imageUrl??ApiUrlConstants.errorImage,
                                          height: 80.px,width: 80.px,
                                          defaultNetworkImage: ApiUrlConstants.errorImage),
                                        if(item.text!='')
                                        Text(item.text??'',style: item.msgByUserId==controller.otherUserId?MyTextStyle.titleStyle14w:MyTextStyle.titleStyle14b,),
                                      ],
                                    )
                                ),
                                if(controller.parameter[ApiKeyConstants.type]!='My')
                                Padding(
                                    padding: EdgeInsets.only(bottom: 20.px),
                                  child:   CommonWidgets.imageView(
                                      image: controller.bookingRequests.house?.houseOwner?.profileimage??
                                          ApiUrlConstants.defaultUserProfile,
                                      defaultNetworkImage: ApiUrlConstants.defaultUserProfile,
                                      height: 40.px,width: 40.px,
                                      borderRadius: BorderRadius.circular(20.px)
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }
                  ),
                ),
                SizedBox(height: 100.px,)
              ],
            ),
          )
      );
    });
  }
}
