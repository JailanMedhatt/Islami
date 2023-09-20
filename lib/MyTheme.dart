import 'package:flutter/material.dart';

class MyTheme {
  static const Color blackColor = Color(0xff242424);
  static const Color primaryyColor = Color(0xffB7935F);
  static const Color primaryDarkColor = Color(0xff141A2E);
  static const Color yellowColor = Color(0xffFACC1D);
  static ThemeData myTheme = ThemeData(
      primaryColor: primaryyColor,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          elevation: 0,
          color: Colors.transparent,
          centerTitle: true,
          iconTheme: IconThemeData(color: blackColor)),
      textTheme: TextTheme(
        titleLarge: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: blackColor),
        titleMedium: TextStyle(
            fontSize: 25, fontWeight: FontWeight.w400, color: blackColor),
        titleSmall: TextStyle(
            fontSize: 22, fontWeight: FontWeight.w500, color: blackColor),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: blackColor,
          unselectedItemColor: Colors.white,
          unselectedIconTheme: IconThemeData(size: 37)));
  static ThemeData darkTheme = ThemeData(
      primaryColor: primaryDarkColor,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          elevation: 0,
          color: Colors.transparent,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white)),
      textTheme: TextTheme(
        titleLarge: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        titleMedium: TextStyle(
            fontSize: 25, fontWeight: FontWeight.w400, color: Colors.white),
        titleSmall: TextStyle(
            fontSize: 22, fontWeight: FontWeight.w500, color: Colors.white),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: yellowColor,
          unselectedItemColor: Colors.white,
          unselectedIconTheme: IconThemeData(size: 37)));
}
