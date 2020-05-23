import 'package:face_tag/MVC/CONTROLLERS/BaseAuth.dart';
import 'package:face_tag/MVC/UTILITY/Constanets.dart';
import 'package:face_tag/MVC/UTILITY/Shared_preferences.dart';
import 'package:face_tag/MVC/VIEWS/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:face_tag/MVC/UTILITY/Ext_String.dart';

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
  String _errorMessage = "";
  bool _isLoading = false;
  bool _isLoginForm = false;
  final Auth auth = Auth();
  final Shared pref = Shared();

  @override
  Widget build(BuildContext context) {
    _globleContext = context;
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
            color: Colors.transparent,
            child: TextField(
              cursorRadius: Radius.circular(30.0),
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                hintText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 2,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                contentPadding: EdgeInsets.all(16),
                fillColor: Colors.white30,
              ),
              onEditingComplete: () async {
                debugPrint('__________>');
                didResigineTextEditing();
              },
              onChanged: (value) async {
                _email = value;

                debugPrint('EMAIL INIT');
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Material(
            color: Colors.transparent,
            child: TextField(
              cursorRadius: Radius.circular(30.0),
              obscureText: true,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                hintText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 2,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                contentPadding: EdgeInsets.all(16),
                fillColor: Colors.white30,
              ),
              onChanged: (value) {
                _password = value;
                debugPrint('PASSWORD INIT');
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
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none),
                  )
                ],
              ),
              FlatButton(
                  onPressed: () {
                    showAlert();
                  },
                  child: Text(
                    'Forgot Password?',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: Colors.white,
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
            color: Colors.orange.withAlpha(200),
            textColor: Colors.white,
            onPressed: () {
              didResigineTextEditing();
              debugPrint('login hit');
              validateAndSubmit(true);
              //login block
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
            color: Colors.orange.withAlpha(200),
            textColor: Colors.white,
            onPressed: () {
              didResigineTextEditing();
              debugPrint('Register hit');
              debugPrint('$_email');
              debugPrint('$_password');
              debugPrint('$_isRemamberPassword');
              validateAndSubmit(false);
              //registration
            },
            child: Text("Register"),
            elevation: 5.2,
          ),
          flex: 1,
        )
      ],
    );
  }

  Align otherlogin = Align(
      widthFactor: 300,
      alignment: Alignment.bottomCenter,
      child: Container(
          height: 150,
          child: Row(
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
          )));

  void validateAndSubmit(bool _isLogin) async {
    showCircularProgress(true);
    if (validateAndSave()) {
      String userId = "";
      auth.signOut();
      try {
        if (_isLogin) {
          userId = await auth.signIn(_email, _password);
          var isVerified = auth.isEmailVerified();
          if (isVerified == false) {
            auth.sendEmailVerification();
          }
          moveToHome();
          print('Signed in: $userId');
        } else {
          registerInDB();
          
        }
      } catch (e) {
        print('Error: $e');
        setState(() {
          debugPrint('ERROR');
          _errorMessage = e.message;
          showGlobleDialog(
              _globleContext,
              _isLogin ? 'Login Fail' : 'Registration Fail',
              '$_errorMessage',
              null);
        });
      }
    } else {
      debugPrint('SOME THING WRING');
      showGlobleDialog(
          _globleContext,
          _isLogin ? 'Login Fail' : 'Registration Fail',
          'Please try after some time',
          null);
    }
  }

  bool validateAndSave() {
    if (_email.isValidEmail()) {
      return _password.length >= 6 ? true : false;
    }
    return false;
  }

   registerInDB() async {
    var result = await auth.isUserAlreadyInDB(_email);
    if (result == true) {
      showGlobleDialog(
          _globleContext,
          '$_email',
          'Email already exiest in database',
          () => {debugPrint('__________>')}
          );
          return true;
    }else{
      var userId = await auth.signUp(_email, _password);
          auth.sendEmailVerification();
          //_showVerifyEmailSentDialog();
          moveToHome();
          showGlobleDialog(
              _globleContext,
              'Registration Sccess',
              'Varification link deliverd to Your Email, Please varify your Email',
              null);

          print('Signed up user: $userId');
            }
    }
  }

  moveToHome() {

    Navigator.push(
      _globleContext,
      MaterialPageRoute(builder: (context) => Home()),
    );
  }
  


extension loginFunc on _LoginState {
  showAlert() {
    final Auth auth = Auth();
    String _alertEmail = '';

    return showDialog(
        context: _globleContext,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)), //this right here
              child: Container(
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Enter you email that is linked with us and ypu will get reset password link in email where you can change password',
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      TextField(
                        onChanged: (value) {
                          debugPrint(value);
                          setState(() {
                            _alertEmail = value;
                          });
                        },
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your Email'),
                      ),
                      SizedBox(
                        width: 320.0,
                        child: RaisedButton(
                          onPressed: () {
                            showCircularProgress(true);
                            if (_alertEmail.length == 0)
                              Navigator.pop(_globleContext);
                            else
                              try {
                                auth.sendPasswordEmail('$_alertEmail');
                                Navigator.pop(_globleContext);
                                showGlobleDialog(
                                    _globleContext,
                                    'SCCESS',
                                    'ReSet Password link deliverd to Your Email',
                                    null);
                              } catch (e) {
                                showErrorMessage('dddd');
                                Navigator.pop(_globleContext);

                                showGlobleDialog(
                                    _globleContext, 'error', 'eeee', null);
                                showCircularProgress(false);
                              }
                          },
                          child: Text(
                            _alertEmail.length == 0
                                ? 'BACK TO LOGIN'
                                : "Send Reset Password Email",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: const Color(0xFF1BC0C5),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }
}

BuildContext _globleContext;
didResigineTextEditing() {
  FocusScope.of(_globleContext).unfocus();
}
