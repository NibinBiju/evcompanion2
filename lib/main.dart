// ignore_for_file: unnecessary_new

import 'package:evcompanion2/controller/add_vehicle_controller/add_vehicle_provider.dart';
import 'package:evcompanion2/controller/bookstation_controller.dart';

import 'package:evcompanion2/controller/ev_stations_service/ev_station_services.dart';
import 'package:evcompanion2/controller/favorite_controller/f_controller.dart';
import 'package:evcompanion2/presentation/view/homepage/filter.dart';
import 'package:evcompanion2/utils/colorConstants.dart';
import 'package:flutter/material.dart';
import 'package:evcompanion2/splash_screen/splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => AddVehicleProvider()),
            ChangeNotifierProvider(create: (context) => EvStationsServices()),
            ChangeNotifierProvider(create: (context) => FavoriteController()),
            ChangeNotifierProvider(create: (context) =>StationbookController())
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'ev_companion',
            theme: new ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: myappColor),
                appBarTheme: const AppBarTheme(
                    backgroundColor: Colors.white,
                    foregroundColor:
                        Colors.black //here you can give the text color
                    )),
            // home: const SplashScreen(),
            home: SplashScreen(),
          ),
        );
      },
    );
  }
}
