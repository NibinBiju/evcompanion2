import 'package:flutter/material.dart';
import '../../../utils/colorConstants.dart';
import 'profile.dart';
import 'viewBooking.dart';
import '../homepage/home.dart';
import 'roadMap.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomNavController extends StatefulWidget {
  @override
  _BottomNavControllerState createState() => _BottomNavControllerState();
}

class _BottomNavControllerState extends State<BottomNavController> {
  final _pages = [
    Homepage(),
    RoadMap(),
    ViewBooking(),
    Profile(),
  ];
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      // title: Text( "Appname", style: appNameStyle),
      // centerTitle: true,
      // ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        selectedItemColor: myappColor,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        selectedLabelStyle:
            TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: "Road Map"),
          BottomNavigationBarItem(
            icon: Icon(Icons.remove_red_eye),
            label: "View Booking",
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
