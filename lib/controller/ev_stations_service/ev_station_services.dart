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
        "description": "Standard AC Charging"
      },
      "chargingPlugs": [
        {
          "name": "GB/T",
          "status": "Available",
          "capacity": "50 kW",
          "image": "assets/gb_t.png"
        },
        {
          "name": "CC COMBO TYPE 2",
          "status": "Occupied",
          "capacity": "50 kW",
          "image": "assets/ccs combo type 2.png"
        },
        {
          "name": "Plug C",
          "status": "Available",
          "capacity": "50 kW",
          "image": "assets/ccs combo type 1.png"
        },
        {
          "name": "CHADEMO",
          "status": "Under Maintenance",
          "capacity": "50 kW",
          "image": "assets/chademo.png"
        }
      ],
      "amenities": [
        {"name": "Restroom", "image": "https://example.com/restroom.jpg"},
        {"name": "Wi-Fi", "image": "https://example.com/wifi.jpg"},
        {"name": "Cafeteria", "image": "https://example.com/cafeteria.jpg"}
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
        "description": "Direct Current Fast Charging"
      },
      "chargingPlugs": [
        {
          "name": "CC COMBO TYPE 2",
          "status": "Available",
          "capacity": "150 kW",
          "image": "assets/ccs combo type 2.png"
        },
        {
          "name": "GB/T",
          "status": "Available",
          "capacity": "150 kW",
          "image": "assets/gb_t.png"
        }
      ],
      "amenities": [
        {"name": "Restroom", "image": "https://example.com/restroom.jpg"},
        {"name": "Lounge", "image": "https://example.com/lounge.jpg"}
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
      "chargingType": {"name": "Level 3", "description": "DC Fast Charging"},
      "chargingPlugs": [
        {
          "name": "GB/T",
          "status": "Available",
          "capacity": "150 kW",
          "image": "assets/gb_t.png"
        },
        {
          "name": "CC COMBO TYPE 2",
          "status": "Occupied",
          "capacity": "50 kW",
          "image": "assets/ccs combo type 2.png"
        }
      ],
      "amenities": [
        {"name": "Restroom", "image": "https://example.com/restroom.jpg"},
        {"name": "Workstation", "image": "https://example.com/workstation.jpg"},
        {"name": "Cafeteria", "image": "https://example.com/cafeteria.jpg"}
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
        "description": "Standard AC Charging"
      },
      "chargingPlugs": [
        {
          "name": "Type 2 Mennekes",
          "status": "Available",
          "capacity": "50 kW",
          "image": "assets/type 2 mennekes.png"
        },
        {
          "name": "CC COMBO TYPE 2",
          "status": "Occupied",
          "capacity": "50 kW",
          "image": "assets/ccs combo type 2.png"
        },
        {
          "name": "CC COMBO TYPE 2",
          "status": "Occupied",
          "capacity": "50 kW",
          "image": "assets/ccs combo type 2.png"
        },
        {
          "name": "Plug C",
          "status": "Available",
          "capacity": "50 kW",
          "image": "assets/ccs combo type 1.png"
        },
        {
          "name": "CHADEMO",
          "status": "Under Maintenance",
          "capacity": "50 kW",
          "image": "assets/chademo.png"
        }
      ],
      "amenities": [
        {"name": "Restroom", "image": "https://example.com/restroom.jpg"},
        {"name": "Wi-Fi", "image": "https://example.com/wifi.jpg"},
        {"name": "Lounge", "image": "https://example.com/lounge.jpg"}
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
        "description": "Direct Current Fast Charging"
      },
      "chargingPlugs": [
        {
          "name": "Plug A",
          "status": "Available",
          "capacity": "150 kW",
          "image": "https://example.com/plug_a.jpg"
        },
        {
          "name": "Plug B",
          "status": "Operational",
          "capacity": "150 kW",
          "image": "https://example.com/plug_b.jpg"
        }
      ],
      "amenities": [
        {"name": "Restroom", "image": "https://example.com/restroom.jpg"},
        {"name": "Cafeteria", "image": "https://example.com/cafeteria.jpg"}
      ],
      "parkingFee": 5.00,
      "costPerHour": 2.50,
      "address": "202 Industrial Road, Kochi Industrial Zone",
      "image": "https://example.com/solarspark_station_5.jpg"
    }
  ];

  
}
