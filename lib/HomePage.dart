import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:our_doors/FinalPage.dart';

class HomePage extends StatelessWidget {

 Future<List<dynamic>> _getData() async {
    var jsonData = await rootBundle.loadString('assets/data/data.json');
    var data = json.decode(jsonData);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title:Image.asset('assets/icons/logo.png', width: MediaQuery.of(context).size.width, height: 50,),
        actions: [
          IconButton(icon: Image.asset('assets/icons/search.png', width: 25,), onPressed: (){})
        ],
        ),
      body: FutureBuilder(
         future: _getData(),
         builder: (BuildContext context, AsyncSnapshot snapshot) {
           if(snapshot.data == null) {
             return Text("LOADING...");
           }
           else{
             return FinalPage(snapshot.data);
           }
         },
       ),
    );
  }
}