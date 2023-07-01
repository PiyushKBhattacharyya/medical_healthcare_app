// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names, use_build_context_synchronously, duplicate_ignore, use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical_healthcare_app/screens/dialog_box/dialog_box_register.dart';
import 'package:medical_healthcare_app/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool PassToggle = true;

  late TextEditingController _textFieldController_name;
  late TextEditingController _textFieldController_email;
  late TextEditingController _textFieldController_phno;
  late TextEditingController _textFieldController_pass;

  @override
  void initState() {
    super.initState();
    _textFieldController_name = TextEditingController();
    _textFieldController_email = TextEditingController();
    _textFieldController_phno = TextEditingController();
    _textFieldController_pass = TextEditingController();
  }

  void dispose() {
    _textFieldController_name.dispose();
    _textFieldController_email.dispose();
    _textFieldController_phno.dispose();
    _textFieldController_pass.dispose();
    super.dispose();
  }

  Future<void> _register() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String name = _textFieldController_name.text;
    String email = _textFieldController_email.text;
    String phno = _textFieldController_phno.text;
    String pass = _textFieldController_pass.text;

    if (name.isNotEmpty &&
        email.isNotEmpty &&
        phno.isNotEmpty &&
        pass.isNotEmpty) {
      await prefs.setString('email', email);
      await prefs.setString('name', name);
      await prefs.setString('phno', phno);
      await prefs.setString('password', pass);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } else {
      showRequiredFieldsDialog(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Image.asset('assets/images/doctors.png'),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: TextField(
                controller: _textFieldController_name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Full Name"),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: TextField(
                controller: _textFieldController_email,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Email Address"),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: TextField(
                controller: _textFieldController_phno,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Phone Number"),
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: TextField(
                controller: _textFieldController_pass,
                obscureText: PassToggle ? true : false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Password"),
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
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: Material(
                color: Color(0xFF7165D6),
                borderRadius: BorderRadius.circular(10),
                child: InkWell(
                  onTap: () {
                    _register();
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                    child: Center(
                      child: Text(
                        "Create Account",
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Text(
                    'Log In',
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
