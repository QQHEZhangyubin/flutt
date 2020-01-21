import 'dart:convert';

import 'package:flutt/index.dart';
import 'package:flutt/view/firstPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HotRoute extends StatefulWidget{

  @override
  _HotRouteState createState() => _HotRouteState();

}

class _HotRouteState extends State<HotRoute> {

  BookdataList _bookdataList = new BookdataList();
  @override
  Widget build(BuildContext context) {
    ScreenArguments arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child:Text(arg.title),
        ),
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.7,
          ),
          itemCount: _bookdataList.bookdataList.length,
          itemBuilder: (context,index){
            return GestureDetector(
              child: Column(
                children: <Widget>[
                  Image.network(_bookdataList.bookdataList[index].bookimgurl),
                  Text(_bookdataList.bookdataList[index].bookname),
                ],
              ),
              onTap: (){
                Navigator.pushNamed(
                    context,
                    "detail",
                );
              },
            );
          },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    loadMoreInfo();
  }

  void loadMoreInfo() async{
     String  BOOKLISTJSON =  await _GetJsonData();
     setState(() {
       List<dynamic> list = json.decode(BOOKLISTJSON);
       _bookdataList = BookdataList.fromJson(list);
     });
  }

  Future<String> _GetJsonData() {
    return  rootBundle.loadString('jsons/bookdatas.json');
  }

}