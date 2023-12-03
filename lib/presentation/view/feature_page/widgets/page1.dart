import 'package:evcompanion2/utils/colorConstants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myappColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Let's find a charge station !",
              style: HeadingStyle,
            ),
            SizedBox(
              width: 400,
              height: 400,
              child: Lottie.asset(
                  'assets/lottie_animations/charge_station.json',
                  fit: BoxFit.cover),
            ),
          ],
        ),
      ),
    );
  }
}
