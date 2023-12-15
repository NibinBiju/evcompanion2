import 'package:evcompanion2/model/my_booking_model/my_booking_model.dart';
import 'package:evcompanion2/utils/colorConstants.dart';
import 'package:flutter/material.dart';

class ViewBookingPage extends StatefulWidget {
  const ViewBookingPage({super.key});

  @override
  State<ViewBookingPage> createState() => _ViewBookingPageState();
}

class _ViewBookingPageState extends State<ViewBookingPage> {
  List<MyBookingModel> bookingList = [
    MyBookingModel(
      date: '20-12-2023',
      image: 'assets/charging.jpeg',
      name: 'Greena station',
      price: '80.00',
      buttontext: 'booked',
    ),
  ];

  int onTabbar = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'My Booking',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: myappColor,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: List.generate(
                bookingList.length,
                (index) => BookingCardTile(
                      image: bookingList[index].image,
                      name: bookingList[index].name,
                      date: bookingList[index].date,
                      buttonText: bookingList[index].buttontext,
                    )),
          ),
        ),
      ),
    );
  }
}

class BookingCardTile extends StatelessWidget {
  const BookingCardTile({
    super.key,
    required this.name,
    required this.image,
    required this.date,
    required this.buttonText,
  });

  final String name;
  final String image;
  final String date;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(255, 212, 212, 212),
        ),
        padding: const EdgeInsets.all(13),
        child: Row(children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
            ),
          ),
          Container(
            width: 260,
            // color: Colors.amber,
            height: 90,
            padding: const EdgeInsets.all(9),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(date),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '80.00',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(19),
                          border: Border.all(
                            width: 2,
                            color: Colors.green,
                          )),
                      child: Center(
                        child: Text(
                          buttonText,
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
