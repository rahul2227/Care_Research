import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:research_app/bars/menu_bar.dart';
import 'package:research_app/screens/chatroom.dart';
import 'package:research_app/screens/search.dart';

class Research extends StatelessWidget {
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          drawer: NavDrawer(),
          appBar: AppBar(
            backgroundColor: Colors.white,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                iconSize: 28,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchO()));
                },
                // size: 28,
              ),
              SizedBox(
                width: 20,
              )
            ],
            // leading: IconButton(
            //   icon: Icon(
            //     Icons.menu,
            //     color: Colors.black,
            //     size: 28,
            //   ),
            //   onPressed: () {},
            // ),
            iconTheme: new IconThemeData(color: Colors.black),
            bottom: TabBar(
              //height: 100,
              tabs: [
                Tab(icon: Icon(Icons.layers, size: 28, color: Colors.black)),
                Tab(icon: Icon(Icons.group, size: 28, color: Colors.black)),
              ],
              //indicatorColor: Colors.white,
            ),
            title: Text('Research',
                style: TextStyle(
                  color: Colors.black,
                  // fontFamily: "Nexa",
                  fontSize: 20,
                )),
            // centerTitle: true,
          ),
          body: TabBarView(children: <Widget>[
            AllResearches(),
            ChatRoom(),
          ])),
    );
  }
}

class AllResearches extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Container(
            // height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueGrey.shade500, width: 3.0),
              borderRadius: BorderRadius.circular(20),
            ),
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
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
