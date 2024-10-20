import 'package:flutter/material.dart';
import 'package:islami/taps/hadeth/hadeth.dart';

class HadethContent extends StatelessWidget {
  static const String routname='/hadeth';

  @override
  Widget build(BuildContext context) {
    hadeth Hadeth=ModalRoute.of(context)!.settings.arguments as hadeth;
     double height = MediaQuery.of(context).size.height;
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/default_bg.png'),
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
                color: Colors.white.withOpacity(0.20),
                borderRadius: BorderRadius.circular(25)),
            child:  ListView.builder(
                    itemBuilder: (_, index) => Text(
                     Hadeth.content[index],
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                    itemCount:Hadeth.content. length,
                  ),
          ),
        ));
  }
}