import 'package:flutter/material.dart';

import 'model/data.dart';
import 'supplemental/asymmetric_grid.dart';
import 'diamond_hamburger.dart';

class HomePage extends StatelessWidget {
  var appBar = AppBar(
    brightness: Brightness.light,
    leading: new IconButton(
      icon: const Icon(Icons.menu),
      onPressed: () {
        print('Menu button');
      },
    ),
    title: const Text('SHRINE'),
    actions: <Widget>[
      new IconButton(
        icon: const Icon(Icons.search),
        onPressed: () {
          print('Search button');
        },
      ),
      new IconButton(
        icon: const Icon(Icons.tune),
        onPressed: () {
          print('Filter button');
        },
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO remove app bar for backdrop
      appBar: null,
      body: ProductsView(products: getAllProducts()),
    );
  }
}
