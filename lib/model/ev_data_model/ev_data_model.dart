class ChargingStation {
  String stationName;
  String location;
  double latitude;
  double longitude;
  ChargingType chargingType;
  List<ChargingPlug> chargingPlugs;
  List<Amenity> amenities;
  double parkingFee;
  double costPerHour;
  String address;
  String image;

  ChargingStation.fromJson(Map<String, dynamic> json)
      : stationName = json['stationName'],
        location = json['location'],
        latitude = json['latitude'],
        longitude = json['longitude'],
        chargingType = ChargingType.fromJson(json['chargingType']),
        chargingPlugs = List<ChargingPlug>.from(
            json['chargingPlugs'].map((plug) => ChargingPlug.fromJson(plug))),
        amenities = List<Amenity>.from(
            json['amenities'].map((amenity) => Amenity.fromJson(amenity))),
        parkingFee = json['parkingFee'],
        costPerHour = json['costPerHour'],
        address = json['address'],
        image = json['image'];
}

class ChargingType {
  String name;
  String description;

  ChargingType.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        description = json['description'];
}

class ChargingPlug {
  String name;
  String status;
  String capacity;
  String image;

  ChargingPlug.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        status = json['status'],
        capacity = json['capacity'],
        image = json['image'];
}

class Amenity {
  String name;
  String image;

  Amenity.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        image = json['image'];
}
