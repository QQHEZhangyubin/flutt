import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _SplashPageState();
  }

}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Image.asset("imgs/splashimg.jpg",fit: BoxFit.cover,);
  }

  @override
  void initState() {
    super.initState();
    countDown();
  }
  //倒计时
  void countDown() {
    var _duration = new Duration(seconds: 3);
    new Future.delayed(_duration,goLoginRoute);
  }
  void goLoginRoute(){
    Navigator.of(context).pushReplacementNamed("login");
  }
}