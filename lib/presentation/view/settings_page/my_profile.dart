import 'package:evcompanion2/utils/colorConstants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';
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
  initState() {
    fetchData();
    super.initState();
  }

  void fetchData() async {
    Preferences = await SharedPreferences.getInstance()!;
    setState(() {
      tname = Preferences.getString('namekey')!;
      tuname = Preferences.getString('unamekey')!;
      tphone = Preferences.getString('phonekey')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "My Profile",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EditProfile()));
              },
              icon: Icon(Icons.edit))
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 50.0,
                  child: Icon(Icons.person,
                  size: 70,),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    padding: EdgeInsets.all(10.0), // Add padding here
                    decoration: BoxDecoration(
                      color: Colors.grey[200], // Set background color
                      borderRadius: BorderRadius.circular(8.0), // Set border radius
                    ),
                    child: Text("$tname"),
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    padding: EdgeInsets.all(10.0), // Add padding here
                    decoration: BoxDecoration(
                      color: Colors.grey[200], // Set background color
                      borderRadius: BorderRadius.circular(8.0), // Set border radius
                    ),
                    child: Text("$tuname"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    padding: EdgeInsets.all(10.0), // Add padding here
                    decoration: BoxDecoration(
                      color: Colors.grey[200], // Set background color
                      borderRadius: BorderRadius.circular(8.0), // Set border radius
                    ),
                    child: Text("$tphone"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      // body: Stack(
      //   children: [

      //     Column(mainAxisAlignment: MainAxisAlignment.start,
      //       children: [
      //         Container(
      //           height: 150,
      //           width: double.infinity,
      //           decoration: BoxDecoration(
                 
      //             image: DecorationImage(image: AssetImage("assets/green.jpg"),fit: BoxFit.cover)
      //           ),
                
      //         ),
      //       SizedBox(height: 20,),
      //         Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: Container(
      //             width: double.infinity,
      //             padding: EdgeInsets.all(13),
      //             decoration: BoxDecoration(
      //                color: myappColor,
      //               borderRadius: BorderRadius.circular(20)
      //             ),
                 
      //             child: Column(
      //               children: [
      //                 Column(
      //                   crossAxisAlignment: CrossAxisAlignment.center,
      //                   children: [
      //                     Padding(
      //                       padding: const EdgeInsets.all(8.0),
      //                       child: Container(
      //                         padding: EdgeInsets.all(8),
      //                         decoration: BoxDecoration(
      //                           borderRadius: BorderRadius.circular(20),
      //                           color: Colors.white,
      //                         ),
      //                         child: Text('$tname',style: TextStyle(
      //                           fontSize: 20,fontStyle: FontStyle.normal,fontWeight: FontWeight.bold
      //                         ),),
      //                       ),
      //                     ),
      //                     Padding(
      //                       padding: const EdgeInsets.all(8.0),
      //                       child: Container(
      //                         padding: EdgeInsets.all(8),
      //                         decoration: BoxDecoration(
      //                           borderRadius: BorderRadius.circular(20),
      //                           color: Colors.white,
      //                         ),
      //                         child: Text('$tuname',style: TextStyle(
      //                           fontSize: 20,fontStyle: FontStyle.normal,fontWeight: FontWeight.bold
      //                         ),),
      //                       ),
      //                     ),
      //                     Padding(
      //                       padding: const EdgeInsets.all(8.0),
      //                       child: Container(
      //                         padding: EdgeInsets.all(8),
      //                         decoration: BoxDecoration(
      //                           borderRadius: BorderRadius.circular(20),
      //                           color: Colors.white,
      //                         ),
      //                         child: Text('$tphone',style: TextStyle(
      //                           fontSize: 20,fontStyle: FontStyle.normal,fontWeight: FontWeight.bold
      //                         ),),
      //                       ),
      //                     )
      //                   ],
      //                 ),
      //               ],
      //             ),
      //           ),
      //         )
      //       ],
      //     ),
      //     Positioned(
      //             top: 50,
      //             left: 150,
      //             child: CircleAvatar(
      //             backgroundColor: Colors.black,
      //             radius: 55,
      //             backgroundImage: AssetImage('assets/pro.jpg'),                                ),
      //           ),
      //           Positioned(
      //             top: 120,
      //             left: 230,
      //             child: CircleAvatar(
      //               child: IconButton(onPressed: (){
      //                  Navigator.of(context).push(
      //                  MaterialPageRoute(builder: (context) => EditProfile()));
      //               }, icon: Icon(Icons.edit,size: 21,color: Colors.black)),
      //             )),
      //              IconButton(
      //               onPressed: (){
      //                 Navigator.of(context).pop();
      //               },
      //               icon: Icon(Icons.arrow_back_ios_outlined),
      //             ),
      //   ],
      // ),
    );
  }
}
