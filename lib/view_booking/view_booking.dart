// import 'package:evcompanion2/controller/bookstation_controller.dart';
// import 'package:evcompanion2/utils/colorConstants.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class ViewBookingPage extends StatefulWidget {
//   const ViewBookingPage({super.key,required this.user});
//   final user;
//   @override
//   State<ViewBookingPage> createState() => _ViewBookingPageState();
// }

// class _ViewBookingPageState extends State<ViewBookingPage> {

//   int onTabbar = 0;

//   @override
//   Widget build(BuildContext context) {
//     var provider = Provider.of<StationbookController>(context);
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: const Text(
//             'My Booking',
//             style: TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           backgroundColor: myappColor,
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: List.generate(
//                provider. bookingList.length,
//                 (index) {
                  
//                   return widget.user ==provider. bookingList[index].user?
//                   BookingCardTile(
//                       image:provider. bookingList[index].image,
//                       name:provider. bookingList[index].name,
//                       date:provider. bookingList[index].date,
//                       buttonText:provider. bookingList[index].buttontext,
//                       price: provider.bookingList[index].price,
//                     ):Center(child: Text(""));} ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class BookingCardTile extends StatelessWidget {
//   const BookingCardTile({
//     super.key,
//     required this.name,
//     required this.image,
//     required this.date,
//     required this.buttonText, required this.price,
//   });

//   final String name;
//   final String image;
//   final String date;
//   final String buttonText;
//   final String price;

//   @override
//   Widget build(BuildContext context) {
//  return Padding(
//    padding: const EdgeInsets.all(8.0),
//    child: Container(
//      decoration: BoxDecoration(
//        borderRadius: BorderRadius.circular(20),
//        color: const Color.fromARGB(255, 212, 212, 212),
//      ),
//      padding: const EdgeInsets.all(13),
//      child: Row(children: [
//        Container(
//          width: 90,
//          height: 90,
//          decoration: BoxDecoration(
//            borderRadius: BorderRadius.circular(15),
//            image:
//                DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
//          ),
//        ),
//        Container(
//         //  width: 260,
//          // color: Colors.amber,
//          height: 100,
//          padding: const EdgeInsets.all(9),
//          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.start,
//            mainAxisAlignment: MainAxisAlignment.start,
//            children: [
//              Text(
//                name,
//                style: TextStyle(
//                  fontSize: 17,
//                  fontWeight: FontWeight.bold,
//                ),
//              ),
//              Text(date,
//              style: TextStyle(
//                fontSize: 15,fontWeight: FontWeight.bold
//              ),
//              ),
//              Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,               
//                children: [
//                   Text(
//                    price,
//                    style: TextStyle(
//                      fontSize: 20,
//                      fontWeight: FontWeight.normal
//                    ),
//                  ),
//                  Container(
//                   //  width: 100,
//                    height: 30,
//                    decoration: BoxDecoration(
//                        borderRadius: BorderRadius.circular(19),
//                        border: Border.all(
//                          width: 2,
//                          color: Colors.green,
//                        )),
//                    child: Center(
//                      child: Padding(
//                        padding: const EdgeInsets.only(left: 20, right: 20),
//                        child: Text(
//                          //buttonText,
//                          "Booked",
//                          style: TextStyle(
//                            color: Colors.green,
//                          ),
//                        ),
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//            ],
//          ),
//        )
//      ]),
//    ),
//  );
//   }
// }
import 'package:flutter/material.dart';
import 'package:evcompanion2/controller/bookstation_controller.dart';
import 'package:provider/provider.dart';
import 'package:evcompanion2/model/my_booking_model/my_booking_model.dart';

class ViewBookingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<StationbookController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Bookings'),
      ),
      body: ListView.builder(
        itemCount: provider.bookingList.length,
        itemBuilder: (context, index) {
          MyBookingModel booking = provider.bookingList[index];
          return
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
          );
        },
      ),
    );
  }
}
