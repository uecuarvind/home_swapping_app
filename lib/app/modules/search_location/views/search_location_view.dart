import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:home_swipping/common/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/search_location_controller.dart';

class SearchLocationView extends GetView<SearchLocationController> {
  const SearchLocationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: blackColor,
      body: Obx((){
        controller.count.value;
        return Container(
          height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImageConstants.imgExploreBackground),fit: BoxFit.cover
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15.px),
              child: Column(
                children: [
                TextFormField(
                controller: controller.locationController,

                style: MyTextStyle.customStyle(color: primary3Color,fontFamily: 'Lora',fontSize: 16.px,fontWeight: FontWeight.w700),
                decoration: InputDecoration(
                  hintText: StringConstants.enterDestination,
                  hintStyle: MyTextStyle.customStyle(color: primary3Color,fontFamily: 'Lora',fontSize: 16.px),
                  filled: true,
                  focusColor: primary3Color,
                  fillColor: primary3Color.withOpacity(0.2),
                  suffixIcon: IconButton(
                    icon:const Icon(Icons.close,color: primary3Color,),
                    onPressed: () {
                      controller.locationController.text='';
                    },
                  ),
                  prefixIcon: Icon(Icons.search,color: primary3Color,size: 25.px,),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                      )
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                      )
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  //labelText: 'Password',
                ),
                cursorColor: primary3Color,
                cursorWidth: 2.px,
                  onChanged: (value){
                  controller.searchCityName(value);
                  },
              ),
                  SizedBox(height: 20.px,),
                  ListView.builder(
                    itemCount: controller.suggestions.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {

                      return GestureDetector(
                        onTap: (){
                          controller.selectCity(index);
                        },
                        child: Container(
                          padding:  EdgeInsets.symmetric(vertical: 5.px),
                          decoration: const BoxDecoration(
                              color: Colors.transparent
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 5.px,),
                              CommonWidgets.appImagesView(
                                  imagePath: 'assets/images/paris.png',
                                  height: 90.px,width: 90.px,borderRadius: 20.px
                              ),
                              SizedBox(width: 15.px,),
                              Text(controller.suggestions[index],style: MyTextStyle.customStyle(fontWeight: FontWeight.w500,
                              fontSize: 20,fontFamily: 'Lora',color: primary3Color),)
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  const Spacer(),
                  Center(
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.px)
                      ),
                      color: primary3Color,
                      surfaceTintColor: primary3Color,
                      shadowColor: Colors.blue,
                      elevation: 15.px,
                      child: Container(
                        height: 50.px,width:160.px,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.px),
                            color: primary3Color
                        ),
                        child: InkWell(
                          onTap: (){
                            Get.back();
                          },
                          child: Center(
                            child: Text(StringConstants.set,
                              style: MyTextStyle.customStyle(color:const Color(0xFF090909),fontSize: 16.px,fontFamily: 'Lora',
                                  fontWeight: FontWeight.w700),),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
