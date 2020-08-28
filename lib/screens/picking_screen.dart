import 'package:flutter/material.dart';

class PickingScreen extends StatefulWidget {
  PickingScreen({Key key}) : super(key: key);

  @override
  _PickingScreenState createState() => _PickingScreenState();
}

class _PickingScreenState extends State<PickingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              'First Team',
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
            Image.asset('images/Teams/Ajax.png'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  child: Text(
                    'Random',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: null,
                ),
                RaisedButton(
                  child: Text(
                    'Manul',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: null,
                ),
              ],
            ),
            Divider(),
            RaisedButton(
              onPressed: null,
              child: Text(
                'Continue',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
