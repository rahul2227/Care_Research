import 'package:cubic/widgets/ChaltListWidget.dart';
import 'package:cubic/widgets/InputWidget.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class ChatRoom_I extends StatefulWidget {
  @override
  _ChatRoom_IState createState() => _ChatRoom_IState();
}

// ignore: camel_case_types
class _ChatRoom_IState extends State<ChatRoom_I> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            // appBar: ChatAppBar(), // Custom app bar for chat screen
            body: Stack(children: <Widget>[
      Column(
        children: <Widget>[
          ChatListWidget(), //Chat list
          InputWidget() // The input widget
        ],
      ),
    ])));
  }
}
