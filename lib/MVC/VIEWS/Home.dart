
import 'package:face_tag/MVC/CONTROLLERS/BaseAuth.dart';
import 'package:face_tag/MVC/VIEWS/Root.dart';
import 'package:face_tag/MVC/VIEWS/SideMenu.dart';
import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>
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
        
        automaticallyImplyLeading:true,
        title :Text('Hoem'),
      
        elevation:20,
        backgroundColor:Colors.orangeAccent,
       

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: Container(
        color: Colors.deepPurpleAccent,
        child: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Wel Come'),
              FlatButton(onPressed: (){
                final Auth auth = Auth();
                auth.signOut();
                Navigator.push(context, 
                MaterialPageRoute(builder: (context)=>Root(),
                fullscreenDialog: true)
                ); 

                
              }, child: Text('SigenOut'))
            ],
          ),
        ),

      ),
      
    );
  }
}

