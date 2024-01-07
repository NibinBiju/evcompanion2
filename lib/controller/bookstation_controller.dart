import 'package:flutter/material.dart';
import '../model/my_booking_model/my_booking_model.dart';

class StationbookController with ChangeNotifier{
  List<MyBookingModel> bookingList=[];
  
  void addToList(MyBookingModel bookingModel){
      bookingList.add(bookingModel);
      notifyListeners();
  }
}