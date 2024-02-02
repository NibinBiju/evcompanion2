import 'package:carousel_slider/carousel_slider.dart';
import 'package:evcompanion2/presentation/view/booking_page/booking_page.dart';
import 'package:evcompanion2/presentation/view/homepage/view_direction.dart';
import 'package:flutter/material.dart';

class EvStationsServices {
  static Map<String, double> getStationLatLng(String stationName) {
    
    return {
      'latitude':9.931233,
      'longitude': 76.267303,
    };
  }
}

class DetailsPage extends StatefulWidget {
  const DetailsPage({
    Key? key,
    required this.stationName,
    required this.location,
    required this.amenities,
    required this.pricePerHr,
    required this.portName,
    required this.image,
  }) : super(key: key);

  final String stationName;
  final String location;
  final List<Map<String, dynamic>> amenities;
  final String pricePerHr;
  final List<Map<String, dynamic>> portName;
  final String image;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  EvStationsServices evStationsServices = EvStationsServices();

  List ofImages = ['assets/charging.jpeg', 'assets/tesla.jpg'];
  int pageNo = 1;
  int indexValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        width: double.infinity,
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // view station button
            const SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () {
                Map<String, double> stationLatLng =
                    EvStationsServices.getStationLatLng(widget.stationName);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RouteMapPage(
                      destinationLatitude: stationLatLng['latitude'] ?? 0.0,
                      destinationLongitude: stationLatLng['longitude'] ?? 0.0,
                    ),
                  ),
                );
              },
              child: Container(
                width: 170,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: Colors.white,
                ),
                child: const Center(
                  child: Text(
                    'Get Direction',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(),
            // book station button
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookingPage(
                      stationName: widget.stationName,
                      location: widget.location,
                    ),
                  ),
                );
              },
              child: Container(
                width: 170,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: Colors.green,
                ),
                child: const Center(
                  child: Text(
                    'Book charge',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Stack(
                children: [
                  CarouselSlider.builder(
                    itemCount: ofImages.length,
                    itemBuilder: (context, index, an) {
                      indexValue = index + 1;
                      return Container(
                        height: 400,
                        child: Image.asset(
                          ofImages[index],
                          fit: BoxFit.fill,
                        ),
                      );
                    },
                    options: CarouselOptions(
                      onScrolled: (value) {
                        setState(() {
                          pageNo = indexValue;
                        });
                      },
                      viewportFraction: 1,
                      aspectRatio: 1,
                      height: 450,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Icon(Icons.arrow_back_ios_new_rounded),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              width: 80,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      pageNo.toString(),
                                      style: const TextStyle(
                                        color: Colors.green,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      '/${ofImages.length}',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // body
          Expanded(
            flex: 2,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 224, 224, 224),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.stationName,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22,
                                ),
                              ),
                              Text(
                                widget.location,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Cost:',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17,
                                      ),
                                    ),
                                    Text(
                                      '${widget.pricePerHr}/hour',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Parking:',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17,
                                      ),
                                    ),
                                    Text(
                                      'Free',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // amenities
                      const Text(
                        'Amenities:',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            widget.amenities.length,
                            (index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 224, 224, 224),
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: Center(
                                  child: Text(widget.amenities[index]['name']),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      // charges details
                      const Text(
                        'Charges:',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Column(
                        children: List.generate(
                          widget.portName.length,
                          (index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 224, 224, 224),
                                  borderRadius: BorderRadius.circular(17),
                                ),
                                child: ListTile(
                                  leading: Container(
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            widget.portName[index]['image']),
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    widget.portName[index]['name'],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  subtitle: const Text(
                                    "",
                                    style: TextStyle(
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 90,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
