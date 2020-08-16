import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:our_doors/Product.dart';
import 'package:our_doors/const.dart';


class Data extends StatelessWidget{
  String catalogName;
  int countProduct;
  List<DoorCart> modelList = [];

  Data(data){
    catalogName = data['catalogName'];
    countProduct = data['countProduct'];
    for(var e in data['models']){
      print(e);
      modelList.add(
        DoorCart(
          modelName: e['model_name'],
          name: e['name'],
          description: e['description'],
          price: e['price'],
          imageAssetList: e['image_list_asset'],
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
                itemCount: modelList.length,
                primary: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.5,
                  crossAxisCount: 2,
                  mainAxisSpacing: defaultPading,
                  crossAxisSpacing: defaultPading,
                ),
                shrinkWrap: true,
                itemBuilder: (context, index) => modelList[index]
            ),
          ),
        ),
      ],
    );
  }
}

class DoorCart extends StatelessWidget{
  Product product;
  final String modelName;
  final String name;
  final String description;
  final List<dynamic> imageAssetList;
  final String price;
  final String catalogName;

  void _pushProduct(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => product));
  }

  DoorCart({this.modelName, this.description,this.price, this.imageAssetList, this.catalogName, this.name}){
    product = Product(
      name: modelName,
      description: description,
      imageAssetList: imageAssetList,
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
                  tag: "$modelName",
                  child: Image.asset(imageAssetList[0]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1),
              child: Text(
                // products is out demo list
                modelName,
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