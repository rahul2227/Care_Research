import 'package:flutter/material.dart';
import 'package:research_app/helper/constants.dart';
import 'package:research_app/helper/helperfunctions.dart';
import 'package:research_app/screens/Home.dart';
import 'package:research_app/screens/Research.dart';
import 'package:research_app/screens/Spec.dart';
import 'package:research_app/screens/search.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 1;

  @override
  void initState() {
    updateuser();
    super.initState();
  }

  updateuser() async {
    Constants.myName = await HelperFunctions.getUserNameSharedPreference();
    print("current user is ${Constants.myName}");
  }

  final tabs = [
    Center(
      child: Spec(),
    ),
    Center(
      child: Home(),
    ),
    Center(
      child: Research(),
    ),
    Center(
      child: SearchO(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
            title: Text('Neuro Community'),
            backgroundColor: Colors.blue,
            leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
              size: 28,
            )
            //onPressed: () {},
          ),
          ),*/

      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.grey,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.view_module,
            ),
            title: Text('Datasets'),
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.book),
              title: Text('Research'),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text("Search"),
            backgroundColor: Colors.black,
          )
        ],
        onTap: (index) {
          setState(
            () {
              _currentIndex = index;
            },
          );
        },
      ),
    );
  }
}
