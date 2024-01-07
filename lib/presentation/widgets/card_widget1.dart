import 'package:flutter/material.dart';
import '../view/login_screen/login_screen.dart';
import '../view/settings_page/profile.dart';

class CardWidget1 extends StatelessWidget {
  final IconData icons;
  final String iconName;
  final Widget pageName;
 final Null Function() onTap;

  const CardWidget1({
    Key? key,
    required this.icons,
    required this.iconName,
    required this.pageName, required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.grey[200],
        child: InkWell(
          child: ListTile(
            contentPadding: const EdgeInsets.all(15),
            horizontalTitleGap: 30,
            leading: Icon(
              icons,
              color: Colors.black,
            ),
            title: Text(iconName),
            trailing: const Icon(Icons.navigate_next),
          ),
          // onTap: () {
          //   if (iconName == 'LogOut') {
          //     showDialog(
          //       context: context,
          //       builder: (BuildContext context) {
          //         return AlertDialog(
          //           title: Text("Alert"),
          //           content: Text("Are you sure you want to log out?"),
          //           actions: [
          //             TextButton(
          //               onPressed: () {
          //                 Navigator.pop(context);
          //               },
          //               child: Text("Cancel"),
          //             ),
          //             TextButton(
          //               onPressed:onTap,
          //               child: Text("Logout"),
          //             ),
          //           ],
          //         );
          //       },
          //     );
          //   } 
          //   // else {
          //   //   Navigator.of(context).push(
          //   //     MaterialPageRoute(builder: (context) => Profile()));
          //   // }
          // },
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>pageName));
          },
        ),
      );
}
