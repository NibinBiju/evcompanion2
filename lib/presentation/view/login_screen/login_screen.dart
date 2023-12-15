import 'package:flutter/material.dart';
import 'package:evcompanion2/registration_page/registration_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../bottom_nav_pages/bottom_nav_controller.dart';
import 'package:evcompanion2/presentation/widgets/mytextfield.dart';
import 'package:evcompanion2/presentation/widgets/customButtom.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final uname_ctrl = TextEditingController();
  final passwd_ctrl = TextEditingController();
  bool _obscureText = true;
  late SharedPreferences Preferences;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
//title:
//Center(child: Text( "login", )),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // Image.asset('assets/icon1.png',  height: 100, width: 100, ),
                // CircleAvatar(
                //   radius: 42,
                //   foregroundImage: AssetImage('assets/evcomp.jpg'),
                // ),
                const Text(
                  "Log in",
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
                  height: 50,
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
                      myTextField(
                        "Email address",
                        "Email address",
                        TextInputType.text,
                        uname_ctrl,
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
                        controller: passwd_ctrl,
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
                                  icon: const Icon(
                                    Icons.visibility_off,
                                  ))
                              : IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _obscureText = true;
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.remove_red_eye,
                                  )),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                customButton("Login", () => validateandLogin()),

                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => RegistrationPage()));
                  },
                  child: const Text("Don't you have an account? SignUp"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateandLogin() async {
    Preferences = await SharedPreferences.getInstance();
    String storedusername = Preferences.getString('unamekey')!;
    String storedpassword = Preferences.getString('passkey')!;
    // values that we entered at text field
    String username = uname_ctrl.text;
    String password = passwd_ctrl.text;

    if (storedusername == username &&
        storedpassword == password &&
        storedusername.isNotEmpty &&
        storedpassword.isNotEmpty) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const BottomNavController()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "Invalid username or password",
        ),
        backgroundColor: Colors.red,
      ));
    }
  }
}
