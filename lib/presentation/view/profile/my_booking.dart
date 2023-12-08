import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class MyBooking extends StatefulWidget {
  const MyBooking({Key? key}) : super(key: key);

  @override
  State<MyBooking> createState() => _MyBookingState();
}

class _MyBookingState extends State<MyBooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Lottie.asset("assets/lottie_animations/charge_station.json",fit: BoxFit.cover),
            ),
             Padding(
                       padding: const EdgeInsets.all(8.0),
                        child: Container(
                            padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                                ),
                                child: Text(''),
                              ),
                            ),
              Padding(
                       padding: const EdgeInsets.all(8.0),
                        child: Container(
                            padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                                ),
                                child: Text(''),
                              ),
                            ),
              Padding(
                       padding: const EdgeInsets.all(8.0),
                        child: Container(
                            padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                                ),
                                child: Text(''),
                              ),
                            ),
              Padding(
                       padding: const EdgeInsets.all(8.0),
                        child: Container(
                            padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                                ),
                                child: TextField(),
                              ),
                            ),
                      Padding(
                     padding: const EdgeInsets.all(8.0),
                      child: Container(
                          padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                              ),
                              child: ElevatedButton(onPressed: (){},
                               child: Text("Book Now")),
                            ),
                          ),
          ],
        ),
      ),
    );
  }
}