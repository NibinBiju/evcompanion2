import 'package:evcompanion2/controller/bookstation_controller.dart';
import 'package:evcompanion2/model/my_booking_model/my_booking_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminViewBook extends StatefulWidget {
  AdminViewBook({super.key,required this.user});
  @override
  State<AdminViewBook> createState() => _AdminViewBookState();
  final String user;
}

class _AdminViewBookState extends State<AdminViewBook> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<StationbookController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookings'),
      ),
      body: ListView.builder(
        itemCount: provider.bookingList.length,
        itemBuilder: (context, index) {
          MyBookingModel booking = provider.bookingList[index];
          return
           booking.user==widget.user?
          Container(
             padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 8.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  booking.image,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 12.0,width: 20,),
              Text(
                booking.user,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Text(
            booking.name,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            ('${booking.date} - ${booking.buttontext}'),
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.grey,
            ),
          ),
          Text(
            booking.startingtime,
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            booking.price,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
        ],
      ),
          ):SizedBox();
        },
      ),
    );
  }
}
