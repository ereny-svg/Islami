import 'package:flutter/material.dart';

class AppTheme {
  static const Color lightPrimary = Color(0xFFB7935F);
  static const Color darkPrimary = Color(0xFF141A2E);
  static const Color white = Color(0xFFF8F8F8);
  static const Color black = Color(0xFF242424);
  static const Color gold = Color(0xFFFACC10);

  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      textTheme: const TextTheme(
          headlineSmall: TextStyle(
              color: black, fontSize: 25, fontWeight: FontWeight.w400),
          titleLarge: TextStyle(
              color: black, fontSize: 20, fontWeight: FontWeight.w400)),
      primaryColor: lightPrimary,
      appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(color: black),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          titleTextStyle: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: black)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: lightPrimary,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: black,
        unselectedItemColor: white,
      ));
  static ThemeData darkTheme = ThemeData();
}
