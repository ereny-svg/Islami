import 'package:flutter/material.dart';
import 'package:islami/taps/hadeth/hadeth_tap.dart';
import 'package:islami/taps/quran/quran_tap.dart';
import 'package:islami/taps/radio/radio_tap.dart';
import 'package:islami/taps/sebha/sebha_tap.dart';
import 'package:islami/taps/setting/setting.dart';
import 'package:islami/taps/setting/setting_tap.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static const String routname = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [
    QuranTap(),
    HadethTap(),
    SebhaTap(),
    RadioTap(),
    SettingTap()
  ];
  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image:
                  AssetImage('assets/images/${settingProvider.backGroundName}'),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.islami)),
        body: tabs[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  label: AppLocalizations.of(context)!.quran,
                  icon: const ImageIcon(
                      AssetImage('assets/images/icon_quran.png'))),
              BottomNavigationBarItem(
                  label: AppLocalizations.of(context)!.hadeth,
                  icon: const ImageIcon(
                      AssetImage('assets/images/icon_hadeth.png'))),
              BottomNavigationBarItem(
                  label: AppLocalizations.of(context)!.sebha,
                  icon: const ImageIcon(
                      AssetImage('assets/images/icon_sebha.png'))),
              BottomNavigationBarItem(
                  label: AppLocalizations.of(context)!.radio,
                  icon: const ImageIcon(
                      AssetImage('assets/images/icon_radio.png'))),
              BottomNavigationBarItem(
                  label: AppLocalizations.of(context)!.setting,
                  icon: const Icon(Icons.settings_outlined)),
            ]),
      ),
    );
  }
}
