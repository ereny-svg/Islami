import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/taps/hadeth/hadeth.dart';
import 'package:islami/taps/hadeth/hadeth_content.dart';

class HadethTap extends StatefulWidget {
  @override
  State<HadethTap> createState() => _HadethTapState();
}

class _HadethTapState extends State<HadethTap> {
  List<hadeth> ahadeth = [];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    if (ahadeth.isEmpty) {
      loadHadethFile();
    }
    ;
    return Column(
      children: [
        Image.asset('assets/images/hadeth_logo.png', height: height * 0.25),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.only(top: height * 0.009),
            itemBuilder: (_, index) => GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(HadethContent.routname,arguments: ahadeth[index]);
              },
              child: Text(ahadeth[index].title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall),
            ),
            itemCount: ahadeth.length,
            separatorBuilder: (_, __) => SizedBox(
              height: height * 0.0012,
            ),
          ),
        )
      ],
    );
  }

  Future<void> loadHadethFile() async {
    String hadethContent =
        await rootBundle.loadString('assets/text/ahadeth.txt');
    List<String> hadethStrings = hadethContent.split('#');
    ahadeth = hadethStrings.map((hadethString) {
      List<String> hadethLines = hadethString.trim().split('\n');
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      List<String> content = hadethLines;
      return hadeth(title: title, content: content);
    }).toList();
    setState(() {});
  }
}
