import 'dart:convert';
import 'dart:io';

import 'package:evcompanion2/model/add_vehicle_model/add_vehicle.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class AddVehicleProvider with ChangeNotifier {
  var jsondata;
  AddVehicleModel? addVehicleModel;
  bool isLoading = false;
  XFile? image;

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

  Future<void> pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    image = pickedFile;
    notifyListeners();
  }

  Future<void> addVehiclePostData(
      {
      required String make,
      required String model,
      required String year,
      required String batteryCapacity,
      required String chargingTime,
      required String vehicleImage}) async {
    var uri = Uri.parse('http://10.0.2.2:8000/api/addVehicle/');
    var request = http.MultipartRequest('POST', uri);
    // request.fields['uid'] = uid;
    request.fields['make'] = make;
    request.fields['model'] = model;
    request.fields['year'] = year;
    request.fields['battery_capacity'] = batteryCapacity;
    request.fields['charging_time'] = chargingTime;

    if (image != null) {
      var imageFile = File(image!.path);
      var stream = http.ByteStream(imageFile.openRead());
      var length = await imageFile.length();
      var multipartFile = http.MultipartFile('vehicle_image', stream, length,
          filename: 'vehicle_image.jpg');
      request.files.add(multipartFile);
    }

    try {
      var response = await request.send();

      // Check if the request was successful
      if (response.statusCode == 200) {
        print('Vehicle added successfully');
      } else {
        print('Failed to add vehicle. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error adding vehicle: $error');
    }

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
