import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingProvider with ChangeNotifier {
  SettingProvider() {
    changeTheme();
    changeLanguage();
  }
  late SharedPreferences prefs;
  bool mode = false;
  ThemeMode themeMode = ThemeMode.light;
  String languageCode = 'en';
  bool get isDark => themeMode == ThemeMode.dark;
  String get backGroundName =>
      themeMode == ThemeMode.light ? 'default_bg.png' : 'dark_bg.png';
  String get imageSebha => themeMode == ThemeMode.light
      ? 'body_sebha_logo.png'
      : 'body_sebha_dark.png';
  String get imageHeadSebha => themeMode == ThemeMode.light
      ? 'head_sebha_logo.png'
      : 'head_sebha_dark.png';
  void changeTheme() async {
    prefs = await SharedPreferences.getInstance();
    bool? currentThemeMode = prefs.getBool('themeMode');
    themeMode = currentThemeMode == true ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  void changeLanguage() async {
    prefs = await SharedPreferences.getInstance();
    String? currentLanguage = prefs.getString('language');
    if (currentLanguage == languageCode) return;
    languageCode = currentLanguage!;
    notifyListeners();
  }

  Future<void> setTheme(bool selectedMode) async {
    prefs = await SharedPreferences.getInstance();
    await prefs.setBool('themeMode', selectedMode);
    notifyListeners();
  }

  Future<void> setLanguage(String selectedLanguage) async {
    prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', selectedLanguage);
    notifyListeners();
  }
}
