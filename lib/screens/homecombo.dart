// import 'package:cubic/screens/chatroom.dart';
import 'package:cubic/screens/homesc_middle.dart';
import 'package:cubic/screens/research.dart';
import 'package:cubic/screens/spec.dart';
import 'package:flutter/material.dart';

class HomeCombo extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<HomeCombo> {
  int _currentIndex = 1;

  final tabs = [
    //Center(child: Text('Spec')),
    //Center(child: Text('Home')),
    //Center(child: Text('Research')),
    Center(
      child: Spec(),
    ),
    Center(
      child: HomeMiddle(),
    ),
    Center(
      child: Research(),
      // child: ChatRoom(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Neuro Community'),
      //   backgroundColor: Colors.blue,
      //   leading: IconButton(
      //       onPressed: () {
      //         //TODO
      //       },
      //       icon: Icon(
      //         Icons.menu,
      //         color: Colors.white,
      //         size: 28,
      //       )
      //       //onPressed: () {},
      //       ),
      // ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        //backgroundColor: Colors.blue,
        iconSize: 25,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.view_module),
            title: Text('Specification'),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.book),
              title: Text('Research'),
              backgroundColor: Colors.blue),
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
