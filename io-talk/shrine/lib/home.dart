import 'package:flutter/material.dart';

import 'login.dart';
import 'model/data.dart';
import 'model/product.dart';
import 'supplemental/asymmetric_grid.dart';
import 'supplemental/util.dart';

class HomePage extends StatelessWidget {
  final Category category;
  const HomePage({this.category: Category.all});

  @override
  Widget build(BuildContext context) {
      return AsymmetricView(products: getProducts(Category.all));
  }
}
