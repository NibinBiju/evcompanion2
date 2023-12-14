import 'package:evcompanion2/utils/colorConstants.dart';
import 'package:evcompanion2/view_booking/history_page.dart';
import 'package:flutter/material.dart';

class ViewBookingPage extends StatefulWidget {
  const ViewBookingPage({super.key});

  @override
  State<ViewBookingPage> createState() => _ViewBookingPageState();
}

class _ViewBookingPageState extends State<ViewBookingPage> {
  int onTabbar = 0;
  List tabBarPages = [
    const BookedChargingStations(),
    HistoryPage(),
   
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
              onTap: (index) {
                setState(() {
                  onTabbar = index;
                });
              },
              unselectedLabelColor: Colors.white54,
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: const [
                Tab(
                  child: Text(
                    'Booked',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'History',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              ]),
          title: const Text(
            'View Booking',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: myappColor,
          leading: const Padding(
            padding: EdgeInsets.only(left: 4, bottom: 4),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/evcomp.jpg'),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: tabBarPages[onTabbar],
        ),
      ),
    );
  }
}

class BookedChargingStations extends StatelessWidget {
  const BookedChargingStations({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          1,
          (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: BookingCard(),
              )),
    );
  }
}

class BookingCard extends StatelessWidget {
  const BookingCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: myappColor,
          width: 4,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 170,
            height: 170,
            decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage('assets/charging.jpeg'),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 190,
                child: Text(
                  'Vypin Charging stations',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w600,
                    color: myappColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              const Row(
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
              const Row(
                children: [
                  Text(
                    'Time remaining :-2hr56min',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 7,
              ),
              InkWell(
                onTap: (){},
                child: Container(
                  width: 180,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(123, 54, 179, 58),
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      width: 4,
                      color: myappColor,
                    ),
                  ),
                  //child: const Center(
                    // child: Text(
                    //   'Cancel booking',
                    //   style: TextStyle(
                    //     fontWeight: FontWeight.w600,
                    //   ),
                    // ),
                 // ),
                 child: ElevatedButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HistoryPage()));
                 }, child: Text("Cancel Booking",
                 style: TextStyle(
                  fontWeight: FontWeight.w700,
                 ),)),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
