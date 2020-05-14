
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

