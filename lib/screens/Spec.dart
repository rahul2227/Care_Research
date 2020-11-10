import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Spec extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Neuro Community'),
        backgroundColor: Colors.blue,
        leading: IconButton(
            onPressed: () {
              //TODO
            },
            icon: Icon(
              Icons.menu,
              color: Colors.white,
              size: 28,
            )
            //onPressed: () {},
            ),
      ),
      body: Container(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20),
                Container(
                  height: 100,
                  width: 300,
                  child: Card(
                    color: Colors.blueAccent,
                    child: Text('Computational NeueoScience'),
                    elevation: 10,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 100,
                  width: 300,
                  child: Card(
                    color: Colors.blueAccent,
                    child: Text('Computational NeueoScience'),
                    elevation: 10,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 100,
                  width: 300,
                  child: Card(
                    color: Colors.blueAccent,
                    child: Text('Computational NeueoScience'),
                    elevation: 10,
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
