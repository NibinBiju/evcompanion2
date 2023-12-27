import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';

class Filter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> plugTypes = [
      "BS1744",
      "MS1548",
      "BS1845",
      "BS1054",
      "BS1655",
      "BS1854",
      "BS1254",
      "BS1000",
    ];
    List<String> AmenitiesTypes = [
      "Lodging",
      "Ev parking",
      "Gym",
      "Valot parking",
      "Rest room",
      "Park",
      "Wifi",
      "Shopping bag",
    ];
    List<String> AmenitiesImage = [
      'assets/lodging.png',
      'assets/ev_parking.png',
      'assets/gym.png',
      'assets/valet_parking.png',
      'assets/restroom.png',
      'assets/park.png',
      'assets/wifi.png',
      'assets/shopping_bag.png'
    ];
    List<String> PlugtypeImage = [
      'assets/BS1854-removebg-preview.png',
      'assets/ms1548-removebg-preview.png',
      'assets/bs1845-removebg-preview.png',
      'assets/bs1054-removebg-preview.png',
      'assets/BS1655-removebg-preview.png',
      'assets/BS1854-removebg-preview.png',
      'assets/BS1254-removebg-preview.png',
      'assets/BS1000-removebg-preview.png'
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Filter",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Plug type",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Column(
              children: List.generate(8, (index) {
                
                final _plugTypeController = ValueNotifier<bool>(false);

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 231, 231, 231),
                    ),
                    width: double.infinity,
                    height: 90,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(fit: BoxFit.fill,
                                    image: AssetImage(PlugtypeImage[index]),  
                                    alignment: Alignment.centerLeft,
                                  ),
                                ),
                              ),
                              
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  plugTypes[index],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          AdvancedSwitch(
                            controller: _plugTypeController,
                            activeColor: Colors.green,
                            inactiveColor: Colors.grey,
                            borderRadius:
                                BorderRadius.all(const Radius.circular(15)),
                            width: 50.0,
                            height: 30.0,
                            enabled: true,
                            disabledOpacity: 0.5,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
            Text("Amenities",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Column(
              children: List.generate(8, (index) {
                
                final _amenitiesController = ValueNotifier<bool>(false);

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 231, 231, 231),
                    ),
                    width: double.infinity,
                    height: 90,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(fit: BoxFit.fill,
                                    image: AssetImage(AmenitiesImage[index]),  
                                    alignment: Alignment.centerLeft,
                                  ),
                                ),
                              ),
                              
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  AmenitiesTypes[index],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          AdvancedSwitch(
                            controller: _amenitiesController,
                            activeColor: Colors.green,
                            inactiveColor: Colors.grey,
                            borderRadius:
                                BorderRadius.all(const Radius.circular(15)),
                            width: 50.0,
                            height: 30.0,
                            enabled: true,
                            disabledOpacity: 0.5,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
