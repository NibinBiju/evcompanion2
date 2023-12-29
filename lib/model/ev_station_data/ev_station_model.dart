// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
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

    Welcome({
        required this.stationName,
        required this.location,
        required this.latitude,
        required this.longitude,
        required this.chargingType,
        required this.chargingPlugs,
        required this.amenities,
        required this.parkingFee,
        required this.costPerHour,
        required this.address,
        required this.image,
    });

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        stationName: json["stationName"],
        location: json["location"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        chargingType: ChargingType.fromJson(json["chargingType"]),
        chargingPlugs: List<ChargingPlug>.from(json["chargingPlugs"].map((x) => ChargingPlug.fromJson(x))),
        amenities: List<Amenity>.from(json["amenities"].map((x) => Amenity.fromJson(x))),
        parkingFee: json["parkingFee"]?.toDouble(),
        costPerHour: json["costPerHour"]?.toDouble(),
        address: json["address"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "stationName": stationName,
        "location": location,
        "latitude": latitude,
        "longitude": longitude,
        "chargingType": chargingType.toJson(),
        "chargingPlugs": List<dynamic>.from(chargingPlugs.map((x) => x.toJson())),
        "amenities": List<dynamic>.from(amenities.map((x) => x.toJson())),
        "parkingFee": parkingFee,
        "costPerHour": costPerHour,
        "address": address,
        "image": image,
    };
}

class Amenity {
    String name;
    String image;

    Amenity({
        required this.name,
        required this.image,
    });

    factory Amenity.fromJson(Map<String, dynamic> json) => Amenity(
        name: json["name"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
    };
}

class ChargingPlug {
    String name;
    String status;
    Capacity capacity;
    String image;

    ChargingPlug({
        required this.name,
        required this.status,
        required this.capacity,
        required this.image,
    });

    factory ChargingPlug.fromJson(Map<String, dynamic> json) => ChargingPlug(
        name: json["name"],
        status: json["status"],
        capacity: capacityValues.map[json["capacity"]]!,
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "status": status,
        "capacity": capacityValues.reverse[capacity],
        "image": image,
    };
}

enum Capacity {
    THE_150_K_W,
    THE_50_K_W
}

final capacityValues = EnumValues({
    "150 kW": Capacity.THE_150_K_W,
    "50 kW": Capacity.THE_50_K_W
});

class ChargingType {
    String name;
    String description;

    ChargingType({
        required this.name,
        required this.description,
    });

    factory ChargingType.fromJson(Map<String, dynamic> json) => ChargingType(
        name: json["name"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
