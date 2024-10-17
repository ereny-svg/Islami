import 'package:flutter/material.dart';
import 'package:islami/taps/hadeth/hadeth_tap.dart';
import 'package:islami/taps/quran/quran_tap.dart';
import 'package:islami/taps/radio/radio_tap.dart';
import 'package:islami/taps/sebha/sebha_tap.dart';
import 'package:islami/taps/setting/setting_tap.dart';

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
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/default_bg.png'),
              fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(title: Text('اسلامي')),
        body: tabs[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            items: const [
              BottomNavigationBarItem(
                  label: 'quran',
                  icon: ImageIcon(AssetImage('assets/images/icon_quran.png'))),
              BottomNavigationBarItem(
                  label: 'hadeth',
                  icon: ImageIcon(AssetImage('assets/images/icon_hadeth.png'))),
              BottomNavigationBarItem(
                  label: 'sebha',
                  icon: ImageIcon(AssetImage('assets/images/icon_sebha.png'))),
              BottomNavigationBarItem(
                  label: 'radio',
                  icon: ImageIcon(AssetImage('assets/images/icon_radio.png'))),
              BottomNavigationBarItem(
                  label: 'setting', icon: Icon(Icons.settings_outlined)),
            ]),
      ),
    );
  }
}
