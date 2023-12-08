import 'package:evcompanion2/utils/colorConstants.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Stack(
          children: [
            Expanded(
              child: Container(
                width: 1000,
                height: double.infinity,
                decoration: BoxDecoration(
                  image:DecorationImage(image: AssetImage("assets/map.jpg"),fit: BoxFit.cover),
                ),
              ),
            ),
            Positioned(
              left: 100,
              top: 100,
              child: Icon(Icons.location_on,color: Colors.red,size: 42,)),
              Positioned(
              left: 350,
              top: 180,
              child: Icon(Icons.location_on,color: Colors.red,size: 42,)),
              Positioned(
              left: 580,
              top: 580,
              child: Icon(Icons.location_on,color: Colors.red,size: 42,)),
              Positioned(
              left: 600,
              top: 470,
              child: Icon(Icons.location_on,color: Colors.red,size: 42,)),
              Positioned(
              left: 800,
              top: 10,
              child: Icon(Icons.location_on,color: Colors.red,size: 42,)),
              Positioned(
              left: 80,
              top: 560,
              child: Icon(Icons.location_on,color: Colors.red,size: 42,)),
              Positioned(
              left: 500,
              top: 320,
              child: Icon(Icons.my_location,color: Colors.blue,size: 42,)),
          ],
        ),
      ),
    );
  }
}
