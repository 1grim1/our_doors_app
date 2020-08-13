import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:our_doors/Product.dart';
import 'package:our_doors/const.dart';


class CatalogData extends StatelessWidget{
  String catalogName;
  int countProduct;
  List<DoorCart> doorList = [];

  CatalogData(data){
    catalogName = data['catalogName'];
    countProduct = data['countProduct'];
    for(var e in data['doorList']){
      print(e);
      doorList.add(
        DoorCart(
          title: e['title'],
          description: e['description'],
          image_asset: 'assets/images/' + e['image_asset'],
          price: e['price'],
          shortInfo: e['shortInfo'],
          catalogName: catalogName,
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPading),
            child: GridView.builder(
                itemCount: doorList.length,
                primary: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.5,
                  crossAxisCount: 2,
                  mainAxisSpacing: defaultPading,
                  crossAxisSpacing: defaultPading,
                ),
                shrinkWrap: true,
                itemBuilder: (context, index) => doorList[index]
            ),
          ),
        ),
      ],
    );
  }
}

class DoorCart extends StatelessWidget{
  Product product;
  final String title;
  final String description;
  final String image_asset;
  final String price;
  final String shortInfo;
  final String backgrounColor;
  final String catalogName;

  void _pushProduct(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => product));
  }

  DoorCart({this.title, this.description, this.shortInfo, this.price, this.image_asset, this.backgrounColor, this.catalogName}){
    product = Product(
      name: title,
      description: description,
      image_asset: image_asset,
      price: price,
      catalogName: catalogName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push( MaterialPageRoute(builder: (context) => product)),
      child: Card(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(defaultPading),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Hero(
                  tag: "$title",
                  child: Image.asset(image_asset),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1),
              child: Text(
                // products is out demo list
                title,
                textAlign: TextAlign.center,
                style: TextStyle(color: TextLightColor),
              ),
            ),
            Text(
              "$price",
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

}