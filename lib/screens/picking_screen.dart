import 'dart:math';

import 'package:flutter/material.dart';
import 'package:picki/services/teams.dart';

class PickingScreen extends StatefulWidget {
  final int teamNumber;
  PickingScreen({Key key, @required this.teamNumber}) : super(key: key);

  @override
  _PickingScreenState createState() => _PickingScreenState();
}

class _PickingScreenState extends State<PickingScreen> {
  bool chose = false;
  String team;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              widget.teamNumber == 1 ? '1st Team' : '2nd Team',
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.person_outline),
                  hintText: "Player's Name",
                ),
              ),
            ),
            Container(
              height: 250.0,
              child: chose
                  ? Image.asset('images/Teams/$team.png')
                  : Icon(
                      Icons.check_box_outline_blank,
                      size: 200.0,
                    ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  color: Color(0xFF00BCD4),
                  child: Text(
                    'Random',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      team = teamsNamesList[
                          Random().nextInt(teamsNamesList.length)];
                      chose = true;
                    });
                  },
                ),
                RaisedButton(
                  color: Color(0xFF00BCD4),
                  child: Text(
                    'Manual',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            Divider(),
            RaisedButton(
              color: Color(0xFF00BCD4),
              child: Text(
                'Continue',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PickingScreen(teamNumber: 2),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
