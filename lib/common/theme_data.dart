
import 'package:flutter/material.dart';

class MThemeData {
  static ThemeData themeData() {
    return ThemeData(
      fontFamily: 'FontBold',
      primarySwatch:  Colors.orange,
      // primarySwatch:  Colors.lightBlue,
      primaryColor: const Color(0xffB4A794),
      secondaryHeaderColor:const Color(0xffB4A794), //Primary2Color
      backgroundColor:const Color(0xffFFFFFF),
      hintColor:const Color(0xFF9D9D9D),
      focusColor:const Color(0xFF222222), // TextColor
      hoverColor:const Color(0xFF6C6C6C), // labelColor
      highlightColor: const Color(0xffB4A794), // primary3Color
      unselectedWidgetColor: const Color(0xffB4A794), // primary3Color
    );
  }
}

