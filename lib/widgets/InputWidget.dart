import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cubic/config/pallet.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final TextEditingController textEditingController =
      new TextEditingController();

  String msg;

  final FirebaseFirestore fs = FirebaseFirestore.instance;
  final FirebaseAuth authc = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Material(
            child: new Container(
              margin: new EdgeInsets.symmetric(horizontal: 1.0),
              child: new IconButton(
                icon: new Icon(Icons.face),
                color: Palette.primaryColor,
                onPressed: null,
              ),
            ),
            color: Colors.white,
          ),

          // Text input
          Flexible(
            child: Container(
              child: TextField(
                onChanged: (value) {
                  msg = value;
                },
                style: TextStyle(
                    color: Palette.primaryTextColorLight, fontSize: 15.0),
                controller: textEditingController,
                decoration: InputDecoration.collapsed(
                  hintText: 'Type a message',
                  hintStyle: TextStyle(color: Palette.greyColor),
                ),
              ),
            ),
          ),

          // Send Message Button
          Material(
            child: new Container(
              margin: new EdgeInsets.all(8.0),
              child: new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: () => {
                        //TODO
                        fs
                            .collection('chatroom')
                            .doc("rahul_sharma")
                            .collection("chats")
                            .doc()
                            .set({
                          "message": msg,
                          "sendBy": authc.currentUser.email,
                        })
                      },
                  color: Palette.gradientEndColor),
            ),
            color: Colors.cyan[200],
          ),
        ],
      ),
      width: double.infinity,
      height: 50.0,
      decoration: new BoxDecoration(
          border: new Border(
              top: new BorderSide(color: Palette.greyColor, width: 0.5)),
          color: Colors.white),
      // margin: EdgeInsets.all(8.0),
    );
  }
}
