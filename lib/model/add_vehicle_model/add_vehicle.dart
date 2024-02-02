import 'dart:convert';

AddVehicleModel addVehicleFromJson(String str) =>
    AddVehicleModel.fromJson(json.decode(str));

String addVehicleToJson(AddVehicleModel data) => json.encode(data.toJson());

class AddVehicleModel {
  List<Datum>? data;
  String? message;

  AddVehicleModel({
    this.data,
    this.message,
  });

  factory AddVehicleModel.fromJson(Map<String, dynamic> json) => AddVehicleModel(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
      };
}

class Datum {
  String? uid;
  String? make;
  String? model;
  int? year;
  String? batteryCapacity;
  int? chargingTime;
  String? vehicleImage;

  Datum({
    this.uid,
    this.make,
    this.model,
    this.year,
    this.batteryCapacity,
    this.chargingTime,
    this.vehicleImage,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        uid: json["uid"],
        make: json["make"],
        model: json["model"],
        year: json["year"],
        batteryCapacity: json["battery_capacity"],
        chargingTime: json["charging_time"],
        vehicleImage: json["vehicle_image"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "make": make,
        "model": model,
        "year": year,
        "battery_capacity": batteryCapacity,
        "charging_time": chargingTime,
        "vehicle_image": vehicleImage,
      };
}

