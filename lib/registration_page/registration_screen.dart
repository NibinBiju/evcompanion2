import 'dart:convert';
import 'package:evcompanion2/registration_page/google_signin/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:evcompanion2/controller/firebase_controller.dart';
import 'package:evcompanion2/presentation/view/login_screen/fire_db.dart';
import 'package:evcompanion2/presentation/view/login_screen/login_screen.dart';
import 'package:evcompanion2/presentation/widgets/mytextfield.dart';

class Register_fire extends StatefulWidget {
  @override
  State<Register_fire> createState() => _RegistrationFireState();
}

class _RegistrationFireState extends State<Register_fire> {
  FirebseController firebseController = FirebseController();

  final name_ctrl = TextEditingController();
  final uname_ctrl = TextEditingController();
  final phone_ctrl = TextEditingController();
  final password_ctrl = TextEditingController();
  final confirlpass_ctrl=TextEditingController();
  late SharedPreferences preferences;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registration")),
      body: SingleChildScrollView(
        child: Column(
          children: [
             Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Full name',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey.shade700,
                        ),
                      )
                    ],
                  ),
                  myTextField(
                      "Full name", "Full name", TextInputType.text, name_ctrl),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Email address',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey.shade700,
                        ),
                      )
                    ],
                  ),
                  myTextField("Email address", "Email address",
                      TextInputType.text, uname_ctrl),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Phone number',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey.shade700,
                        ),
                      )
                    ],
                  ),
                  myTextField("Phone number", "Phone number",
                      TextInputType.number, phone_ctrl),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey.shade700,
                        ),
                      )
                    ],
                  ),
                  TextField(
                    controller: password_ctrl,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: "Password must be 6 characters",
                      labelText: 'Password',
                      suffixIcon: _obscureText == true
                          ? IconButton(
                              onPressed: () {
                                setState(() {
                                  _obscureText = false;
                                });
                              },
                              icon: Icon(
                                Icons.remove_red_eye,
                                size: 20.w,
                              ),
                            )
                          : IconButton(
                              onPressed: () {
                                setState(() {
                                  _obscureText = true;
                                });
                              },
                              icon: Icon(
                                Icons.visibility_off,
                                size: 20.w,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Confirm Password',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey.shade700,
                        ),
                      )
                    ],
                  ),
                  TextField(
                    controller: confirlpass_ctrl,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: "Confirm Password",
                      labelText: 'Confirm Password',
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          size: 20.w,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (password_ctrl.text != confirlpass_ctrl.text) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Passwords do not match")),
                        );
                        return;
                      }
                  
                      String mail = uname_ctrl.text.trim();
                      String pwd = password_ctrl.text.trim();
                  
                      FirebaseHelper().signUp(email: mail, password: pwd).then((result) {
                        if (result == null) {
                          storeData();
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => LoginFire()),
                          );
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text(result)));
                        }
                      });
                    },
                    child: Text('Register')),
                ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton
                    (onPressed: (){
                      final provider=Provider.of<GoogleSignInProvider>
                      (context,listen: false);
                      provider.googleLogin();
                    }, child: Text("Google Sign-in")),
                  )
              ],
            )
          ],
        ),
      ),
    );
  }

  void storeData() async {
    String personName = name_ctrl.text;
    String username = uname_ctrl.text;
    String password = password_ctrl.text;
    String phone = phone_ctrl.text;

    preferences = await SharedPreferences.getInstance();

    List<Map<String, String>> userList = preferences
            .getStringList('userListKey')
            ?.map((userString) =>
                Map<String, String>.from(json.decode(userString)))
            .toList() ??
        [];

    userList.add({
      'name': personName,
      'email': username,
      'phone': phone,
      'password': password,
    });

    preferences.setStringList(
        'userListKey', userList.map((user) => json.encode(user)).toList());
    preferences.setString('namekey', personName);
    preferences.setString('unamekey', username);
    preferences.setString('phonekey', phone);
    preferences.setString('passkey', password);
  }
}
