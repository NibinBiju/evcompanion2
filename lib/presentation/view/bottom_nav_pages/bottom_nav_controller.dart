// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import '../../../utils/colorConstants.dart';
import '../settings_page/profile.dart';
import '../../../view_booking/view_booking.dart';
import '../homepage/home.dart';
import '../settings_page/qr_code.dart';

class BottomNavController extends StatefulWidget {
  const BottomNavController({super.key});

  @override
  _BottomNavControllerState createState() => _BottomNavControllerState();
}

class _BottomNavControllerState extends State<BottomNavController> {
  final _pages = [
    const Homepage(),
     Battery(),
    ViewBookingPage(),
    const Profile(),
  ];
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        selectedItemColor: myappColor,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        selectedLabelStyle:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.battery_charging_full), label: "Battery"),
          BottomNavigationBarItem(
            icon: Icon(Icons.earbuds_battery_outlined),
            label: "Charger",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            print(_currentIndex);
          });
        },
      ),
      body: _pages[_currentIndex],
    );
  }
}
