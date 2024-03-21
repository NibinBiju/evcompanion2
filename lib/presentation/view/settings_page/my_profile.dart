import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:evcompanion2/presentation/view/settings_page/edit_profile.dart';

class myProfile extends StatefulWidget {
  @override
  State<myProfile> createState() => _myProfileState();
}

class _myProfileState extends State<myProfile> {
  late SharedPreferences Preferences;
  String? tname;
  String? tuname;
  String? tphone;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    Preferences = await SharedPreferences.getInstance();
    setState(() {
      tname = Preferences.getString('namekey') ?? "";
      tuname = Preferences.getString('unamekey') ?? "";
      tphone = Preferences.getString('phonekey') ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.black,
        title: Text(
          "My Profile",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => EditProfile()),
              );
            },
            icon: Icon(Icons.edit),
          ),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                SizedBox(height: 30,),
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 50.0,
                  child: Icon(
                    Icons.person,
                    size: 70,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Name"),
                            Text("$tname", style: TextStyle(fontSize: 20)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Email"),
                            Text("$tuname", style: TextStyle(fontSize: 20)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Phone number"),
                            Text(
                              "$tphone",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
