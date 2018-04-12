import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('SHRINE'),
      ),
      body: new Center(
        child: new Text('You did it!'),
      ),
    );
  }
}
