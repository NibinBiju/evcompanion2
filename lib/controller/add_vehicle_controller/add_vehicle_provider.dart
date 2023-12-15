import 'dart:convert';

import 'package:evcompanion2/model/add_vehicle.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddVehicleProvider with ChangeNotifier {
  var jsondata;
  AddVehicleModel? addVehicleModel;
  bool isLoading = false;

  Future<void> addVehicleGetData() async {
    isLoading = true;
    notifyListeners();

    var uri = Uri.parse('http://10.0.2.2:8000/api/addVehicle/');
    var response = await http.get(uri);
    print(response.statusCode);
    print(response.body);
    jsondata = jsonDecode(response.body);
    addVehicleModel = AddVehicleModel.fromJson(jsondata);

    isLoading = false;
    notifyListeners();
  }

  Future<void> addVehiclePostData(
      {required String uid,
      required String make,
      required String model,
      required String year,
      required String batteryCapacity,
      required String chargingTime,
      required String vehicleImage}) async {
    var uri = Uri.parse('http://10.0.2.2:8000/api/addVehicle/');
    var response = await http.post(uri, body: {
      'make': make,
      'model': model,
      'year': year,
      'battery_capacity': batteryCapacity,
      'charging_time': chargingTime,
      'vehicle_image': vehicleImage,
    });
    print(response.statusCode);
    print(response.body);
  }
}
