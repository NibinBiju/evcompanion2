
import 'package:evcompanion2/presentation/view/bottom_nav_pages/bottom_nav_controller.dart';
import 'package:evcompanion2/presentation/view/login_screen/fire_db.dart';
import 'package:evcompanion2/presentation/view/settings_page/Adminpage/admin.dart';
import 'package:evcompanion2/registration_page/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginFire extends StatefulWidget {
  const LoginFire({super.key});

  @override
  State<LoginFire> createState() => _LoginFireState();
}

class _LoginFireState extends State<LoginFire> {
  final uname_ctrl = TextEditingController();
  final passwd_ctrl = TextEditingController();
  bool _obscureText = true;
  late SharedPreferences Preferences;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration:
                  InputDecoration(border: OutlineInputBorder(), hintText: "Email"),
              controller: uname_ctrl,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Password"),
              controller: passwd_ctrl,
              obscureText: _obscureText,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              String mail = uname_ctrl.text.trim();
              String pwd = passwd_ctrl.text.trim();

              if (mail == 'admin@gmail.com' && pwd == 'admin123') {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => AdminHome()),
                );
              } else {
                FirebaseHelper().signIn(email: mail, password: pwd).then((result) {
                  if (result == null) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => BottomNavController()),
                    );
                  } else {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(result)));
                  }
                });
              }
            },
            child: const Text('Login'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Register_fire()),
              );
            },
            child: Text("Not a user? Register here!!"),
          )
        ],
      ),
    );
  }
}
