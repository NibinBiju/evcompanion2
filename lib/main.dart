// ignore_for_file: unnecessary_new

import 'package:evcompanion2/controller/add_vehicle_controller/add_vehicle_provider.dart';
import 'package:evcompanion2/controller/bookstation_controller.dart';

import 'package:evcompanion2/controller/ev_stations_service/ev_station_services.dart';
import 'package:evcompanion2/controller/favorite_controller/f_controller.dart';
import 'package:evcompanion2/presentation/view/homepage/home.dart';
import 'package:evcompanion2/presentation/view/login_screen/login_screen.dart';
import 'package:evcompanion2/utils/colorConstants.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: const FirebaseOptions(
//       apiKey: "AIzaSyA7RetFWM0eNNwpE4ZZVqJGOv34wkH-FQE",
//       projectId: "flutter-firebase1-cc212",
//       appId: '1:29599385366:android:6b98491c7c42116f75b237',
//       messagingSenderId: '',
//     ),);
//   // to get the currently logined in user
//   User? user = FirebaseAuth.instance.currentUser;
//   runApp(MaterialApp(home: user == null ? LoginFire() : Homepage()));
// }

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
