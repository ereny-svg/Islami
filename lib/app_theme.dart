import 'package:flutter/material.dart';

class AppTheme {
  static const Color lightPrimary = Color(0xFFB7935F);
  static const Color darkPrimary = Color(0xFF141A2E);
  static const Color white = Color(0xFFF8F8F8);
  static const Color black = Color(0xFF242424);
  static const Color gold = Color(0xFFFACC10);

  static ThemeData lightTheme = ThemeData(
      primaryColor: lightPrimary,
      appBarTheme:const  AppBarTheme(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          titleTextStyle: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: lightPrimary,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: black,
        unselectedItemColor: white,
      ));
  static ThemeData darkTheme = ThemeData();
}
