import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../presentation/view/login_screen/login_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:evcompanion2/presentation/widgets/mytextfield.dart';
import 'package:evcompanion2/presentation/widgets/customButtom.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final name_ctrl = TextEditingController();
  final uname_ctrl = TextEditingController();
  final phone_ctrl = TextEditingController();
  final password_ctrl = TextEditingController();
  late SharedPreferences Preferences;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // Image.asset('assets/icon1.png',  height: 100, width: 100, ),
                const Text(
                  "Sign up",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Please enter the details below to continue",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
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
                      myTextField("Full name", "Full name", TextInputType.text,
                          name_ctrl),
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
                        // style: ItemNameStyle,
                        controller: password_ctrl,
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: "password must be 6 character",
                          // hintStyle: textHintStyle,
                          labelText: 'Password',
                          //labelStyle:  textStyle3,
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
                                  ))
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
                const SizedBox(
                  height: 40,
                ),
                customButton("Sign up", () => storedata()),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  child: const Text("Do you have an account? Signin"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void storedata() async {
    String personname = name_ctrl.text;
    String username = uname_ctrl.text;
    String password = password_ctrl.text;
    String phone = phone_ctrl.text;

    Preferences = await SharedPreferences.getInstance();
    Preferences.setString('namekey', personname);
    Preferences.setString('unamekey', username);
    Preferences.setString('passkey', password);
    Preferences.setString('phonekey', phone);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const LoginScreen()));
  }
}
