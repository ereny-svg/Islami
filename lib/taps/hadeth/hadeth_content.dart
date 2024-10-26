import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/taps/hadeth/hadeth.dart';
import 'package:islami/taps/setting/setting.dart';
import 'package:provider/provider.dart';

class HadethContent extends StatelessWidget {
  static const String routname = '/hadeth';

  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);
    hadeth Hadeth = ModalRoute.of(context)!.settings.arguments as hadeth;
    double height = MediaQuery.of(context).size.height;
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    'assets/images/${settingProvider.backGroundName}'),
                fit: BoxFit.fill)),
        child: Scaffold(
          appBar: AppBar(title: Text(Hadeth.title)),
          body: Container(
            width: 354,
            height: 652,
            margin:
                EdgeInsets.symmetric(horizontal: 29, vertical: height * 0.07),
            padding: EdgeInsets.only(top: height * 0.024),
            decoration: BoxDecoration(
                color: settingProvider.isDark
                    ? AppTheme.darkPrimary
                    : AppTheme.lightPrimary,
                borderRadius: BorderRadius.circular(25)),
            child: ListView.builder(
              itemBuilder: (_, index) => Text(
                Hadeth.content[index],
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              itemCount: Hadeth.content.length,
            ),
          ),
        ));
  }
}
