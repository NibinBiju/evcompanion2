import 'package:evcompanion2/presentation/view/homepage/filtered_stations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';

class Filter extends StatelessWidget {
  final List<String> plugTypes = [
    "GB/T",
    "BS1845",
    "Type 2 Mennekes",
    "BS1655",
    "BS1854",
    "BS1254",
    "CC COMBO TYPE 2",
  ];

  final List<String> amenitiesTypes = [
    "Cafeteria",
    "Gym",
    "Restroom",
    "Park",
    "Wi-Fi",
  ];

  final List<String> amenitiesImage = [
    'assets/lodging.png',
    'assets/gym.png',
    'assets/restroom.png',
    'assets/park.png',
    'assets/wifi.png',
  ];

  final List<String> plugTypeImage = [
    'assets/ms1548-removebg-preview.png',
    'assets/bs1845-removebg-preview.png',
    'assets/bs1054-removebg-preview.png',
    'assets/BS1655-removebg-preview.png',
    'assets/BS1854-removebg-preview.png',
    'assets/BS1254-removebg-preview.png',
    'assets/BS1000-removebg-preview.png'
  ];

  final List<ValueNotifier<bool>> plugTypeControllers = List.generate(8, (_) => ValueNotifier<bool>(false));
  final List<ValueNotifier<bool>> amenitiesControllers = List.generate(8, (_) => ValueNotifier<bool>(false));

  @override
  Widget build(BuildContext context) {
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
            buildFilterSection("Plug type", plugTypes, plugTypeImage, plugTypeControllers),
            buildFilterSection("Amenities", amenitiesTypes, amenitiesImage, amenitiesControllers),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                   List<String> selectedPlugTypes = plugTypes.where((type) =>
                      plugTypeControllers[plugTypes.indexOf(type)].value).toList();
                  List<String> selectedAmenities = amenitiesTypes.where((type) =>
                      amenitiesControllers[amenitiesTypes.indexOf(type)].value).toList();
              
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FilteredStationsPage(
                        selectedPlugTypes: selectedPlugTypes,
                        selectedAmenities: selectedAmenities,
                      ),
                    ),
                  );
                },
                child: Text("Check"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFilterSection(String title, List<String> types, List<String> images, List<ValueNotifier<bool>> controllers) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: types.length,
          itemBuilder: (context, index) {
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
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(images[index]),
                                alignment: Alignment.centerLeft,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              types[index],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      AdvancedSwitch(
                        controller: controllers[index],
                        activeColor: Colors.green,
                        inactiveColor: Colors.grey,
                        borderRadius: BorderRadius.all(const Radius.circular(15)),
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
          },
        ),
      ],
    );
  }
}
