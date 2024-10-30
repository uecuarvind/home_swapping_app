import 'package:get/get.dart';

class MyTravelPlanController extends GetxController {
  List<DateTime?> selectedDateRangeList = [];
  DateTime startRangDate =DateTime.now();
  DateTime? endRangeDate =DateTime.now();
  List<DateTime?> homeSelectedDateRangeList = [];
  DateTime homeStartRangDate =DateTime.now();
  DateTime? homeEndRangeDate =DateTime.now();
  final tabIndex=1.obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
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
}
