import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:research_app/bars/b_nav_bar.dart';
import 'package:research_app/helper/helperfunctions.dart';
import 'package:research_app/services/database.dart';

class SignupPage extends StatefulWidget {
  final Function toggleView;

  SignupPage(this.toggleView);
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();
  TextEditingController usernameEditingController = new TextEditingController();

  FirebaseAuth authc = FirebaseAuth.instance;
  DatabaseMethods databaseMethods = new DatabaseMethods();

  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  signUp() async {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });

      await authc
          .createUserWithEmailAndPassword(
              email: emailEditingController.text,
              password: passwordEditingController.text)
          .then((value) async {
        if (value != null) {
          QuerySnapshot userInfoSnapshot =
              await DatabaseMethods().getUserInfo(emailEditingController.text);

          Map<String, String> userDataMap = {
            "userName": usernameEditingController.text,
            "userEmail": emailEditingController.text
          };

          databaseMethods.addUserInfo(userDataMap);

          HelperFunctions.saveUserLoggedInSharedPreference(true);
          HelperFunctions.saveUserNameSharedPreference(
              userInfoSnapshot.docs[0].get("userName"));
          HelperFunctions.saveUserEmailSharedPreference(
              userInfoSnapshot.docs[0].get("userEmail"));

          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => BottomNavBar()));
        } else {
          setState(() {
            isLoading = false;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Container(
              height: 500,
              child: Form(
                key: formKey,
                child: ListView(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: usernameEditingController,
                        validator: (val) {
                          return val.isEmpty || val.length < 3
                              ? "Enter Username 3+ characters"
                              : null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          labelText: 'User Name',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: emailEditingController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          labelText: 'Email',
                        ),
                        validator: (val) {
                          return RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(val)
                              ? null
                              : "Enter correct email";
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          labelText: 'Password',
                        ),
                        controller: passwordEditingController,
                        validator: (val) {
                          return val.length < 6
                              ? "Enter Password 6+ characters"
                              : null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                        height: 50,
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: RaisedButton(
                          textColor: Colors.white,
                          child: Text('Sign Up'),
                          color: Colors.green,
                          onPressed: () {
                            signUp();
                          },
                        )),
                    Container(
                        child: Row(
                      children: <Widget>[
                        Text('Already in the Community'),
                        FlatButton(
                          textColor: Colors.green,
                          child: Text(
                            'LOGIN',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            //signup screen
                            widget.toggleView();
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ))
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
