import 'package:face_tag/MVC/CONTROLLERS/BaseAuth.dart';
import 'package:face_tag/MVC/UTILITY/Shared_preferences.dart';
import 'package:face_tag/MVC/VIEWS/Home.dart';
import 'package:face_tag/MVC/VIEWS/Root.dart';
import 'package:flutter/material.dart';
import 'package:face_tag/MVC/VIEWS/Login.Dart';
import 'package:firebase_auth/firebase_auth.dart';


void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    context=context;
    return MaterialApp(
      title: 'Flutter Demo',
      color: Colors.purpleAccent,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.yellow,
        primaryColor: Colors.white,
        primarySwatch: Colors.purpleAccent[300],
      ),
      home: Root(),
      
    );
  }


 
}

