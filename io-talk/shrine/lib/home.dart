import 'package:flutter/material.dart';

import 'model/data.dart';
import 'supplemental/asymmetric_grid.dart';
import 'diamond_hamburger.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        leading: DiamondHamburger(),
        title: Text('SHRINE'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('Search button');
            },
          ),
          IconButton(
            icon: Icon(Icons.tune),
            onPressed: () {
              print('Filter button');
            },
          ),
        ],
      ),
      body: ProductsView(products: getAllProducts()),
    );
  }
}
