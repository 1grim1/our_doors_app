import 'package:flutter/material.dart';
import 'package:our_doors/Product.dart';
import 'package:our_doors/const.dart';
import 'package:our_doors/details/ProductMainInfo.dart';

class DoorImageList extends StatelessWidget {
  
  final Product product;

  DoorImageList(this.product);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: product.imageAssetList.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8),
        child: Image.asset(product.imageAssetList[index], fit: BoxFit.fill,),
      )
    );
  }
}