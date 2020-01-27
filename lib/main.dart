
import 'package:flutt/routes/detail.dart';
import 'package:flutt/routes/login.dart';
import 'package:flutt/routes/setting.dart';
import 'package:flutt/routes/splash.dart';
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
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: SplashPage(),
      routes: <String,WidgetBuilder>{
        "sortbang":(context) => SortRoute() ,
        "hotbang":(context) => HotRoute(),
        "newbook":(context)  => NewBook(),
//        "search":(context)  =>SearchRoute(),
        "scanner":(context)  =>ScannerRoute(),
        "detail":(context) =>DetailRoute(),
        "home":(context) => MyHomePage(),
        "login":(context) => LoginRoute(),
        "setting":(context) => SetRoute(),
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
    DateTime _lastPressedAt; //上次点击时间
    return WillPopScope(//监听手机返回键
        child: Scaffold(
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

        ),
        onWillPop: () async {//点击返回键即触犯该事件
          if(_lastPressedAt == null ){//首次点击提示信息。。。
            print('双击退出程序....');
          }
          if(_lastPressedAt == null || DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)){
           //两次点击超过一秒则重新计时
            _lastPressedAt = DateTime.now();
            return false;//不退出
          }
          return true;//退出
        },
    );
  }
}
