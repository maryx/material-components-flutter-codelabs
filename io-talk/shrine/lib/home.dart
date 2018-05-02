import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model/data.dart';
import 'model/product.dart';
import 'supplemental/asymmetric_grid.dart';
import 'login.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AsymmetricView(products: getAllProducts());
//    // TODO WILL remove app bar for backdrop
//    return Scaffold(
//      appBar: AppBar(
//        brightness: Brightness.light,
//        leading: new IconButton(
//          icon: const Icon(Icons.menu),
//          onPressed: () {
//            Navigator.push(
//              context,
//              MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
//            );
//          },
//        ),
//        title: const Text('SHRINE'),
//        actions: <Widget>[
//          new IconButton(
//            icon: const Icon(Icons.search),
//            onPressed: () {
//              Navigator.push(
//                context,
//                MaterialPageRoute(
//                    builder: (BuildContext context) => LoginPage()),
//              );
//            },
//          ),
//          new IconButton(
//            icon: const Icon(Icons.tune),
//            onPressed: () {
//              Navigator.push(
//                context,
//                MaterialPageRoute(
//                    builder: (BuildContext context) => LoginPage()),
//              );
//            },
//          ),
//        ],
//      ),
// TODO MARY demo 2
//      body: new Center(
//        child: new GridView.count(
//          crossAxisCount: 2,
//          padding: const EdgeInsets.all(16.0),
//          childAspectRatio: 8.0 / 9.0,
//          children: _buildGridCards(context),
//        ),
//      ),
      //body: AsymmetricView(products: getAllProducts()),
    //);
  }

  List<Card> _buildGridCards(BuildContext context) {
    List<Product> products = getAllProducts();

    if (products == null || products.isEmpty) {
      return const <Card>[];
    }

    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = new NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    return products.map((product) {
      return new Card(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new AspectRatio(
              aspectRatio: 18 / 11,
              child: new Image.asset(
                product.assetName,
                package: product.assetPackage,
                fit: BoxFit.fitWidth,
              ),
            ),
            new Expanded(
              child: new Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // TODO(larche): Make headline6 when available
                    new Text(
                      product.name,
                      style: theme.textTheme.title,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 8.0),
                    // TODO(larche): Make subtitle2 when available
                    new Text(
                      formatter.format(product.price),
                      style: theme.textTheme.body2,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }
}
