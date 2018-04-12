import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new SafeArea(
        child: new ListView(
          padding: new EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            new SizedBox(height: 80.0),
            new Column(
              children: <Widget>[
                new Image.asset('assets/diamond.png'),
                new SizedBox(height: 16.0),
                new Text('SHRINE'),
              ],
            ),
            new  SizedBox(height: 120.0),
            new TextField(
              decoration: new InputDecoration(
                filled: true,
                labelText: 'Username',
              ),
            ),
            new SizedBox(height: 12.0),
            new TextField(
              decoration: new InputDecoration(
                filled: true,
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            new ButtonBar(
              children: <Widget>[
                new FlatButton(
                  child: new Text('CANCEL'),
                  onPressed: null,
                ),
                new RaisedButton(
                  child: new Text('NEXT'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
