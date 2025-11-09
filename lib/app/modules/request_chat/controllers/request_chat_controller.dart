import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:home_swipping/app/routes/app_pages.dart';
import 'package:home_swipping/common/MyTextStyle.dart';
import 'package:home_swipping/common/cloudinary_image_upload.dart';
import 'package:home_swipping/common/colors.dart';
import 'package:home_swipping/common/common_widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../common/alert_dialog_view.dart';
import '../../../../common/socket_services.dart';
import '../../../data/api_constants/api_key_constants.dart';
import '../../../data/api_models/get_booking_model.dart';
import '../../../data/api_models/get_chat_message_model.dart';



class RequestChatController extends GetxController {
  final SocketService socketService = SocketService();
  //List<Map<String, String>> messages =[];
  List<ChatMessageModel> messages =[];
  TextEditingController messageController=TextEditingController();
  FocusNode messageFocus = FocusNode();
  BookingRequests bookingRequests=Get.arguments;
 Map<String,String?> parameter=Get.parameters;
  final count = 0.obs;
  final isLoading = false.obs;
  final isMessage = false.obs;
  final showSendButton = false.obs;
  SharedPreferences? prefs;
  void startListener() {
    messageFocus.addListener(onFocusChange);
  }

  void onFocusChange() {
    isMessage.value = messageFocus.hasFocus;
  }
  String otherUserId='';
  File? selectedFile;
  @override
  void onInit() async {
    prefs=await SharedPreferences.getInstance();
    super.onInit();
    startListener();
    initializeChat();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    socketService.disconnect();
    super.onClose();
  }

  void increment() => count.value++;

  void clickOnCalender(){
    Get.toNamed(Routes.TRIP_REQUEST);
  }

