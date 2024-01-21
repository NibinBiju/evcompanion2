import 'package:cloud_firestore/cloud_firestore.dart';

class FirebseController {
  CollectionReference usercollection =
      FirebaseFirestore.instance.collection("user");
  addUser(
      {required String username,
      required int phonenumber,
      required String email,
      required String password}) async {
    usercollection.add({
      "name": username,
      "phone": phonenumber,
      "email": email,
      "password": password
    });
  }
}
