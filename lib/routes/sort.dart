
import 'package:flutt/states/tabviewi.dart';
import 'package:flutter/material.dart';
import 'index.dart';
class SortRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SortRouteState();
  }
}

class _SortRouteState extends State<SortRoute> with SingleTickerProviderStateMixin,AutomaticKeepAliveClientMixin{
  TabController tabController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text('分类榜',style: TextStyle(fontSize: 22),),
        bottom: TabBar(
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
            unselectedLabelStyle: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
            unselectedLabelColor: Colors.white54,
            labelStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
            controller: tabController,
            tabs: <Widget>[
              Tab(text: '哲学',),
              Tab(text: '文学',),
              Tab(text: '理学',),
              Tab(text: '法学',),
              Tab(text: '医学',),
            ],
        ),
      ),
      body: TabBarView(
          controller: tabController,
          children: <Widget>[
            TabViewI("1x0"),
            TabViewI("1x1"),
            TabViewI("1x2"),
            TabViewI("1x3"),
            TabViewI("1x4"),
          ],
      ),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    tabController = TabController(
      length: 5,
      vsync: this,
    );
    super.initState();
  }
  @override
  bool get wantKeepAlive => true;
}