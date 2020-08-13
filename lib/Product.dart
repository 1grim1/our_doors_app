import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:our_doors/const.dart';

import 'ProductCardWithImage.dart';
import 'ProductDescription.dart';

class Product extends StatelessWidget{
  final String catalogName;
  final String name; 
  final String description;
  final String image_asset;
  final String price;

  Product({this.name, this.description, this.image_asset, this.price,this.catalogName});


  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () => Navigator.of(context).pop()),
        backgroundColor: Colors.grey,
        centerTitle: true,
        title: Text(catalogName, style: TextStyle(fontFamily: 'Varela',fontSize: 15.0, fontWeight: FontWeight.bold, color: TextColor)),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductCardWithImage(this),
            ProductDescription(description)
          ],
        )
      )
    );
  }
}