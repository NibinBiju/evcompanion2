// ignore_for_file: unnecessary_new

import 'package:evcompanion2/controller/add_vehicle_controller/add_vehicle_provider.dart';
import 'package:evcompanion2/controller/bookstation_controller.dart';
import 'package:evcompanion2/controller/ev_stations_service/ev_station_services.dart';
import 'package:evcompanion2/controller/favorite_controller/f_controller.dart';
import 'package:evcompanion2/presentation/view/settings_page/Adminpage/stationstate.dart';
import 'package:evcompanion2/presentation/view/settings_page/fee.dart';
import 'package:evcompanion2/registration_page/google_signin/auth_services.dart';
import 'package:evcompanion2/utils/colorConstants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:evcompanion2/splash_screen/splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCXqCyWphYZdb2uXAbL9-FTyKSSoJsD_e4",
      appId: "1:674902114879:android:af9826fb3f99f133ddae8a",
      messagingSenderId: "",
      projectId: "flutter-firebase1-cc212",
      storageBucket: "project-ev-c127e.appspot.com")
  );
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
            ChangeNotifierProvider(create: (context) =>StationbookController()),
            ChangeNotifierProvider(create: (context) =>FeedbackProvider()),
            ChangeNotifierProvider(create: (context) => StationState(EvStationsServices().stationData)),
            ChangeNotifierProvider(create: (context) =>GoogleSignInProvider()),

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
