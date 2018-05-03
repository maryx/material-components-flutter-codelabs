import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model/product.dart';

const _idealAspectRatio = 33 / 49;

class ProductCard extends StatelessWidget {
  final double imageAspectRatio;
  final Product product;
  static final kTextBoxHeight = 65.0;

  ProductCard({
    this.imageAspectRatio: _idealAspectRatio,
    this.product,
  }) : assert(imageAspectRatio == null || imageAspectRatio > 0);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _buildImage(),
        _buildText(context),
      ],
    );
  }

  // TODO WILL make negative to demonstrate error
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

  Widget _buildText(BuildContext context) {
    final NumberFormat formatter = new NumberFormat.simpleCurrency(
        decimalDigits: 0, locale: Localizations.localeOf(context).toString());
    final ThemeData theme = Theme.of(context);
    return SizedBox(
      height: kTextBoxHeight * MediaQuery.of(context).textScaleFactor,
      width: 121.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // TODO(larche): Make headline6 when available
          Text(
            product == null ? '' : product.name,
            style: theme.textTheme.button,
            softWrap: false,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          const SizedBox(height: 4.0),
          // TODO(larche): Make subtitle2 when available
          new Text(
            product == null ? '' : formatter.format(product.price),
            style: theme.textTheme.caption,
          ),
        ],
      ),
    );
  }
}
