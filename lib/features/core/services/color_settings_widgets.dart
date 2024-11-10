import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StatusBar {
  static void changeColor(Color color, Brightness iconBrightness) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: color,
      statusBarIconBrightness: iconBrightness,
      systemNavigationBarColor: Colors.black54,
      systemNavigationBarIconBrightness: Brightness.light,
    ));
  }
}
