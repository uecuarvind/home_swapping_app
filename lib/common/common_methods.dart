import 'package:flutter/cupertino.dart';

class CommonMethods{
  static void unFocsKeyBoard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}