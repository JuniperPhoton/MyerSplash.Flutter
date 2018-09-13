import 'package:flutter/material.dart';

class AppColor {
  static final Color themeColor = const Color(0xff18c3d8);
  static final Color themeColorDark = const Color(0xff159c9c);
}

Color parseColor(String hexCode) {
  if (hexCode.startsWith('#')) {
    hexCode = hexCode.substring(1);
  }
  List<String> hexDigits = hexCode.split('');
  int r = int.parse(hexDigits.sublist(0, 2).join(), radix: 16);
  int g = int.parse(hexDigits.sublist(2, 4).join(), radix: 16);
  int b = int.parse(hexDigits.sublist(4).join(), radix: 16);
  return new Color.fromARGB(255, r, g, b);
}