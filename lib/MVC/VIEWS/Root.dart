import 'package:face_tag/MVC/CONTROLLERS/BaseAuth.dart';
import 'package:face_tag/MVC/VIEWS/Home.dart';
import 'package:flutter/material.dart';
import 'package:face_tag/MVC/VIEWS/Login.Dart';

class Root extends StatefulWidget {
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  Widget rootwiget;
  BuildContext mainContext;
  final Auth auth = Auth();
  @override
  void initState() {
    super.initState();
    setRoot();
    
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mainContext = context;
    return Material(
      child: rootwiget,
    );
  }

  setRoot() async {
    rootwiget = _buildWaitingScreen();
    var user = await auth.getCurrentUser();
     
      if (user != null) {
        setState(() {
          debugPrint('______+');
          rootwiget = Home();
        });
      } else {
        setState(() {
          debugPrint('______<');
          rootwiget = Login();
        });
      }
    
  }

  Widget _buildWaitingScreen() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
