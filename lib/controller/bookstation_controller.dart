import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../model/my_booking_model/my_booking_model.dart';

class StationbookController with ChangeNotifier{
  List<MyBookingModel> bookingList=[];
  
  void addToList(MyBookingModel bookingModel)async {
      bookingList.add(bookingModel);
        await addBooking(bookingModel);
      notifyListeners();
  }
  var fireStore=FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;

  Future addBooking(MyBookingModel bookingModel) async{
    fireStore.collection('addBooking').doc(user!.uid).set(bookingModel.toMap());
  }
}