import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/taps/setting/setting.dart';
import 'package:provider/provider.dart';

class RadioTap extends StatefulWidget {
  const RadioTap({super.key});

  @override
  State<RadioTap> createState() => _RadioTapState();
}

class _RadioTapState extends State<RadioTap> {
  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(top: height * 0.15),
      child: Column(
        children: [
          Image.asset(
            'assets/images/radio_image.png',
          ),
          const SizedBox(height: 57),
          Text(AppLocalizations.of(context)!.islamicQuranRadio,
              style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 57),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            textDirection: settingProvider.languageCode == 'en'
                ? TextDirection.ltr
                : TextDirection.ltr,
            children: [
              Icon(
                Icons.skip_previous,
                color: settingProvider.themeMode == ThemeMode.light
                    ? AppTheme.lightPrimary
                    : AppTheme.gold,
                size: 40,
              ),
              Icon(
                Icons.play_arrow,
                color: settingProvider.themeMode == ThemeMode.light
                    ? AppTheme.lightPrimary
                    : AppTheme.gold,
                size: 60,
              ),
              Icon(
                Icons.skip_next,
                color: settingProvider.themeMode == ThemeMode.light
                    ? AppTheme.lightPrimary
                    : AppTheme.gold,
                size: 40,
              )
            ],
          )
        ],
      ),
    );
  }
}
