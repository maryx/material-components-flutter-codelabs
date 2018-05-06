import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model/product.dart';

class ProductCard extends StatelessWidget {
  Widget _buildImage() {
    final image = Image.asset(
      product.assetName,
      package: product.assetPackage,
      fit: BoxFit.cover,
    );
    return imageAspectRatio >= _idealAspectRatio
        ? AspectRatio(
            aspectRatio: imageAspectRatio,
            child: image,
          )
        : image;
  }

  Widget _buildText(BuildContext context, ThemeData theme) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            product == null ? '' : product.name,
            style: theme.textTheme.button,
            softWrap: false,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          SizedBox(height: 4.0),
          Text(
            product == null ? '' : formatter.format(product.price),
            style: theme.textTheme.caption,
          ),
        ],
      ),
      height: kTextBoxHeight * MediaQuery.of(context).textScaleFactor,
      width: 121.0,
    );
  }

  final double imageAspectRatio;
  final Product product;
  static final kTextBoxHeight = 65.0;
  final NumberFormat formatter = NumberFormat.simpleCurrency(decimalDigits: 0);

  ProductCard({
    this.imageAspectRatio: _idealAspectRatio,
    this.product,
  }) : assert(imageAspectRatio == null || imageAspectRatio > 0);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _buildImage(),
        _buildText(context, theme),
      ],
    );
  }
}

const _idealAspectRatio = 33 / 49;
