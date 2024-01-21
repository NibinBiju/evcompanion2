import 'dart:convert';
import 'package:evcompanion2/view_booking/view_booking.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: _getAllUserData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              List<Widget> userContainers = [];

              for (var userData in snapshot.data!) {
                userContainers.add(
                  InkWell(
                    onTap: (){
                     // Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewBookingPage(user: userData['email'],)));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(16.0),
                      margin: EdgeInsets.only(bottom: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Name: ${userData['name']}'),
                          Text('Email: ${userData['email']}'),
                          Text('Phone: ${userData['phone']}'),
                        ],
                      ),
                    ),
                  ),
                );
              }

              return Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: userContainers,
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Future<List<Map<String, String>>> _getAllUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String>? userListString = preferences.getStringList('userListKey');

    if (userListString == null || userListString.isEmpty) {
      return [];
    }

    List<Map<String, String>> userList = userListString
        .map((userString) => Map<String, String>.from(json.decode(userString)))
        .toList();

    return userList;
  }
}
