import 'package:flutter/material.dart';

class SebhaTap extends StatefulWidget {
  @override
  State<SebhaTap> createState() => _SebhaTapState();
}

class _SebhaTapState extends State<SebhaTap> {
  int taps = 0;
  int change = 0;
  String text = '';
  double angle = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.only(left: width * 0.05),
      child: Column(
        children: [
          Transform.translate(
            offset: const Offset(15, 28),
            child: Image.asset(
              'assets/images/head_sebha_logo.png',
              height: 105,
              width: 73,
            ),
          ),
          Transform.rotate(
              angle: angle,
              child: GestureDetector(
                onTap: () {
                  angle++;
                  taps += 1;
                  setState(() {
                    if (taps % 33 == 0 && change == 0) {
                      text = 'سبحان الله';
                      change++;
                    } else if (taps % 33 == 0 && change == 1) {
                      text = 'الله اكبر';
                      change++;
                    } else if (taps % 33 == 0 && change == 2) {
                      text = 'الحمدلله';
                      change = 0;
                    }
                  });
                  print(taps);
                },
                child: Image.asset(
                  'assets/images/body_sebha_logo.png',
                  height: 234,
                  width: 232,
                ),
              )),
          const SizedBox(
            height: 30,
          ),
          Text(
            'عدد التسبيحات',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(
            height: 19,
          ),
          Container(
            height: 81,
            width: 69,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Theme.of(context).primaryColor,
            ),
            child: Center(
              child: Text(
                '$taps',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
          const SizedBox(
            height: 29,
          ),
          Container(
            width: 137,
            height: 51,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Theme.of(context).primaryColor,
            ),
            child: Center(
                child: Text(
              text,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w400),
            )),
          ),
        ],
      ),
    );
  }
}
