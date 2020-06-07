import 'package:face_tag/MVC/VIEWS/SideMenu.dart';
import 'package:flutter/material.dart';

class FeedBack extends StatefulWidget {
  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack>
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
      appBar: AppBar(
        title: Text('FeedBack'),
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
            listOfCenterConterolles(),
            
          ],
        ),
      ),
    );
  }

  Widget listOfCenterConterolles() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
         Padding(
          padding: EdgeInsets.only(top: 40,left: 20),
          child: Text('Subject',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              height: 1,
          ),
          ),
         ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: TextField(
            maxLength: 20,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              height: 1,
            ),
            decoration: InputDecoration(
              fillColor: Colors.orangeAccent,
              filled: true,
              hintText: 'Enter Subject Here... ',
              
              
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
                //_uMobile = strValue;
              });
            },
          ),
        ),
        Padding(padding: EdgeInsets.only(top:20,left: 20),
        child: Text('Message',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
          
        ),),
        Padding(padding: EdgeInsets.only(top:10),
        child: TextField(
          maxLines: 6,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            height: 1
          ),
          decoration: InputDecoration(
            hintText: 'Enter MEassage here..',
            fillColor: Colors.orange,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide(
                color: Colors.white,
                width: 4,
                style: BorderStyle.solid
              )
            ),
            )
            
            ,
        ),),
      ],
    );
  }
}
