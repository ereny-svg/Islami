import 'package:flutter/material.dart';

class SettingProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  String languageCode = 'en';
  bool get isDark=>themeMode==ThemeMode.dark;
  String get backGroundName =>
      themeMode == ThemeMode.light ? 'default_bg.png' : 'dark_bg.png';
  void changeTheme(ThemeMode selctedTheme) {
    themeMode = selctedTheme;
    notifyListeners();
  }

  void changeLanguage(String selectedLanguage) {
    if (selectedLanguage == languageCode) return;
    languageCode = selectedLanguage;
    notifyListeners();
  }
}
