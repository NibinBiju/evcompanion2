import 'package:evcompanion2/utils/colorConstants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myappColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Book charge stations",
              style: HeadingStyle,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              width: 300,
              height: 300,
              child: Lottie.asset(
                'assets/lottie_animations/booking.json',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
