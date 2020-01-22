import 'dart:convert';

import 'package:flutt/index.dart';
import 'package:flutt/view/firstPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TabViewI extends StatefulWidget{
  String _string;
  TabViewI(String flag){
    _string = flag;
  }

  @override
  _TabViewIState createState() => _TabViewIState(_string);
}

class _TabViewIState extends State<TabViewI> {
  BookdataList bookdataLi;
  String sortflag;
  _TabViewIState(String string){
    sortflag = string;
    print(sortflag);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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