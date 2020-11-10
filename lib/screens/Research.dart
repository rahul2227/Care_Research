import 'package:cubic/screens/chatroom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Research extends StatelessWidget {
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            // actions: <Widget>[
            //   Icon(
            //     Icons.search,
            //     size: 28,
            //   )
            // ],
            leading: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
                size: 28,
              ),
              onPressed: () {},
            ),
            bottom: TabBar(
              //height: 100,
              tabs: [
                Tab(icon: Icon(Icons.layers, size: 28, color: Colors.white)),
                Tab(icon: Icon(Icons.group, size: 28, color: Colors.white)),
              ],
              indicatorColor: Colors.white,
            ),
            title: Text('Research',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Nexa",
                  fontSize: 28,
                )),
            centerTitle: true,
          ),
          body: TabBarView(children: <Widget>[
            AllResearches(),
            ChatRoom_I(),
          ])),
    );
  }
}

class AllResearches extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView(scrollDirection: Axis.vertical, children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 50),
            height: 150,
            width: 200,
            //color: Colors.blueGrey.shade300,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueGrey.shade500, width: 3.0),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.all(
                    //     Radius.circular(10),
                    //   ),
                    // ),
                    padding: EdgeInsets.all(4.0),
                    //height:
                    //width: double.infinity,
                    child: Card(
                        color: Colors.grey.shade300,
                        child: Column(
                          //mainAxisAlignment: MainAxisSize.min,
                          children: <Widget>[
                            new ListTile(
                              //leading: Icon(Icons.album)
                              title: Text('CareCube Research'),
                              subtitle: Text(
                                  "Carecube is the project, where we are focussing on Remotyfying the neuro patients and Neuro Doctors"),
                            ),
                            FlatButton(
                              color: Colors.blue.shade300,
                              child: const Text('JOIN'),
                              onPressed: () {
                                print('User Joined Research Community');
                              },
                            )
                          ],
                        )),
                  )
                ],
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 50),
              height: 150,
              width: 200,
              //color: Colors.blueGrey.shade300,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueGrey.shade500, width: 3.0),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      //padding: EdgeInsets.all(4.0),
                      //height:
                      //width: double.infinity,
                      child: Card(
                          color: Colors.grey.shade300,
                          child: Column(
                            //mainAxisAlignment: MainAxisSize.min,
                            children: <Widget>[
                              const ListTile(
                                //leading: Icon(Icons.album)
                                title: Text('CareCube Research'),
                                subtitle: Text(
                                    "Carecube is the project, where we are focussing on Remotyfying the neuro patients and Neuro Doctors"),
                              ),
                              FlatButton(
                                color: Colors.blue.shade300,
                                child: const Text('JOIN'),
                                onPressed: () {
                                  print('User Joined Research Community');
                                },
                              )
                            ],
                          )),
                    )
                  ],
                ),
              ))
        ]));
  }
}

class GroupChats extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity, width: double.infinity, color: Colors.red);
  }
}
