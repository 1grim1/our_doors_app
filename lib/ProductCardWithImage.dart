import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:our_doors/Product.dart';
import 'package:our_doors/const.dart';

class ProductCardWithImage  extends StatelessWidget{
  final Product product;

  ProductCardWithImage(this.product);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.lightBlue),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: defaultPading),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("1121"),
              SizedBox(
                height: 520 * 0.1,
                width: 240 * 0.7,    
                child: Expanded(
                child: Hero(
                    tag: product.name,
                    child: Image.asset(product.image_asset, fit: BoxFit.fill,),
                  ),
                ),
              )
            ],
          ),
      ),
    );
  }

}