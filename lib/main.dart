import 'package:flutt/routes/detail.dart';
import 'package:flutter/material.dart';
import 'view/firstPage.dart';
import 'view/secondPage.dart';
import 'view/thirdPage.dart';
import 'view/fourPage.dart';
import 'index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: <String,WidgetBuilder>{
        "sortbang":(context) => SortRoute() ,
        "hotbang":(context) => HotRoute(),
        "newbook":(context)  => NewbookRoute(),
//        "search":(context)  =>SearchRoute(),
        "scanner":(context)  =>ScannerRoute(),
        "detail":(context) =>DetailRoute(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  TabController _tabController;


  @override
  void initState() {
    _tabController = new TabController(length: 4, vsync: this);
  }

  //当整个页面dispose时,记得把控制器也dispose掉,释放内存
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
          controller: _tabController,
          children:<Widget>[
            FirstPage(),
            SecondPage(),
            ThirdPage(),
            FourPage(),
          ]
      ),
      bottomNavigationBar: Material(
        color: Colors.deepOrange,
        child: TabBar(
          controller: _tabController,
          tabs: <Tab>[
            Tab(text: '首页',icon: Icon(Icons.home)),
            Tab(text: '收藏',icon: Icon(Icons.star)),
            Tab(text: '圈子',icon: Icon(Icons.local_library)),
            Tab(text: '我的',icon: Icon(Icons.person)),
          ],
          indicatorColor: Colors.white,
        ),
      ),

    );
  }
}
