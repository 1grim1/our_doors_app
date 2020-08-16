import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:our_doors/const.dart';
import 'package:our_doors/details/doorImageList.dart';

import 'ProductCardWithImage.dart';
import 'ProductDescription.dart';
import 'details/ProductMainInfo.dart';

class Product extends StatelessWidget{
  final String catalogName;
  final String name; 
  final String description;
  final List imageAssetList;
  final String price;

  Product({this.name, this.description, this.imageAssetList, this.price,this.catalogName});


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () => Navigator.of(context).pop()),
        backgroundColor: Colors.grey,
        centerTitle: true,
        title: Text(catalogName, style: TextStyle(fontFamily: 'Varela',fontSize: 15.0, fontWeight: FontWeight.bold, color: TextColor)),
        elevation: 0,
      ),
      body: Column(
        children: [
          Row(
            children: [
             Container(
                  height: size.height * 0.5,
                  width: size.width * 0.4,
                  child: ProductMainInfo(this),
              ),
              SizedBox(height: size.height * 0.55, width: size.width * 0.06,),
              Expanded(
                  child: Container(
                  height: size.height * 0.5,
                  width:  size.width * 0.6,
                  child: DoorImageList(this),
                ),
              ),
              SizedBox(height: size.height * 0.55, width: size.width * 0.05,)
            ],
          ),
          Expanded(child: ProductDescription(this))
        ],
      )
    );
  }
}