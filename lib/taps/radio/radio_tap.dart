import 'package:flutter/material.dart';

class RadioTap extends StatelessWidget {
  const RadioTap({super.key});

  @override
  Widget build(BuildContext context) {
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
          Text('اذاعة القران الكريم',
              style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 57),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.skip_previous,
                color: Theme.of(context).primaryColor,
                size: 40,
              ),
              Icon(
                Icons.play_arrow,
                color: Theme.of(context).primaryColor,
                size: 60,
              ),
              Icon(
                Icons.skip_next,
                color: Theme.of(context).primaryColor,
                size: 40,
              )
            ],
          )
        ],
      ),
    );
  }
}
