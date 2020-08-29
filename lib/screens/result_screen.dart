import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  final String firstTeamName;
  final String secondTeamName;
  final String firstPlayerName;
  final String secondPlayerName;

  const ResultScreen({
    Key key,
    @required this.firstTeamName,
    @required this.secondTeamName,
    this.firstPlayerName,
    this.secondPlayerName,
  }) : super(key: key);
  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Image.asset('images/Teams/${widget.firstTeamName}.png'),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    widget.firstPlayerName,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Text(
                'VS.',
                style: TextStyle(
                  fontSize: 60.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: <Widget>[
                  Image.asset('images/Teams/${widget.secondTeamName}.png'),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    widget.secondPlayerName,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
