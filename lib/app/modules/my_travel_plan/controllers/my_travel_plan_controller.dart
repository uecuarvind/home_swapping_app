import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_swipping/app/data/api_models/add_availability_model.dart';
import 'package:home_swipping/app/data/api_models/get_book_date_model.dart';
import 'package:home_swipping/common/update_house_details.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/api_constants/api_key_constants.dart';
import '../../../data/api_methods/api_methods.dart';
import '../../../data/api_models/get_house_detail.dart';
import '../../../data/constants/string_constants.dart';

class MyTravelPlanController extends GetxController {
  HouseDetails? houseDetails;
  //List<DateTime?> selectedDateRangeList = [];
  DateTime startRangDate =DateTime.now();
  DateTime? endRangeDate =DateTime.now();
 // List<DateTime?> homeSelectedDateRangeList = [];
  DateTime homeStartRangDate =DateTime.now();
  DateTime? homeEndRangeDate =DateTime.now().add(Duration(days: 5));
  List<String> bookedDateList=[];
  final tabIndex=1.obs;
  final count = 0.obs;
  final isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    callingHouseDetailApi(Get.context!);
    callingBookedDatesListApi(Get.context!,DateTime.now().month.toString(),DateTime.now().year.toString());
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
  changeTabIndex(int index){
    tabIndex.value=index;
  }

  bool checkAvailableDate(DateTime dateTime, ){
    if(houseDetails!=null && houseDetails!.avaibilityDates!=null){
      for (var dateRange in houseDetails!.avaibilityDates!) {
        if (dateRange.startDate != null && dateRange.endDate != null) {
          final startDate = DateTime.parse(dateRange.startDate!);
          final endDate = DateTime.parse(dateRange.endDate!);

          if (dateTime.isAfter(startDate.subtract(const Duration(seconds: 1))) &&
              dateTime.isBefore(endDate.add(const Duration(seconds: 1)))) {
            return true;
          }
        }
      }
    }
    return false;
  }


