// ignore_for_file: unnecessary_new

import 'package:evcompanion2/utils/colorConstants.dart';
import 'package:flutter/material.dart';
import 'package:evcompanion2/presentation/view/splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'ev_companion',

          theme: new ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: myappColor),
              appBarTheme: const AppBarTheme(
                  backgroundColor: Colors.white,
                  foregroundColor:
                      Colors.black //here you can give the text color
                  )),
          //

          home: SplashScreen(),
        );
      },
    );
  }
}
