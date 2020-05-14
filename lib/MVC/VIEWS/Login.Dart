import 'dart:ui';

import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String _email;
  String _password;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      overflow: Overflow.clip,
      fit: StackFit.loose,
      children: <Widget>[
        Image.asset(
          'assets/main/Login/app_bg.jpg',
          fit: BoxFit.fill,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlutterLogo(
              colors: Colors.yellow,
              size: 100,
              style: FlutterLogoStyle.markOnly,
            ),
            loginFiles(),
          ],
        ),
      ],
    );
  }

  Container loginFiles() {
    return Container(
      width: 250,
      height: 320,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Material(
            child: TextField(
              cursorRadius: Radius.circular(30.0),
              style: TextStyle(
                fontSize: 20,
                color: Colors.orange,
              ),
              textInputAction: TextInputAction.continueAction,
              onChanged: (value) {
                _email = value;
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Material(
            child: TextField(
              cursorRadius: Radius.circular(30.0),
              style: TextStyle(
                fontSize: 20,
                color: Colors.orange,
              ),
              textInputAction: TextInputAction.continueAction,
              onChanged: (value) {
                _email = value;
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          rowBtn,
         
         
    
        ],
      ),
    );
  }
  Row rowBtn = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[ Expanded(child: RaisedButton(
            onPressed: () {},
            child: Text("Login"),
            elevation: 5.2,
          ),
          flex: 1,

          ),
          SizedBox(
            width: 20,
          ),
          Expanded(child: RaisedButton(
            onPressed: () {},
            child: Text("Register"),
            elevation: 5.2,
          ),
          flex: 1,

          )

    ],
  );
}
