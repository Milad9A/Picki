import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:picki/screens/result_screen.dart';
import 'package:picki/services/teams.dart';

class PickingScreen extends StatefulWidget {
  final int screenNumber;
  final String firstTeamName;
  final String secondTeamName;
  final String firstPlayerName;
  final String secondPlayerName;
  PickingScreen({
    Key key,
    @required this.screenNumber,
    this.firstTeamName,
    this.secondTeamName,
    this.firstPlayerName,
    this.secondPlayerName,
  }) : super(key: key);

  @override
  _PickingScreenState createState() => _PickingScreenState();
}

class _PickingScreenState extends State<PickingScreen> {
  bool chose = false;
  String team;
  final firstPlayerController = TextEditingController();
  final secondPlayerController = TextEditingController();

  DropdownButton<String> manualSelection() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String team in teamsNamesList) {
      var newTeam = DropdownMenuItem(
        child: Text(team),
        value: team,
      );
      dropdownItems.add(newTeam);
    }

    return DropdownButton<String>(
      value: team,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          team = value;
          chose = true;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/backgroundImage.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Text(
                widget.screenNumber == 1 ? '1st Team' : '2nd Team',
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: TextField(
                controller: widget.screenNumber == 1
                    ? firstPlayerController
                    : secondPlayerController,
                decoration: InputDecoration(
                  icon: Icon(Icons.person_outline),
                  hintText: "Player's Name",
                  focusColor: Colors.red,
                  hoverColor: Colors.red,
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
            manualSelection(),
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
                  team =
                      teamsNamesList[Random().nextInt(teamsNamesList.length)];
                  chose = true;
                });
              },
            ),
            RaisedButton(
              color: Color(0xFF00BCD4),
              child: Text(
                'Continue',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                var whereTo;
                if (widget.screenNumber == 1) {
                  whereTo = PickingScreen(
                    screenNumber: 2,
                    firstTeamName: team,
                    firstPlayerName: firstPlayerController.text,
                  );
                } else if (widget.screenNumber == 2) {
                  whereTo = ResultScreen(
                    firstTeamName: widget.firstTeamName,
                    secondTeamName: team,
                    firstPlayerName: widget.firstPlayerName,
                    secondPlayerName: secondPlayerController.text,
                  );
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => whereTo,
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
