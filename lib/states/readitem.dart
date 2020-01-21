export '../index.dart';
import 'package:flutt/models/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReadItem extends StatefulWidget{
  ReadItem(BuildContext context, Read nowread);
  @override
  _ReadItemState createState() => _ReadItemState();

}

class _ReadItemState extends State<ReadItem> {
  @override
  Widget build(BuildContext context) {
    return  Row(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Image.network("https://img10.360buyimg.com/n2/jfs/t1/5363/11/10030/702200/5bc991d2Eda85e518/ddcf47f8b711357e.jpg"),
          ),
          Expanded(
              flex: 2,
              child: Column(
                children: <Widget>[
//                  Expanded(
//                      flex: 2,
//                      child:
                      Text(
                        "设计心理学",
                        textScaleFactor: 1.5,
                      ),
                  //),
//                  Expanded(
//                      flex: 1,
//                      child:
                      Text("作者:唐纳德诺曼"),
                  //),
//                  Expanded(
//                      flex: 1,
//                      child:
                      Text("馆藏点：新图书馆五楼"),
                  //),
//                  Expanded(
//                      flex: 1,
//                      child:
                      Text("截止：2016-04-18"),
//                  ),
                ],
              ),
          ),
          Expanded(
              flex: 1,
              child: Center(
                child: RaisedButton(
                    child: Text("sdg"),
                    onPressed: (){

                    },
                ),
              ),
          ),
        ],
      );
  }
}