// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_build_context_synchronously, use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical_healthcare_app/screens/dialog_box/dialog_box_login.dart';
import 'package:medical_healthcare_app/screens/dialog_box/dialog_box_login_pass.dart';
import 'package:medical_healthcare_app/screens/dialog_box/dialog_box_login_email.dart';
import 'package:medical_healthcare_app/screens/home_screen.dart';
import 'package:medical_healthcare_app/screens/signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool PassToggle = true;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedEmail = prefs.getString('email');
    String? storedPassword = prefs.getString('password');
    String enteredEmail = _emailController.text;
    String enteredPassword = _passwordController.text;

    if (enteredEmail == storedEmail && enteredPassword == storedPassword) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      if (enteredEmail == storedEmail && enteredPassword != storedPassword) {
        showRequiredFieldsDialog_pass(context);
      }
      if (enteredEmail != storedEmail && enteredPassword == storedPassword) {
        showRequiredFieldsDialog_email(context);
      }
      if (enteredEmail != storedEmail && enteredPassword != storedPassword) {
        showRequiredFieldsDialog(context);
      }
    }
  }

  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Image.asset('assets/images/doctors.png'),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Enter email"),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: TextField(
                controller: _passwordController,
                obscureText: PassToggle ? true : false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Enter password"),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: InkWell(
                      onTap: () {
                        if (PassToggle == true) {
                          PassToggle = false;
                        } else {
                          PassToggle = true;
                        }
                        setState(() {});
                      },
                      child: PassToggle
                          ? Icon((CupertinoIcons.eye_slash_fill))
                          : Icon(CupertinoIcons.eye_fill),
                    )),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: Material(
                color: Color(0xFF7165D6),
                borderRadius: BorderRadius.circular(10),
                child: InkWell(
                  onTap: () {
                    _login();
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                    child: Center(
                      child: Text(
                        "Log In",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't Have an Account?",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpScreen()));
                  },
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF7165D6),
                    ),
                  ),
                ),
              ],
            )
          ],
        )),
      ),
    );
  }
}
