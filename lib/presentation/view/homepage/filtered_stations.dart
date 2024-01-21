import 'package:flutter/material.dart';

class FilteredStationsPage extends StatefulWidget {
  final List<String> selectedPlugTypes;
  final List<String> selectedAmenities;

  FilteredStationsPage({required this.selectedPlugTypes, required this.selectedAmenities});

  @override
  State<FilteredStationsPage> createState() => _FilteredStationsPageState();
}

class _FilteredStationsPageState extends State<FilteredStationsPage> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredStations = filterStations();

    if (filteredStations.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Filtered Stations"),
        ),
        body: Center(
          child: Text("No stations match the selected criteria."),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Filtered Stations"),
      ),
      body: ListView.builder(
  itemCount: filteredStations.length,
  itemBuilder: (context, index) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(filteredStations[index]["stationName"],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            subtitle: Text(filteredStations[index]["location"],style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Charging Type: ${filteredStations[index]["chargingType"]["name"]}"),
                Text("Parking Fee: \$${filteredStations[index]["parkingFee"]}"),
              ],
            ),
          ),
          Text("Cost Per Hour: \$${filteredStations[index]["costPerHour"]}"),
          Text("Address: ${filteredStations[index]["address"]}"),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 50,
             // width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(filteredStations[index]["image"]),
                ),
              ),
              child: Center(child: ElevatedButton(onPressed: (){
             //   Navigator.push(context, MaterialPageRoute(builder: (context)=>BookingPage()))
              }, child: Text("View Station"))),
            ),
          ),
        ],
      ),
    );
  },
),

    );
  }

  List<Map<String, dynamic>> filterStations() {
    List<Map<String, dynamic>> allStations = EvStationsServices().stationData;

    List<Map<String, dynamic>> filteredStations = allStations.where((station) {
      bool hasAllPlugTypes = widget.selectedPlugTypes.every(
        (plugType) => station["chargingPlugs"].any((plug) => plug["name"] == plugType),
      );

      bool hasAllAmenities = widget.selectedAmenities.every(
        (amenity) => station["amenities"].any((stationAmenity) => stationAmenity["name"] == amenity),
      );

      return hasAllPlugTypes && hasAllAmenities;
    }).toList();

    return filteredStations;
  }
}

