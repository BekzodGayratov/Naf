import 'package:flutter/material.dart';

class NafTheme {
  static const Color itemColor = Color(0xff000000);
  static ThemeData them = ThemeData(
    scaffoldBackgroundColor: const Color(0xffE5E5E5),
    cardColor: const Color(0xffFFFFFF),
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Color(0xff000000),
      ),
      headline2: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Color(0xff000000),
      ),
    ),
  );
}
