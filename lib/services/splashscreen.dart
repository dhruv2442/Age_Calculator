import 'package:flutter/material.dart';
import 'package:age_calculator/homepage.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashScreen2 extends StatefulWidget {
  @override
  _SplashScreen2State createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 7,
      routeName: '/',
      navigateAfterSeconds: HomePage(),
      image: Image.asset("assets/images/agecalculator.png"),
      photoSize: 100,
      loadingText: Text(
        "Developed By Dhruv Dalal",
        style: TextStyle(
            color: Colors.indigo[800],
            fontWeight: FontWeight.bold,
            fontSize: 30),
      ),
      loaderColor: Colors.indigo[800],
    );
  }
}
