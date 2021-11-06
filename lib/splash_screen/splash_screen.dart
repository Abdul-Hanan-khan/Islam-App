import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islam_app/allow_location/allow_loc_screen.dart';
import 'package:islam_app/constants/constants.dart';
import 'package:islam_app/dashboard/dashboard.dart';
import 'package:islam_app/sign_in.dart';
import 'package:islam_app/speeches/speeches.dart';


class Splash_Screen extends StatefulWidget {
  @override
  _Splash_ScreenState createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {

  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }
  startTime() async {
    var duration = new Duration(seconds: 3 );
    return new Timer(duration, route);
  }
  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) =>
            SignInAsClient()
            // Speeches()
    )
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(Constants.dome_bg, fit: BoxFit.fill,),
          ),
          Center(
            child: Image.asset("assets/logo.png", fit: BoxFit.fill, height:MediaQuery.of(context).size.width/1.2,)
          ),
        ],
      ),
    );
  }
}