  void selectImageType(BuildContext context){
    double width=MediaQuery.of(context).size.width;
    showModalBottomSheet(
      context: context,
      elevation: 0,
      barrierColor: Colors.white.withOpacity(0),
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: 300.px,
        padding: const EdgeInsets.symmetric(vertical: 50),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft:  Radius.circular(20.0),
            topRight:  Radius.circular(20.0),
          ),
        ),
        clipBehavior: Clip.hardEdge,
        child: Column(
         mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: width,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: primary3Color,
                  borderRadius: BorderRadius.circular(10.px)
              ),
              child: Column(
                children: [
                  Container(
                    height: 50.px,
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () async {
                        Get.back();
                        getGalleryImage();
                      },
                      child: CommonWidgets.gradientText(
                        text: 'Choose from photo library',
                        style: MyTextStyle.titleStyle16bb,
                      ),
                    ),
                  ),
                  Divider(thickness: 1.px,color: Colors.black54,),
                  Container(
                    height: 50.px,
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () async {
                        Get.back();
                        getCameraImage();
                      },
                      child: CommonWidgets.gradientText(
                        text: 'Take a photo',
                        style: MyTextStyle.titleStyle16bb,
                      ),
                    ),
                  ),
                ],
              ),
            ),



            Container(
              height: 50.px,
              width: width,
              alignment: Alignment.center,
              margin:EdgeInsets.symmetric(vertical: 10.px) ,
              decoration: BoxDecoration(
                  color: primary3Color,
                borderRadius: BorderRadius.circular(10.px)
              ),
              child: GestureDetector(
                onTap: () async {
                  Get.back();
                },
                child: CommonWidgets.gradientText(
                  text: 'Cancel',
                  style: MyTextStyle.titleStyle16bb,
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
  //
  // void selectImageType(BuildContext context){
  //   showDialog(
  //     context: context,
  //     barrierDismissible: true,
  //     builder: (BuildContext context) {
  //       return MyAlertDialog(
  //         actions: [
  //           CupertinoDialogAction(
  //             isDefaultAction: true,
  //             child: Text(
  //               'Camera',
  //               style: MyTextStyle.titleStyle12bb,
  //             ),
  //             onPressed: () async {
  //               Navigator.of(context).pop();
  //               getCameraImage();
  //             },
  //           ),
  //           CupertinoDialogAction(
  //             isDefaultAction: true,
  //             child: Text(
  //               'Gallery',
  //               style: MyTextStyle.titleStyle12bb,
  //             ),
  //             onPressed: () async {
  //               Navigator.of(context).pop();
  //               getGalleryImage();
  //             },
  //           ),
  //         ],
  //         title: Text(
  //           'Select Image',
  //           style: Theme.of(context)
  //               .textTheme
  //               .displayMedium
  //               ?.copyWith(fontSize: 18),
  //         ),
  //         content: Text(
  //           'Choose image from the options below',
  //           style:
  //           Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 14),
  //         ),
  //       );
  //     },
  //   );
  // }

  Future getGalleryImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      print("Image :-${pickedFile.path}");
      selectedFile = File(pickedFile.path);
      showSendButton.value=true;
      increment();
    } else {
      print('No image selected ...');
    }
  }
  Future getCameraImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      print("Image :-${pickedFile.path}");
      selectedFile = File(pickedFile.path);
      showSendButton.value=true;
      increment();
    } else {
      print('No image selected ...');
    }
  }

  void initializeChat() async{
    prefs=await SharedPreferences.getInstance();
    print("self:-${prefs?.getString(ApiKeyConstants.userId.toString())}");
    print("user_id:--${bookingRequests.user?.sId}   ,,,, house_owner_id:---${bookingRequests.house?.houseOwner?.sId}");
    if(prefs?.getString(ApiKeyConstants.userId)==bookingRequests.house?.houseOwner!.sId.toString()){
      otherUserId=bookingRequests.user?.sId??'';
    }else{
      otherUserId= bookingRequests.house?.houseOwner?.sId??'';
    }

    // Connect to WebSocket
    socketService.connect('ws://157.173.222.27:4000', prefs?.getString(ApiKeyConstants.token)??'');

    // Listen to events

    // Listen to the connection status
    socketService.on('connect', (_) {
      print('Socket connected. Emitting message-page event....${prefs?.getString(ApiKeyConstants.userId)}');
      socketService.emit('message-page',otherUserId ); // Fetch previous messages
      // Fetch previous messages
      // socketService.on('message', (allMessage) {
      //   print('new message::--->${allMessage.toString()}');
      //   List<dynamic> data = allMessage;
      //
      //   // Map the dynamic data into a list of ChatMessageModel objects
      //   List<ChatMessageModel> chat = data.map((item) {
      //     return ChatMessageModel.fromJson(item);
      //   }).toList();
      //   messages.addAll(chat);
      // });
      // print('all message::--->${messages.toString()}');
    });

    // Listen to incoming messages
    socketService.onMessage((newMessage) {
      messages.clear();
      print('new message::--->${newMessage.toString()}');
      List<dynamic> data = newMessage;
      List<ChatMessageModel> chat = data.map((item) {
        return ChatMessageModel.fromJson(item);
      }).toList();
      messages.addAll(chat);

     /* if (newMessage is List) {
        // If the data is a list of messages
        for (var message in newMessage) {
          if (message is Map<String, dynamic>) {
            // Convert each message to Map<String, String>
            final parsedMessage = message.map((key, value) => MapEntry(key.toString(), value.toString()));
            messages.add(parsedMessage);
          } else {
            print('Invalid message format in list: $message');
          }
        }
      } else if (newMessage is Map<String, dynamic>) {
        // If the data is a single message
        final parsedMessage = newMessage.map((key, value) => MapEntry(key.toString(), value.toString()));
        messages.add(parsedMessage);
      } else {
        print('Invalid message format: $newMessage');
      }*/

      print('Messages after update::--->${messages.length.toString()}');
      increment();
    });

    // Listen to message-page data (previous messages)
    socketService.onMessagePage((data) {
      messages.addAll(data);
    });

    // Listen to online users
    socketService.onOnlineUser((onlineUsers) {
      print('Online Users: $onlineUsers');
    });

    // Listen to conversation updates
    socketService.onConversation((conversation) {
      print('Updated Conversation: $conversation');
    });


  }
  void sendMessage() async {
    print('start sending1....');
    String? imageUrl;
    if(selectedFile!=null){
      imageUrl= await CloudinaryService.uploadImage(selectedFile!);
    }
     String text = messageController.text.trim();

    final messageData = {
      'sender': prefs?.getString(ApiKeyConstants.userId)??'',
      'receiver': otherUserId,
      'text': text,
      'msgByUserId': prefs?.getString(ApiKeyConstants.userId)??'',
      'imageUrl':imageUrl??''
    };
    print('start sending2....${messageData.toString()}');
    // Emit the new message
    socketService.emitNewMessage(messageData);

    // Clear the input field
    text='';
    selectedFile=null;
    messageController.clear();
  }

  void clickOnProfile(){
    Map<String,String> data={
      ApiKeyConstants.userId:bookingRequests.house?.houseOwner?.sId??''
    };
    Get.toNamed(Routes.HOUSE_OWNER_DETAILS,parameters: data);
  }

  void clickOnReviewOffer(){
    Get.offNamed(Routes.REVIEW_YOUR_SEND_REQUEST,arguments: bookingRequests);

  }
  void clickOnViewDetails(){

    if(parameter[ApiKeyConstants.type]=='Booked'){
      Get.offNamed(Routes.BOOKED_DETAILS,arguments: bookingRequests);
    }else{
      Get.offNamed(Routes.HOST_REVIEW_REQUEST,arguments: bookingRequests);
    }
  }





}
