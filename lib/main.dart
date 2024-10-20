import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/home_screen.dart';
import 'package:islami/taps/hadeth/hadeth_content.dart';
import 'package:islami/taps/quran/sura_content_screen.dart';

void main() {
  runApp(const IslamiApp());
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routname: (context) => HomeScreen(),
        SuraContentScreen.routname: (context) => SuraContentScreen(),
        HadethContent.routname:(context) => HadethContent(),
      },
      initialRoute: HomeScreen.routname,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}
