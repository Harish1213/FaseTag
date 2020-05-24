

import 'package:flutter/material.dart';

enum ScreenDimantion {
  width,
  height,
  withoutPaddin,
  withoutStatesBar,
  withoutStatusTool
}
double screen(BuildContext context, ScreenDimantion dimantion) {
  var height = MediaQuery.of(context).size.height;
  var padding = MediaQuery.of(context).padding;

  switch (dimantion) {
    case ScreenDimantion.width:
      // full screen width and height
      return MediaQuery.of(context).size.width;

    case ScreenDimantion.height:
      return MediaQuery.of(context).size.height;

    case ScreenDimantion.withoutPaddin:
      // height without SafeArea
      return height - padding.top - padding.bottom;
    case ScreenDimantion.withoutStatesBar:
// height without status bar

      return height - padding.top;
    case ScreenDimantion.withoutStatusTool:

// height without status and toolbar
      return height - padding.top - kToolbarHeight;
  }
}

Widget showCircularProgress(bool _isLoading) {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }


  Widget showErrorMessage(String _errorMessage) {
    if (_errorMessage.length > 0 && _errorMessage != null) {
      return new Text(
        _errorMessage,
        style: TextStyle(
            fontSize: 13.0,
            color: Colors.red,
            height: 1.0,
            fontWeight: FontWeight.w300),
      );
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }

  


 
