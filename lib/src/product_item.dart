import 'package:flutter/material.dart';
import 'package:nagesh_flutter/models/product.dart';

class ProductItem extends StatelessWidget {
  final Product? product;
  ProductItem({this.product});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          children: [
            Text(product!.productName),
          ],
        ),
        Text(product!.price),
      ],
    );
  }
}
