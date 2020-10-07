import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:research_app/bars/menu_bar.dart';

class Spec extends StatefulWidget {
  @override
  _SpecState createState() => _SpecState();
}

class _SpecState extends State<Spec> {
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text(
          'Data Sets',
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
            color: Colors.black,
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
                  height: 100,
                  color: Colors.white,
                  child: Row(children: <Widget>[
                    Container(
                      height: 100,
                      width: 25,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: ExactAssetImage('images/brain.jpg'),
                        fit: BoxFit.cover,
                      )),
                    ),
                    Expanded(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                  child: Container(
                                      margin: const EdgeInsets.only(
                                          top: 20.0, bottom: 10.0),
                                      child: Text(
                                        'DataSet 1 ',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          // decoration: TextDecoration.underline,
                                        ),
                                      )))
                            ],
                          ),
                          Flexible(
                            child: Container(
                              child: Text(
                                'As tech is increasing day by day the tech in Neuro Sciene is also advancing in all domians of it, and now-a-days the diseases related to brain like paralysis   ',
                                //overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                        ])),
                  ]),
                ),
              ),
              Container(
                height: 2,
                width: 30,
                color: Colors.blueGrey[300],
              )
            ],
          ),
        ),
      ),
    );
  }
}
