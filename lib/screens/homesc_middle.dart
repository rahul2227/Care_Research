import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomeMiddle extends StatelessWidget {
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
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              SizedBox(height: 20),
              Container(
                height: 300.0,
                width: 250,
                color: Colors.red,
                child: Column(children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(),
                    title: Text('Neuro Science'),
                    subtitle:
                        Text("BCI is a new trend in Neuro Computational World"),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://github.com/Venkatsainathreddy/Neuroapp/blob/master/neuro1.jpg"),
                        ),
                        color: Colors.blueGrey.shade100,
                      ),
                    ),
                  ),
                ]),
              ),
              SizedBox(height: 20),
              Container(
                height: 300.0,
                width: 250,
                color: Colors.red,
                child: Column(children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(),
                    title: Text('Neuro Science'),
                    subtitle:
                        Text("BCI is a new trend in Neuro Computational World"),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://github.com/Venkatsainathreddy/Neuroapp/blob/master/neuro1.jpg"),
                        ),
                        color: Colors.blueGrey.shade100,
                      ),
                    ),
                  ),
                ]),
              ),
              SizedBox(height: 20),
              Container(
                height: 300.0,
                width: 250,
                color: Colors.red,
                child: Column(children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(),
                    title: Text('Neuro Science'),
                    subtitle:
                        Text("BCI is a new trend in Neuro Computational World"),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://github.com/Venkatsainathreddy/Neuroapp/blob/master/neuro1.jpg"),
                        ),
                        color: Colors.blueGrey.shade100,
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
