// import 'package:flutter/material.dart';

// class StationState extends ChangeNotifier {
//   List<Map<String, dynamic>> _stationData;

//   StationState(List<Map<String, dynamic>> initialData) : _stationData = initialData;

//   List<Map<String, dynamic>> get stationData => _stationData;

//   void toggleStationState(int index) {
//     if (_stationData[index]['stationState'] == 'Available') {
//       _stationData[index]['stationState'] = 'Not Available';
//     } else {
//       _stationData[index]['stationState'] = 'Available';
//     }

//     notifyListeners();
//   }
// }
import 'package:flutter/material.dart';

class StationState extends ChangeNotifier {
  List<Map<String, dynamic>> _stationData;

  StationState(List<Map<String, dynamic>>? initialData) : _stationData = initialData ?? [];

  List<Map<String, dynamic>> get stationData => _stationData;

  void toggleStationState(int index) {
    if (_stationData[index]['stationState'] == 'Available') {
      _stationData[index]['stationState'] = 'Not Available';
    } else {
      _stationData[index]['stationState'] = 'Available';
    }

    notifyListeners();
  }
}
