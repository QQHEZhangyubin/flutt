import 'dart:convert';

import 'package:flutt/index.dart';
import 'package:flutt/view/firstPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewBook extends StatefulWidget{
  @override
  _NewBookRouteState createState() => _NewBookRouteState();
}

class _NewBookRouteState extends State<NewBook> {
  BookdataList bookdataLi;


  @override
  Widget build(BuildContext context) {

    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(args.title),
        ),
      ),
      body: ListView.separated(
        separatorBuilder: (context,index){
          return Divider(color: Colors.grey);
        },
        itemCount: bookdataLi.bookdataList.length,
        itemBuilder: (context,index){
          return Row(
            children: <Widget>[
              Image.network(bookdataLi.bookdataList[index].bookimgurl),
              Column(
                children: <Widget>[
                  Text(bookdataLi.bookdataList[index].bookname),
                  Text(bookdataLi.bookdataList[index].author),
                  Text("内容简介" + bookdataLi.bookdataList[index].dec),
                ],
              ),
            ],
          );
        },
      )
    );
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    String booklistjson = await _loadBookDataJson();
    setState(() {
      List<dynamic> list = json.decode(booklistjson);
      bookdataLi = BookdataList.fromJson(list);
    });
  }

  Future<String> _loadBookDataJson()  async{
    return await rootBundle.loadString('jsons/bookdatas.json');
  }
}