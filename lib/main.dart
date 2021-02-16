import 'package:flutter/material.dart';
import 'package:age_calculator/services/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Age Calculator",
      home: SplashScreen2(),
    );
  }
}
