import 'dart:io';
import 'dart:async';
import 'package:face_tag/MVC/VIEWS/SideMenu.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import 'package:firebase_storage/firebase_storage.dart'; // For File Upload To Firestore
// For Image Picker
import 'package:face_tag/MVC/UTILITY/Dialoges.dart';
import 'package:intl/intl.dart';

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

  bool _isEdit = false;
  String _fName;
  String _lname;
  File _profilImage;
  String _uploadedFileURL;
  String _uMobile;
  String _secondryEmail;
  String _about;
  String _gender;
  DateTime _selectedDate = DateTime.now();

  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      drawer: SideMenu(),
      appBar: AppBar(
        title: Text("Profile"),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isEdit = _isEdit == true ? false : true;
                  });
                },
                child: Icon(
                  _isEdit ? Icons.save : Icons.edit,
                  size: 26.0,
                ),
              )),
        ],
      ),
      body: mainContaner(),
    );
  }

  Container mainContaner() {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            topRowWithImgName(),
            secondRowItems(),
            thirdRowEliment(),
          ],
        ),
      ),
    );
  }

  Row topRowWithImgName() {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
      // Expanded(child:
      Column(
          //
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: ClipOval(
                  child: Material(
                      child: InkWell(
                child: SizedBox(
                  width: 110,
                  height: 110,
                  child: _profilImage != null
                      ? Image.file(_profilImage)
                      : Image.asset('assets/main/Login/userProfile.png'),
                ),
                
                onTap: () {
                  if (_isEdit == true)
                  chooseFile();
                },
              ))),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, right: 20),
              child: Text(
                '$_fName $_lname',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ]),
      //  ),
      Expanded(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              height: 1,
            ),
            decoration: InputDecoration(
              hintText: 'First name',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 4,
                    style: BorderStyle.solid,
                  )),
            ),
            onChanged: (strValue) {
              setState(() {
                _fName = strValue;
              });
            },
          ),
          Padding(padding: EdgeInsets.only(top: 20)),
          TextField(
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              height: 1,
            ),
            decoration: InputDecoration(
              hintText: 'Last name',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 4,
                    style: BorderStyle.solid,
                  )),
            ),
            onChanged: (strValue) {
              setState(() {
                _lname = strValue;
              });
            },
          )
        ],
      ))
    ]);
  }

  Widget secondRowItems() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: TextField(
            maxLength: 10,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              height: 1,
            ),
            decoration: InputDecoration(
              hintText: 'Phone Number without Country code',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 4,
                    style: BorderStyle.solid,
                  )),
            ),
            onChanged: (strValue) {
              setState(() {
                _uMobile = strValue;
              });
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: TextField(
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              height: 1,
            ),
            keyboardAppearance: Brightness.dark,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              hintText: 'Secondry Email ',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 4,
                    style: BorderStyle.solid,
                  )),
            ),
            onChanged: (strValue) {
              setState(() {
                _secondryEmail = strValue;
              });
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20, bottom: 20),
          child: TextField(
            maxLines: 5,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
            keyboardAppearance: Brightness.dark,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              hintText: 'About ',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 4,
                    style: BorderStyle.solid,
                  )),
            ),
            onChanged: (strValue) {
              setState(() {
                _about = strValue;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget thirdRowEliment() {
    return Column(
      children: <Widget>[
        Container(
            width: double.infinity,
            height: 60,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  items: <String>['Male', 'Female', 'Other', 'Unspacified']
                      .map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _gender = value;
                    });
                  },
                  hint: Text('Select Gender'),
                  value: _gender,
                  isExpanded: true,
                  dropdownColor: Colors.black,
                  focusColor: Colors.green,
                  iconEnabledColor: Colors.white,
                  iconSize: 50,
                  iconDisabledColor: Colors.black,
                  elevation: 10,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              border: Border.all(
                color: Colors.black45,
                width: 1,
              ),
            )),
        Padding(
            padding: EdgeInsets.only(top: 20),
            child: Container(
              width: double.infinity,
              height: 60,
              child: FlatButton(
                onPressed: () {
                  _selectDate(context);
                },
                child: Text(
                  DateFormat.yMMMd().format(_selectedDate),
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.justify,
                ),
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(
                      color: Colors.black45,
                      width: 1,
                      style: BorderStyle.solid,
                    )),
              ),
            )),
      ],
    );
  }

  Future chooseFile() async {
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      setState(() {
        if (image != null) {
          _profilImage = image;
          uploadFileTofirebase_storage();
        }
      });
    });
  }

  Future uploadFileTofirebase_storage() async {
    addLoader();
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('ProfileImg/${Path.basename(_profilImage.path)}');
    StorageUploadTask uploadTask = storageReference.putFile(_profilImage);
    await uploadTask.onComplete;
    print('File Uploaded');
    storageReference.getDownloadURL().then((fileURL) {
      setState(() {
        _uploadedFileURL = fileURL;
        debugPrint('---->>>$_uploadedFileURL');
        removeLoader();
        _isEdit = false;
      });
    });
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(1920),
        lastDate: DateTime.now()); //DateTime(2101));
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  removeLoader() {
    Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();
  }

  addLoader() {
    Dialogs.showLoadingDialog(context, _keyLoader);
  }
}
