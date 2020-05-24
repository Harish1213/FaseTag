import 'package:face_tag/MVC/VIEWS/SideMenu.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      drawer: SideMenu(),
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Column(),
    );
  }
}
