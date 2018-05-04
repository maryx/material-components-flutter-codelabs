import 'package:flutter/material.dart';

import 'login.dart';
import 'model/data.dart';
import 'supplemental/asymmetric_grid.dart';
import 'supplemental/util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AsymmetricView(products: getAllProducts()),
      appBar: AppBar(
        brightness: Brightness.light,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
            );
          },
        ),
        title: Text('SHRINE'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => LoginPage()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.tune),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => LoginPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
