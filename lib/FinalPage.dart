
import 'package:flutter/material.dart';
import 'package:our_doors/DoorCart.dart';
import 'const.dart';

class FinalPage extends StatefulWidget {

  final data;

  FinalPage(this.data);

  @override
  _FinalPageState createState() => _FinalPageState(data);
}

class _FinalPageState extends State<FinalPage> 
with SingleTickerProviderStateMixin{

  TabController _tabController;



  List<CatalogData> dataList = [];

  List<Tab> tabList = [];

  final data;

  int selectedIndex = 0;

  _FinalPageState(this.data){
    fillData();
    _tabController = TabController(length: dataList.length, vsync: this);
  }
  
  void fillData(){
    for(var obj in data){
      dataList.add(CatalogData(obj));
      tabList.add(
        Tab(
          child: Text(obj['catalogName'],
          style: TextStyle(
            fontFamily: 'Times New Roman',
            fontSize: 16.0,
            )
          ),
        ),
      );

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(left: 20.0),
        children: [
          TabBar(
              controller: _tabController,
              indicatorColor: TextColor,
              labelColor: TextColor,
              isScrollable: true,
              labelPadding: EdgeInsets.only(right: 45.0),
              unselectedLabelColor: TextLightColor ,
              tabs: tabList),
              Container(
                height: MediaQuery.of(context).size.height - 150.0,
                width: double.infinity,
                child: TabBarView(
                  controller: _tabController,
                  children: dataList
                )
              )
        ],
      ),
    );
  }

  


}

/*TabBar(
        controller: _tabController,
        indicatorColor: Colors.transparent,
        labelColor: Color(0xFFC88D67),
        isScrollable: true,
        labelPadding: EdgeInsets.only(right: 45.0),
        unselectedLabelColor: Color(0xFFCDCDCD),
        tabs: tabList
      ),*/ 