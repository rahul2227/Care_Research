import 'package:cubic/screens/homecombo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyLogin extends StatefulWidget {
  final Function toggleView;

  MyLogin(this.toggleView);
  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
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
          // QuerySnapshot userInfoSnapshot =
          //     await DatabaseMethods().getUserInfo(emailEditingController.text);

          // HelperFunctions.saveUserLoggedInSharedPreference(true);
          // HelperFunctions.saveUserNameSharedPreference(
          //     userInfoSnapshot.docs[0].data["userName"]);
          // HelperFunctions.saveUserEmailSharedPreference(
          //     userInfoSnapshot.docs[0].data["userEmail"]);

          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeCombo()));
        }
      });
    }
  }

  InputDecoration textFieldInputDecoration(String hintText) {
    return InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.blueGrey[500]),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blueGrey[200])),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blueGrey[200])));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Care Cube"),
      ),
      body: isLoading
          ? Container(
              child: Center(child: CircularProgressIndicator()),
            )
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Spacer(),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (val) {
                            return RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(val)
                                ? null
                                : "Please Enter Correct Email";
                          },
                          controller: emailEditingController,
                          style: TextStyle(
                              color: Colors.blueGrey[300], fontSize: 16),
                          decoration: textFieldInputDecoration("email"),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        TextFormField(
                          obscureText: true,
                          validator: (val) {
                            return val.length > 6
                                ? null
                                : "Enter Password 6+ characters";
                          },
                          style: TextStyle(
                              color: Colors.blueGrey[300], fontSize: 16),
                          controller: passwordEditingController,
                          decoration: textFieldInputDecoration("password"),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     GestureDetector(
                  //       onTap: () {
                  //         Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //                 builder: (context) => ForgotPassword()));
                  //       },
                  //       child: Container(
                  //           padding: EdgeInsets.symmetric(
                  //               horizontal: 16, vertical: 8),
                  //           child: Text(
                  //             "Forgot Password?",
                  //             style:
                  //                 TextStyle(color: Colors.white, fontSize: 16),
                  //           )),
                  //     )
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 16,
                  // ),
                  GestureDetector(
                    onTap: () {
                      signIn();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xff007EF4),
                              const Color(0xff2A75BC)
                            ],
                          )),
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            color: Colors.blueGrey[300], fontSize: 17),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.cyan),
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "Sign In with Google",
                      style: TextStyle(fontSize: 17, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have account? ",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      GestureDetector(
                        onTap: () {
                          widget.toggleView();
                        },
                        child: Text(
                          "Register now",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
    );
  }
}
