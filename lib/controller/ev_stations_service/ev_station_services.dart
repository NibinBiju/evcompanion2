import 'package:flutter/material.dart';

class EvStationsServices with ChangeNotifier {
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
          "image": "assets/ms1548-removebg-preview.png",
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
      "image": "assets/chuttersnap-xJLsHl0hIik-unsplash.jpg"
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
          "image": "assets/ms1548-removebg-preview.png",
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
      "image": "assets/alex-re8FigEQ4eQ-unsplash.jpg"
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
      "image": "assets/stephen-mease-5hbzWe6ens4-unsplash.jpg"
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
      "image": "assets/maxim-hopman-lcysD7F8ycc-unsplash.jpg"
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
      "image": "assets/rick-govic-rLTjEVGXNBA-unsplash.jpg"
    }
  ];
}
