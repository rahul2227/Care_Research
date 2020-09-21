import 'package:flutter/material.dart';
import 'package:research_app/helper/authenticate.dart';
import 'package:research_app/helper/signFunc.dart';
import 'package:research_app/screens/Research.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // DrawerHeader(
          //   child: Text(
          //     'Side menu',
          //     style: TextStyle(color: Colors.black, fontSize: 25),
          //   ),
          // decoration: BoxDecoration(
          //     color: Colors.green,
          //     image: DecorationImage(
          //         fit: BoxFit.fill,
          //         image: AssetImage('assets/images/brain.jpg'))),
          // ),
          SizedBox(
            height: 80,
          ),
          ListTile(
            leading: Icon(Icons.group),
            title: Text('CURRENT JOBS'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Research()));
              // Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('BOOKMARKS'),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(Icons.label_important),
            title: Text('MARKED DATASETS'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('SETTINGS'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              AuthService().signOut();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Authenticate()));
            },
          ),
        ],
      ),
    );
  }
}
