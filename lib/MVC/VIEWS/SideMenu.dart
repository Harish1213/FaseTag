import 'dart:async';

import 'package:face_tag/MVC/VIEWS/FAQVC.dart';
import 'package:face_tag/MVC/VIEWS/FeedBack.dart';
import 'package:face_tag/MVC/VIEWS/Home.dart';
import 'package:face_tag/MVC/VIEWS/Profile.dart';
import 'package:face_tag/MVC/VIEWS/Root.dart';
import 'package:face_tag/MVC/VIEWS/Settings.dart';
import 'package:flutter/material.dart';
import 'package:face_tag/MVC/CONTROLLERS/BaseAuth.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      semanticLabel: 'harsh',
      elevation: 10,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'User menu',
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/main/Login/google.jpg'))),
            duration: Duration(seconds: 5),
          ),
          ListTile(
            leading: Icon(Icons.rss_feed),
            title: Text('Feeds'),
            onTap: () {
              Navigator.of(context).pop();

              Future.delayed(Duration(milliseconds: 200), () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              });
            },
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profile'),
            onTap: () {
              Navigator.of(context).pop();

              Future.delayed(Duration(milliseconds: 200), () {

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              });
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.of(context).pop();
              Future.delayed(Duration(milliseconds: 200), () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Settings()));
              });
            },
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Feedback'),
            onTap: () {
              Navigator.of(context).pop();
              Future.delayed(Duration(milliseconds: 200), () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FeedBack(),
                        fullscreenDialog: true));
              });
            },
          ),
          ListTile(
            leading: Icon(Icons.terrain),
            title: Text('FAQ'),
            onTap: (){
              Navigator.of(context).pop();
              Future.delayed(Duration(milliseconds:200),(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>FAQVC(),
                fullscreenDialog: true));
              });
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              Navigator.of(context).pop();
              Future.delayed(Duration(milliseconds: 200), () {
                final Auth auth = Auth();
                auth.signOut();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Root(), fullscreenDialog: true));
              });
            },
          ),
          
        ],
      ),
    );
  }

}
