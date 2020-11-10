import 'package:cubic/screens/chatroom.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("Rahul Cube "),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Icon(Icons.account_circle),
          new Container(
            width: 50,
          ),
          new Container(
            child: Text("Feed"),
          ),
          new Container(
            width: 50,
          ),
          Container(
            child: RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatRoom_I(),
                  ),
                );
              },
              child: new Text("chat screens"),
            ),
          ),
        ],
      ),
    );
  }
}