  void clickOnEdit(BuildContext context){
    showModalBottomSheet(
      backgroundColor: primary3Color,
        context: context,
        builder: (context) {
          return Container(
            height: 300.px,
            padding: EdgeInsets.all(15.px),
            child:Column(
              children: [
             Align(
               alignment: Alignment.centerLeft,
               child: GestureDetector(
                 onTap: (){
                   Get.back();
                 },
                 child: Icon(Icons.cancel_outlined,size: 25.px,color: Colors.grey,),
               ),
             ),
          Text('${(homeEndRangeDate!.difference(homeStartRangDate)).inDays} nights',
          style: MyTextStyle.customStyle(fontSize: 18.px,fontFamily: 'Buenard',fontWeight: FontWeight.w700,
          color:text2Color
          ),),
                Container(
                  height: 116.px,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 0.px,vertical: 15.px),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey,width: 1.px),
                    borderRadius: BorderRadius.circular(15.px)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.calendar_month_outlined,size: 20.px,color: Colors.black54,),
                          SizedBox(width: 5.px,),
                          Text('${homeStartRangDate.day} - ${homeEndRangeDate!.day} ',
                            style: MyTextStyle.customStyle(fontSize: 20.px,fontFamily: 'Lora',fontWeight: FontWeight.w700,
                                color:text2Color
                            ),),


                        ],
                      ),
                      Text('Edit Availability',
                        style: MyTextStyle.customStyle(fontSize: 18.px,fontFamily: 'Buenard',fontWeight: FontWeight.w700,
                            color:text2Color
                        ),),
                    ],
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.px)
                  ),
                  margin: EdgeInsets.only(left: 10.px,right: 10.px),
                  elevation: 10.px,
                  child: CommonWidgets.commonElevatedButton(
                    onPressed: (){
                      Get.back();
                    },

                    child: Text(StringConstants.set,style: MyTextStyle.customStyle(fontSize: 18,fontWeight: FontWeight.w700,
                        color: text2Color,fontFamily: 'Lora'),),
                    borderRadius: 25.px,
                    buttonColor: primary3Color,
                  ),
                ),
            ],
          ),
          );
        });
  }

  void showAlertBox(BuildContext context) {
    showCupertinoDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(StringConstants.request,style: MyTextStyle.titleStyle16bb,),
          content: Text(StringConstants.doYouWantToAcceptRequest,style: MyTextStyle.titleStyle14b,),
          actions: [
            CupertinoDialogAction(
              child:Text(StringConstants.stay,style: MyTextStyle.titleStyle16bb,),
              onPressed: () {
                clickOnSaveButton(context,'Stay');
                Get.back();
              },
            ),
            CupertinoDialogAction(
              child:Text(StringConstants.swap,style: MyTextStyle.titleStyle16bb,),
              isDestructiveAction: true, // Highlights this action in red
              onPressed: () {

                clickOnSaveButton(context,'Swap');
                Get.back();

              },
            ),
          ],
        );
      },
    );
  }


  void clickOnSaveButton(BuildContext context,String type) async {
    try {
      Map<String, dynamic> bodyParams = {
        ApiKeyConstants.startDate: DateFormat('yyyy-MM-dd').format(homeStartRangDate),
        ApiKeyConstants.endDate: DateFormat('yyyy-MM-dd').format(homeEndRangeDate??homeStartRangDate),
        ApiKeyConstants.availableFor:type

      };
      isLoading.value = true;
      AddAvailablityModel? addAvailablityModel =
      await ApiMethods.addAvailabilityApi(houseId:UpdateHouseDetails.myHouseModel?.houseDetails?.sId??'' ,bodyParams: bodyParams);
      if (addAvailablityModel != null && addAvailablityModel.success == true) {
        isLoading.value = false;
        callingHouseDetailApi(context);

      } else {
        print("Failed update.......");
        CommonWidgets.showSnackBar(context: context,message:'Failed added available your house...',status: false);
      }
      isLoading.value = false;
    }catch(e){
      isLoading.value = false;
      CommonWidgets.showSnackBar(context: context,message:'Some thing is wrong...',status: false);
    }
  }



  void callingHouseDetailApi(BuildContext context) async {
    try {
      HouseDetailModel? houseDetailModel =
      await ApiMethods.houseDetailsApi(houseId:UpdateHouseDetails.houseId??'');
      if (houseDetailModel != null && houseDetailModel.success == true && houseDetailModel.houseDetails!=null) {
        houseDetails=houseDetailModel.houseDetails;
        isLoading.value = false;
        increment();
        print('Successfully get:-${houseDetailModel.message}');
      } else {
        print("Failed update.......");
        CommonWidgets.showSnackBar(context: context,message:'Failed  house details...',status: false);
      }
      isLoading.value = false;
    }catch(e){
      isLoading.value = false;
      CommonWidgets.showSnackBar(context: context,message:'Some thing is wrong...',status: false);
    }
    increment();
  }

 /* void callingBookedDatesApi(BuildContext context) async {
    try {
      HouseDetailModel? houseDetailModel =
      await ApiMethods.houseDetailsApi(houseId:UpdateHouseDetails.houseId??'');
      if (houseDetailModel != null && houseDetailModel.success == true && houseDetailModel.houseDetails!=null) {
        houseDetails=houseDetailModel.houseDetails;
        isLoading.value = false;
        increment();
        print('Successfully get:-${houseDetailModel.message}');
      } else {
        print("Failed update.......");
        CommonWidgets.showSnackBar(context: context,message:'Failed  house details...',status: false);
      }
      isLoading.value = false;
    }catch(e){
      isLoading.value = false;
      CommonWidgets.showSnackBar(context: context,message:'Some thing is wrong...',status: false);
    }
    increment();
  }*/

  void callingBookedDatesListApi(BuildContext context,String month,String year) async {
    bookedDateList.clear();
    String monthTwoDigit=month.length==1?'0$month':month;
    try {
      BookedDateModel? bookedDateModel =
      await ApiMethods.getBookedDateApi(houseId:UpdateHouseDetails.houseId??'',month:monthTwoDigit ,year: year);
      if (bookedDateModel != null && bookedDateModel.success == true && bookedDateModel.dates!=null) {
        bookedDateList=bookedDateModel.dates!;
        print('Successfully get:-${bookedDateModel.message}');
      } else {
        print("Failed update.......");
        CommonWidgets.showSnackBar(context: context,message:'Failed  house details...',status: false);
      }
    }catch(e){
      CommonWidgets.showSnackBar(context: context,message:'Some thing is wrong...',status: false);
    }
    increment();
  }


  bool checkAvailable(DateTime datetime) {
    String formattedDate = "${datetime.year.toString().padLeft(4, '0')}-${datetime.month.toString().padLeft(2, '0')}-${datetime.day.toString().padLeft(2, '0')}";

    return bookedDateList.contains(formattedDate);
  }
}
