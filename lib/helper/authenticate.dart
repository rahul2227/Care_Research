import 'package:flutter/material.dart';
import 'package:research_app/screens/login.dart';
import 'package:research_app/screens/signup.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = false;

  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return LoginPage(toggleView);
    } else {
      return SignupPage(toggleView);
    }
  }
}
