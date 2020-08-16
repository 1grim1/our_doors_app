import 'package:flutter/material.dart';
import 'package:our_doors/Product.dart';
import 'package:our_doors/ProductCardWithImage.dart';
import 'package:our_doors/const.dart';

class ProductMainInfo extends StatelessWidget {

  final Product product;

  ProductMainInfo(this.product);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
              child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(product.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: "Times New Roman"),),
            ),
            SizedBox(height:  MediaQuery.of(context).size.height * 0.05,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Text("Модель: D-5", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, fontFamily: "Times New Roman"),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Text("Материал: Дерево", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, fontFamily: "Times New Roman"),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 200),
              child: Text("Цена: " + product.price),
            )
            ],
        ),
      ),
    );
  }
}