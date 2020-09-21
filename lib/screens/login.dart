import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:research_app/bars/b_nav_bar.dart';
import 'package:research_app/helper/helperfunctions.dart';
import 'package:research_app/services/database.dart';

class LoginPage extends StatefulWidget {
  final Function toggleView;

  LoginPage(this.toggleView);
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();

  FirebaseAuth authc = FirebaseAuth.instance;

  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  signIn() async {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });

      // await authService
      //     .signInWithEmailAndPassword(
      //         emailEditingController.text, passwordEditingController.text)
      //     .then((result) async {
      //   if (result != null) {
      //     QuerySnapshot userInfoSnapshot =
      //         await DatabaseMethods().getUserInfo(emailEditingController.text);

      //     HelperFunctions.saveUserLoggedInSharedPreference(true);
      //     HelperFunctions.saveUserNameSharedPreference(
      //         userInfoSnapshot.documents[0].data["userName"]);
      //     HelperFunctions.saveUserEmailSharedPreference(
      //         userInfoSnapshot.documents[0].data["userEmail"]);

      //     Navigator.pushReplacement(
      //         context, MaterialPageRoute(builder: (context) => ChatRoom()));
      //   } else {
      //     setState(() {
      //       isLoading = false;
      //       //show snackbar
      //     });
      //   }
      // });

      await authc
          .signInWithEmailAndPassword(
              email: emailEditingController.text,
              password: passwordEditingController.text)
          .then((value) async {
        if (value != null) {
          QuerySnapshot userInfoSnapshot =
              await DatabaseMethods().getUserInfo(emailEditingController.text);

          HelperFunctions.saveUserLoggedInSharedPreference(true);
          HelperFunctions.saveUserNameSharedPreference(
              userInfoSnapshot.docs[0].get("userName"));
          HelperFunctions.saveUserEmailSharedPreference(
              userInfoSnapshot.docs[0].get("userEmail"));

          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => BottomNavBar()));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isLoading
            ? Container(
                child: Center(child: CircularProgressIndicator()),
              )
            : Padding(
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
                              validator: (val) {
                                return RegExp(
                                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(val)
                                    ? null
                                    : "Please Enter Correct Email";
                              },
                              controller: emailEditingController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                      color: Colors.green, width: 0.0),
                                ),
                                labelStyle: TextStyle(color: Colors.grey),
                                labelText: 'Email',
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: TextFormField(
                              validator: (val) {
                                return val.length > 6
                                    ? null
                                    : "Enter Password 6+ characters";
                              },
                              obscureText: true,
                              controller: passwordEditingController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                labelText: 'Password',
                              ),
                            ),
                          ),
                          FlatButton(
                            onPressed: () {
                              //forgot password screen
                            },
                            textColor: Colors.black,
                            child: Text('Forgot Password'),
                          ),
                          Container(
                              height: 50,
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: RaisedButton(
                                textColor: Colors.white,
                                //color: Colors.blue,
                                child: Text('Login'),
                                color: Colors.green,

                                onPressed: () {
                                  // print(emailEditingController.text);
                                  // print(passwordEditingController.text);
                                  signIn();
                                },
                              )),
                          Container(
                              child: Row(
                            children: <Widget>[
                              Text('New to the community?'),
                              FlatButton(
                                textColor: Colors.blue,
                                child: Text(
                                  'Sign in',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.green),
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
                    ),
                  ),
                )));
  }
}
