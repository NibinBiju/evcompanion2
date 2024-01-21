import 'package:evcompanion2/utils/colorConstants.dart';
import 'package:evcompanion2/view_booking/view_booking.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:evcompanion2/presentation/widgets/card_widget1.dart';
import 'package:evcompanion2/presentation/view/settings_page/my_profile.dart';
import 'package:evcompanion2/presentation/view/settings_page/my_favourite.dart';
import 'package:evcompanion2/presentation/view/settings_page/terms_conditions.dart';
import 'package:evcompanion2/presentation/view/my_vehicle_page/my_vehicle.dart';
import 'package:evcompanion2/presentation/view/login_screen/login_screen.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final pages = [
    myProfile(),
    const MyVehicle(),
    const MyFavourites(),
    ViewBookingPage(),
    Terms_Conditions(),
    LoginFire(),
  ];
  var iconName = [
    "profile",
    "My Vehicle",
    "My Favourite",
    "My Booking",
    "Terms & Conditions",
    "Logout",
  ];
  static const icons = <IconData>[
    Icons.person,
    Icons.car_rental,
    Icons.favorite,
    Icons.calendar_today_outlined,
    Icons.security_outlined,
    Icons.logout,
  ];
  late SharedPreferences preferences;
  String? name;
  String? email;

  @override
  void initState() {
    fetchdata();
    super.initState();
  }

  // to read data from shared preference
  void fetchdata() async {
    preferences = await SharedPreferences.getInstance();
    setState(() {
      name = preferences.getString('namekey')!;
      email = preferences.getString('unamekey')!;
    });
  }

  Future<void> _showLogoutDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Logout"),
          content: const Text("Are you sure you want to logout?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                // Perform logout action here
                // For example, you can clear the shared preferences
                // and navigate to the login screen
                preferences.clear();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginFire()),
                );
              },
              child: const Text("Logout"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
                color: myappbarColor,
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 40.0,
                    child: Icon(
                      Icons.person,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    " $name",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    " $email",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: myappbarColor,
              ),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: iconName.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CardWidget1(
                            iconName: iconName[index],
                            icons: icons[index],
                            pageName: pages[index],
                            onTap: () {
                              if (index == pages.length) {
                                _showLogoutDialog();
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => pages[index],
                                  ),
                                );
                              }
                             },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
