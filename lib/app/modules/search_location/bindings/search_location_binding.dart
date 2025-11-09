import 'package:get/get.dart';

import '../controllers/search_location_controller.dart';

class SearchLocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchLocationController>(
      () => SearchLocationController(),
    );
  }
}
