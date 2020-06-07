import 'package:face_tag/MVC/VIEWS/SideMenu.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FAQVC extends StatefulWidget {
  @override
  _FAQVCState createState() => _FAQVCState();
}

class _FAQVCState extends State<FAQVC> with SingleTickerProviderStateMixin {
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
          title: Text('FAQs'),
        ),
        body: mainFaqList());
  }

  Widget mainFaqList() {
    return ListView(
      padding: EdgeInsets.all(20),
      children: <Widget>[
        Card(
          child: ListTile(
            leading: Icon(Icons.local_laundry_service),
            title: Text('Tearm & condition'),
            onTap: _launchURL,
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.local_laundry_service),
            title: Text('Privacy & policy'),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.report),
            title: Text('Report'),
            onTap: (){
              debugPrint('onTap');
            },
            onLongPress: (){
              debugPrint('onLongPress');
            },
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.rate_review),
            title: Text('Rate App'),
          ),
        )
      ],
    );
  }


 _launchURL() async {
  const url = "https://google.com"; 
  if (await canLaunch(url)) { 
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
}
