import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/image_constants.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Obx((){
        controller.count.value;
        return SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: CommonWidgets.appImagesView(
              imagePath: ImageConstants.imageSplash
          ),

        );
      }),
    );
  }
}
