import 'dart:async';
import 'package:evcompanion2/presentation/view/feature_page/feature_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utils/colorConstants.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        Duration(seconds: 3),
        () => Navigator.push(
            context, CupertinoPageRoute(builder: (_) => FeaturePage())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myappColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                  radius: 70, backgroundImage: AssetImage("assets/evcomp.jpg")
                  //backgroundImage:AssetImage("assets/evcomp.jpg")
                  ),
              SizedBox(
                height: 20.h,
              ),
              CircularProgressIndicator(
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
