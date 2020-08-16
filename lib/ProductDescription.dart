import 'package:flutter/material.dart';
import 'package:our_doors/Product.dart';

class ProductDescription extends StatelessWidget {

  final Product product;

  ProductDescription(this.product);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: Text(product.description,
      style: TextStyle(fontSize: 21),
      ), 
    );
  }
}