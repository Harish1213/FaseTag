import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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

//variabel
  String _email;
  String _password;
  bool _isRemamberPassword = false;
  @override
  Widget build(BuildContext context) {
    _gobleContext =  context;
    return Stack(
      alignment: Alignment.center,
      overflow: Overflow.clip,
      fit: StackFit.expand,
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
                    otherlogin,
                    

      ],

    );
  }

  Container loginFiles() {
    return Container(
      width: 300,
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
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                hintText: "Email",
                border: InputBorder.none,
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
              obscureText: true,
              style: TextStyle(
                fontSize: 20,
                color: Colors.orange,
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                hintText: "Password",
                border: InputBorder.none,
              ),
              textInputAction: TextInputAction.continueAction,
              onChanged: (value) {
                _password = value;
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Material(
                      type: MaterialType.transparency,
                      child: Checkbox(
                        focusColor: Colors.green,
                        activeColor: Colors.orange,
                        checkColor: Colors.cyanAccent,
                        value: _isRemamberPassword,
                        onChanged: (value) {
                          setState(() {
                            _isRemamberPassword = value;
                          });
                        },
                      )),
                  Text(
                    "KeepLogin",
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none),
                  )
                ],
              ),
              FlatButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot Password?',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          rowBtn(),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Row rowBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: RaisedButton(
            onPressed: () {
              didResigineText();
              debugPrint('login hit');
            },
            child: Text("Login"),
            elevation: 5.2,
          ),
          flex: 1,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: RaisedButton(
            onPressed: () {
              didResigineText();
              debugPrint('Register hit');
              debugPrint('$_email');
              debugPrint('$_password');
              debugPrint('$_isRemamberPassword');
            },
            child: Text("Register"),
            elevation: 5.2,
          ),
          flex: 1,
        )
      ],
    );
  }

  Align otherlogin =  Align(
    widthFactor: 300,
    alignment: Alignment.bottomCenter,
  child:
  Container(
      height: 150,
      child:
       Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ClipOval(
            child: Material(
              color: Colors.blue,
              child: InkWell(
                splashColor: Colors.orange,
                child: SizedBox(
                  width: 65,
                  height: 65,
                  child: Image.asset('assets/main/Login/fb.png'),
                ),
              ),
            ),
          ),
          ClipOval(
            child: Material(
              color: Colors.blue, // button color
              child: InkWell(
                splashColor: Colors.orange, // inkwell color
                child: SizedBox(
                    width: 65, height: 65, child: Icon(Icons.phone_iphone)),
                onTap: () {},
              ),
            ),
          ),
          ClipOval(
            child: Material(
              color: Colors.blue,
              child: InkWell(
                splashColor: Colors.orange,
                child: SizedBox(
                  width: 65,
                  height: 65,
                  child: Image.asset('assets/main/Login/google.jpg'),
                ),
              ),
            ),
          ),
          
        ],
      )
  )
  );



}


BuildContext _gobleContext;
didResigineText(){
  FocusScope.of(_gobleContext).unfocus();
}