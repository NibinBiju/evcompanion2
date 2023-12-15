import 'package:evcompanion2/utils/colorConstants.dart';
import 'package:evcompanion2/view_booking/view_booking.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 230,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/charging.jpeg'),
                        fit: BoxFit.cover)),
              ),
              Positioned(
                top: 25,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.white,
                    )),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Row(
                  children: [
                    Text(
                      'Vypin Charging stations',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w600,
                        color: myappColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '4.3',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.orangeAccent,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.orangeAccent,
                    )
                  ],
                ),
                const Text(
                    '''  Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley'''),
                const SizedBox(
                  height: 80,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const ViewBookingPage();
                    }));
                  },
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(123, 54, 179, 58),
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        width: 4,
                        color: myappColor,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Book Appointment',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
