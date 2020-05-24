import 'package:face_tag/MVC/VIEWS/SideMenu.dart';
import 'package:flutter/material.dart';
class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title:Text('Settings'),
      ),
      body: Column(),
    );
  }
}