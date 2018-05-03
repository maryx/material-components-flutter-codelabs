import 'package:flutter/material.dart';

import '../model/product.dart';
import '../product_card.dart';

class TwoProductCardColumn extends StatelessWidget {
  TwoProductCardColumn({
    this.bottom,
    this.top,
  }) : assert(bottom != null);

  final Product bottom, top;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      const spacerHeight = 44.0;

      double heightOfCards = (constraints.biggest.height - spacerHeight) / 2.0;
      double heightOfImages = heightOfCards - ProductCard.kTextBoxHeight;
      double imageAspectRatio =
          (heightOfImages >= 0.0 && constraints.biggest.width > heightOfImages)
              ? constraints.biggest.width / heightOfImages
              : 33 / 49;

      return ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsetsDirectional.only(start: 28.0),
            child: top != null
                ? ProductCard(
                    imageAspectRatio: imageAspectRatio,
                    product: top,
                  )
                : SizedBox(
                    height: heightOfCards,
                  ),
          ),
          SizedBox(height: spacerHeight),
          Container(
            padding: EdgeInsetsDirectional.only(end: 28.0),
            child: ProductCard(
              imageAspectRatio: imageAspectRatio,
              product: bottom,
            ),
          ),
        ],
      );
    });
  }
}

class OneProductCardColumn extends StatelessWidget {
  OneProductCardColumn({this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(height: 64.0),
        ProductCard(
          product: product,
        ),
        SizedBox(
          height: 40.0,
        ),
      ],
    );
  }
}
