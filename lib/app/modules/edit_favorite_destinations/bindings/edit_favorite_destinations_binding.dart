import 'package:get/get.dart';

import '../controllers/edit_favorite_destinations_controller.dart';

class EditFavoriteDestinationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditFavoriteDestinationsController>(
      () => EditFavoriteDestinationsController(),
    );
  }
}
