import 'package:get/get.dart';

import '../controllers/first_like_controller.dart';

class FirstLikeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FirstLikeController>(
      () => FirstLikeController(),
    );
  }
}
