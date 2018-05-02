import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/data.dart';
import '../model/product.dart';

List<Card> buildGridCards(BuildContext context) {
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