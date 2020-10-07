import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:research_app/bars/menu_bar.dart';

//import 'package:flutter_linkify/flutter_linkify.dart';
//import 'package:url_launcher/url_launcher.dart';
class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text(
          'Neuro Community',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        //
        iconTheme: new IconThemeData(color: Colors.black),
        actions: <Widget>[
          IconButton(
            icon: Image.asset('assets/images/brain.jpg'),
            iconSize: 30,
            onPressed: () {},
            color: Colors.green,
          )
        ],
      ),
      body: Container(
        child: Center(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              SizedBox(height: 10),
              Flexible(
                child: Container(
                  height: 130,
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: ExactAssetImage('assets/images/brain.jpg'),
                          fit: BoxFit.cover,
                        )),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(top: 20.0),
                                child: Text(
                                  'Title: BrainComputer Interface ',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                child: Text(
                                  'As tech is increasing day by day the tech in Neuro Sciene is also advancing in all domians of it, and now-a-days the diseases related to brain like paralysis, tumour in brain etc etc abcd abcd abcd abcd abcd abcd abcd ',
                                  //overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 2,
                width: MediaQuery.of(context).size.width * 0.75,
                color: Colors.blueGrey[300],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
