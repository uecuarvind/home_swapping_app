import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:home_swipping/app/data/constants/image_constants.dart';
import 'package:home_swipping/common/colors.dart';
import 'package:home_swipping/common/common_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../controllers/profile_percentage_controller.dart';

class ProfilePercentageView extends GetView<ProfilePercentageController> {
  const ProfilePercentageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: blackColor,
      body: Obx((){
        controller.count.value;
        return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImageConstants.imgBackgroundStar),
                  fit: BoxFit.fill
              )
          ),
          child: SafeArea(
            child: Padding(
              padding:  EdgeInsets.all(10.px),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Opacity(
                      opacity: 0.8,
                      child: CommonWidgets.appImagesView(imagePath: ImageConstants.imgBackgroundSpace,
                      height: 380.px,width: MediaQuery.of(context).size.width,
                      borderRadius: 250.px),
                    ),
                    Positioned(
                      bottom: 10.px,left: 15.px,right: 15.px,
                      child: Column(
                        children: [

                          SizedBox(height: 10.px,),

                          AnimatedBuilder(
                            animation: controller.animation,
                            builder: (context, child) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('creating profile',style: MyTextStyle.customStyle(fontSize: 16,
                                          fontWeight: FontWeight.w600,color: primary3Color,fontFamily: 'Lora'),),
                                      Text('${(controller.animation.value * 100).toInt()}%',style: MyTextStyle.customStyle(fontSize: 20,
                                          fontWeight: FontWeight.w600,color: primary3Color,fontFamily: 'Lora'),),

                                    ],
                                  ),
                                  SizedBox(height: 5.px,),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child: Container(
                                      height: 20,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.black,

                                        borderRadius: BorderRadius.circular(25),
                                        border:Border.all(color:Colors.grey,width: 0.5),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black54,
                                            blurRadius: 6,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: Stack(
                                        children: [
                                          FractionallySizedBox(
                                            alignment: Alignment.centerLeft,
                                            widthFactor: controller.animation.value,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                gradient: const LinearGradient(
                                                  colors: [
                                                    Color(0xFFC7FFD4), // light green
                                                    Color(0xFF7FB2FF), // light blue
                                                    Color(0xFF0A1D3C), // deep navy
                                                  ],
                                                  stops: [0.0, 0.5, 1.0],
                                                ),
                                                borderRadius: BorderRadius.circular(25),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
