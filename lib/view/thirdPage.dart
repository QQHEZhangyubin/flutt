import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget{
  @override
  _ThirdPageState createState() => _ThirdPageState(); 
}
class _ThirdPageState extends State<ThirdPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('界面3'),
      ),
      body: Center(
        child: Text('3'),
      ),
    );
  }
  
} 