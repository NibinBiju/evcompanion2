// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'dart:async';
import 'package:evcompanion2/presentation/view/bottom_nav_pages/bottom_nav_controller.dart';
import 'package:evcompanion2/presentation/view/feature_page/feature_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/colorConstants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      _checkData();
    });
    super.initState();
  }

  void _checkData() async {
    SharedPreferences sharedpreference = await SharedPreferences.getInstance();
    String storedusername = sharedpreference.getString('unamekey')!;
    String storedpassword = sharedpreference.getString('passkey')!;
    if (storedpassword.isNotEmpty && storedusername.isNotEmpty) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (cnt) {
        return const BottomNavController();
      }));
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (cnt) {
        return const FeaturePage();
      }));
    }
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
              const CircleAvatar(
                  radius: 70, backgroundImage: AssetImage("assets/evcomp.jpg")
                  //backgroundImage:AssetImage("assets/evcomp.jpg")
                  ),
              SizedBox(
                height: 20.h,
              ),
              const CircularProgressIndicator(
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
