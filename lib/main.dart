import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'common/theme_data.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Home Swiping",
      initialRoute: AppPages.INITIAL,
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      theme: MThemeData.themeData(),
    ),
  );
}
