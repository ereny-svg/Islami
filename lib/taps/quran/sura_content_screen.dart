import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/taps/quran/quran_tap.dart';
import 'package:islami/widget/loading_indicator.dart';

class SuraContentScreen extends StatefulWidget {
  static const String routname = '/sura';

  @override
  State<SuraContentScreen> createState() => _SuraContentScreenState();
}

class _SuraContentScreenState extends State<SuraContentScreen> {
  late SuraContent content;

  List<String> ayat = [];

  @override
  Widget build(BuildContext context) {
    content = ModalRoute.of(context)!.settings.arguments as SuraContent;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    if (ayat.isEmpty) {
      loadfiles();
    }
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/default_bg.png'),
                fit: BoxFit.fill)),
        child: Scaffold(
          appBar: AppBar(title: Text(content.suraname)),
          body: Container(
            width: 354,
            height: 652,
            margin:
                EdgeInsets.symmetric(horizontal: 29, vertical: height * 0.07),
            padding: EdgeInsets.only(top: height * 0.024),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.20),
                borderRadius: BorderRadius.circular(25)),
            child: ayat.isEmpty
                ? LoadingIndicator()
                : ListView.builder(
                    itemBuilder: (_, index) => Text(
                      ayat[index],
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                    itemCount: ayat.length,
                  ),
          ),
        ));
  }

  Future<void> loadfiles() async {
    await Future.delayed(const Duration(seconds: 1));
    String sura =
        await rootBundle.loadString('assets/text/${content.index + 1}.txt');
    ayat = sura.split('\r\n');

    setState(() {
      print(ayat);
    });
  }
}
