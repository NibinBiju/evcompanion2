import 'package:evcompanion2/presentation/view/homepage/home.dart';
import 'package:evcompanion2/utils/colorConstants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:evcompanion2/presentation/widgets/card_widget1.dart';
import 'package:evcompanion2/presentation/view/settings_page/my_profile.dart';
import 'package:evcompanion2/presentation/view/settings_page/my_booking.dart';
import 'package:evcompanion2/presentation/view/settings_page/my_favourite.dart';
import 'package:evcompanion2/presentation/view/settings_page/terms_conditions.dart';
import 'package:evcompanion2/presentation/view/my_vehicle_page/my_vehicle.dart';
import 'package:evcompanion2/presentation/view/login_screen/login_screen.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final pages = [
    myProfile(),
    const MyVehicle(),
    const MyFavourites(),
    const MyBooking(),
    Terms_Conditions(),
    LoginScreen(),
  ];
  var iconName = [
    "profile",
    "My Vehicle",
    "My Favourite",
    "My Booking",
    "Terms & Conditions",
    "LogOut",
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
      email=preferences.getString('unamekey')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile",
        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            Positioned(
              left: 150,
              top: 10,
              child: Container(
                
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                    color: myappbarColor,
                    shape: BoxShape.circle),
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [CircleAvatar(
                     backgroundColor: Colors.grey,
              radius: 40.0,
              child: Icon(Icons.person,
              size: 60,
              color: Colors.white,),
                  ),
                    // const Icon(
                    //   Icons.person,
                    //   size: 40,
                    //   color: Colors.grey,
                   // ),
                    Text(
                      " $name",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      " $email",
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              decoration: const BoxDecoration(
                color: myappbarColor,
              ),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // SizedBox(height: 20.h),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: iconName.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CardWidget1(
                            iconName: iconName[index],
                            icons: icons[index],
                            pageName: pages[index],
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
