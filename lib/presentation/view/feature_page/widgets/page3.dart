import 'package:evcompanion2/utils/colorConstants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myappColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Road map of charging station !",
              style: HeadingStyle,
            ),
            SizedBox(
              width: 400,
              height: 400,
              child: Lottie.asset(
                'assets/lottie_animations/road_map.json',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
