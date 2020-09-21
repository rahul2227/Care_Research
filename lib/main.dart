import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:research_app/helper/authenticate.dart';
import 'package:research_app/helper/helperfunctions.dart';
import 'package:research_app/screens/Home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute: "home",
//       routes: {
//         "home": (context) => MyHome(),
//         "homecombo": (context) => HomeCombo(),
//         "reg": (context) => MyReg(),
//         "login": (context) => MyLogin(),
//         "chat": (context) => MyChat(),
//       },
//     );
//   }
// }

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool userIsLoggedIn;

  @override
  void initState() {
    getLoggedInState();
    super.initState();
  }

  getLoggedInState() async {
    await HelperFunctions.getUserLoggedInSharedPreference().then((value) {
      setState(() {
        userIsLoggedIn = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CareCube',
      debugShowCheckedModeBanner: false,
      home: userIsLoggedIn != null
          ? userIsLoggedIn ? Home() : Authenticate()
          : Container(
              child: Center(
                child: Authenticate(),
              ),
            ),
    );
  }
}