class EvStationsServices {
  List<Map<String, dynamic>> stationData = [

    {
      "stationName": "PowerCharge Station 1",
      "location": "Kochi City",
      "latitude": 10.0169,
      "longitude": 76.3110,
      "chargingType": {
        "name": "Level 2",
        "description": "Standard AC Charging",
        "simage": "assets/station1.jpg"
      },
      "chargingPlugs": [
        {
          "name": "GB/T",
          "status": "Available",
          "capacity": "50 kW",
          "image": "assets/BS1254-removebg-preview.png",
          "acType": "AC Type 2"
        },
        {
          "name": "CC COMBO TYPE 2",
          "status": "Occupied",
          "capacity": "50 kW",
          "image": "assets/BS1000-removebg-preview.png",
          "acType": "AC Type 2"
        }
      ],
      "amenities": [
        {"name": "Restroom", "image": "assets/restroom.png"},
        {"name": "Wi-Fi", "image": "assets/wifi.png"},
        {"name": "Cafeteria", "image": "assets/lodging.png"}
      ],
      "parkingFee": 5.00,
      "costPerHour": 2.50,
      "address": "123 Main Street, Kochi City",
      "image": "https://example.com/powercharge_station_1.jpg"
    },
    {
      "stationName": "GreenDrive Hub 2",
      "location": "Kochi Suburb",
      "latitude": 9.9662,
      "longitude": 76.3181,
      "chargingType": {
        "name": "DC Fast Charging",
        "description": "Direct Current Fast Charging",
        "simage": "assets/station2.jpeg"
      },
      "chargingPlugs": [
        {
          "name": "CC COMBO TYPE 2",
          "status": "Available",
          "capacity": "150 kW",
          "image": "assets/BS1000-removebg-preview.png",
          "acType": "AC Type 2"
        },
        {
          "name": "GB/T",
          "status": "Available",
          "capacity": "150 kW",
          "image": "assets/BS1254-removebg-preview.png",
          "acType": "AC Type 2"
        }
      ],
      "amenities": [
        {"name": "Restroom", "image": "assets/restroom.png"},
        {"name": "Park", "image": "assets/park.png"}
      ],
      "parkingFee": 3.50,
      "costPerHour": 1.75,
      "address": "456 Suburb Street, Kochi Suburb",
      "image": "https://example.com/greendrive_hub_2.jpg"
    },
    {
      "stationName": "EcoPower Center 3",
      "location": "Kochi Downtown",
      "latitude": 9.9312,
      "longitude": 76.2673,
      "chargingType": {"name": "Level 3", "description": "DC Fast Charging",
      "simage": "assets/station3.jpg"
      },
      "chargingPlugs": [
        {
          "name": "BS1254 Type",
          "status": "Available",
          "capacity": "150 kW",
          "image": "assets/BS1254-removebg-preview.png",
          "acType": "AC Type 2"
        },
        {
          "name": "CC COMBO TYPE 2",
          "status": "Occupied",
          "capacity": "50 kW",
          "image": "assets/BS1000-removebg-preview.png",
          "acType": "AC Type 2"
        }
      ],
      "amenities": [
        {"name": "Restroom", "image": "assets/restroom.png"},
        {"name": "Gym", "image": "assets/gym.png"},
        {"name": "Cafeteria", "image": "assets/lodging.png"}
      ],
      "parkingFee": 4.00,
      "costPerHour": 2.00,
      "address": "789 Downtown Avenue, Kochi Downtown",
      "image": "https://example.com/ecopower_center_3.jpg"
    },
    {
      "stationName": "CleanCharge Plaza 4",
      "location": "Kochi Port Area",
      "latitude": 9.9477,
      "longitude": 76.2422,
      "chargingType": {
        "name": "Level 2",
        "description": "Standard AC Charging",
        "simage": "assets/station4.jpg"
      },
      "chargingPlugs": [
        {
          "name": "Type 2 Mennekes",
          "status": "Available",
          "capacity": "50 kW",
          "image": "assets/bs1054-removebg-preview.png",
          "acType": "AC Type 2"
        },
        {
          "name": "BS1655 Type",
          "status": "Occupied",
          "capacity": "50 kW",
          "image": "assets/BS1655-removebg-preview.png",
          "acType": "AC Type 2"
        }
      ],
      "amenities": [
        {"name": "Restroom", "image": "assets/restroom.png"},
        {"name": "Wi-Fi", "image": "assets/wifi.png"},
        {"name": "Park", "image": "assets/park.png"}
      ],
      "parkingFee": 6.50,
      "costPerHour": 3.25,
      "address": "101 Port Street, Kochi Port Area",
      "image": "https://example.com/cleancharge_plaza_4.jpg"
    },
    {
      "stationName": "SolarSpark Station 5",
      "location": "Kochi Industrial Zone",
      "latitude": 10.0175,
      "longitude": 76.2179,
      "chargingType": {
        "name": "DC Fast Charging",
        "description": "Direct Current Fast Charging",
        "simage": "assets/station5.jpg"
      },
      "chargingPlugs": [
        {
          "name": "BS1845 Type",
          "status": "Available",
          "capacity": "150 kW",
          "image": "assets/bs1845-removebg-preview.png",
          "acType": "AC Type 2"
        },
        {
          "name": "BS1854 Type",
          "status": "Operational",
          "capacity": "150 kW",
          "image": "assets/BS1854-removebg-preview.png",
          "acType": "AC Type 2"
        }
      ],
      "amenities": [
        {"name": "Restroom", "image": "assets/restroom.png"},
        {"name": "Cafeteria", "image": "assets/lodging.png"}

      ],
      "parkingFee": 5.00,
      "costPerHour": 2.50,
      "address": "202 Industrial Road, Kochi Industrial Zone",
      "image": "https://example.com/solarspark_station_5.jpg"
    }
  ];
}
