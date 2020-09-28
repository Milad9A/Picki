import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'picking_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = new Duration(seconds: 1);
    return new Timer(duration, route);
  }

  route() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return PickingScreen(
            screenNumber: 1,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Picki',
            style: TextStyle(
              fontSize: 60.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF00BCD4),
            ),
          ),
          SizedBox(
            height: 200.0,
          ),
          SpinKitFadingCube(
            color: Color(0xFF00BCD4),
            size: 120.0,
          ),
        ],
      ),
    );
  }
}
