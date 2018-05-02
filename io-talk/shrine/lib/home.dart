import 'package:flutter/material.dart';

import 'login.dart';
import 'model/data.dart';
import 'supplemental/asymmetric_grid.dart';
import 'supplemental/util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO WILL remove app bar for backdrop
    return Scaffold(
      // TODO MARY demo 2, use AsymmetricView, products.
      body: new Center(
        child: new GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(16.0),
          childAspectRatio: 8.0 / 9.0,
          children: buildGridCards(context),
        ),
      ),
      appBar: AppBar(
        brightness: Brightness.light,
        leading: new IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
            );
          },
        ),
        title: const Text('SHRINE'),
        actions: <Widget>[
          new IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => LoginPage()),
              );
            },
          ),
          new IconButton(
            icon: const Icon(Icons.tune),
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
