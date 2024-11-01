import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/taps/setting/language.dart';
import 'package:islami/taps/setting/setting.dart';
import 'package:provider/provider.dart';

class SettingTap extends StatefulWidget {
  @override
  State<SettingTap> createState() => _SettingTapState();
}

class _SettingTapState extends State<SettingTap> {
  List<Language> languages = [
    Language(languageName: 'English', languageCode: 'en'),
    Language(languageName: 'العربيه', languageCode: 'ar')
  ];

  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Dark Mode ',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
              Switch(
                value:
                    settingProvider.themeMode == ThemeMode.light ? false : true,
                onChanged: (value) => settingProvider.setTheme(value),
                activeTrackColor: AppTheme.gold,
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Language ',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton<Language>(
                    value: languages.firstWhere((language) =>
                        language.languageCode == settingProvider.languageCode),
                    items: languages
                        .map(
                          (language) => DropdownMenuItem<Language>(
                              value: language,
                              child: Text(
                                language.languageName,
                                style: Theme.of(context).textTheme.titleLarge,
                              )),
                        )
                        .toList(),
                    onChanged: (selectedlanguage) {
                      if (selectedlanguage != null) {
                        settingProvider
                            .setLanguage(selectedlanguage.languageCode);
                      }
                    },
                    borderRadius: BorderRadius.circular(20),
                    dropdownColor: settingProvider.isDark
                        ? AppTheme.darkPrimary
                        : AppTheme.white),
              )
            ],
          ),
        ],
      ),
    );
  }
}
