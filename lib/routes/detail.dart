import 'dart:convert';

import 'package:flutt/models/commentbook.dart';
import 'package:flutt/models/guancang.dart';
import 'package:flutt/states/expandabletext.dart';
import 'package:flutt/states/libraryitem.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailRoute extends StatefulWidget {
  static void show(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return DetailRoute();
    }));
  }

  @override
  State<StatefulWidget> createState() {
    return _DetailRouteState();
  }
}

class _DetailRouteState extends State<DetailRoute> {
  List<Guancang> guancanglist = [];
  List<Commentbook> commentbooklist = [];
  String bookname,author,press,pressdate,dec,bookimg;
  int renqi,chaptercount,commentbooknumber;

  bool flag = true;

  listlibrary(BuildContext context){
    if(flag){
      return Expanded(
          child: ListView.separated(
            itemBuilder: (context,index){
                return LibraryItem(guancanglist[index]);
            },
            separatorBuilder: (context,index){
              return Divider(color: Colors.grey,);
            },
            itemCount:guancanglist.length,
          )
      );
    }else{
       return Expanded(
           child: Column(
             children: <Widget>[
               Expanded(
                   child: ListView.separated(
                       itemBuilder: (context,index){
                         return CommentItem(commentbooklist[index]);
                       },
                       separatorBuilder: (context,index){
                          return Divider(color: Colors.grey,);
                       },
                       itemCount: commentbooklist.length,
                   ),
               ),
               Container(
                 width: double.infinity,
                 padding: EdgeInsets.all(4),
                 child: Text("input"),
               ),
             ],
           ),
       );

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: Row(
            children: <Widget>[
              Text('书籍详情'),
              IconButton(
                  icon: Icon(Icons.share),
                  onPressed: (){
                    print('分享按钮事件');
                  },
              )
            ],
          ),
        )
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
                children: <Widget>[
                  Image.network("https://img10.360buyimg.com/n2/jfs/t27619/331/517511663/314299/a4896dd9/5bb03049Nb29c137d.jpg"),
                  Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Column(
                      children: <Widget>[
                        Text(bookname),
                        Icon(Icons.favorite,color: Colors.red,semanticLabel: 'Like',),
                        Text(author),
                        Text(press + "/" + pressdate),
                      ],
                    ),
                  ),
                ],
              ),
            ExpandableText(text: dec, maxLines: 3, style: TextStyle(fontSize: 15, color: Colors.black),),
            Text('章节目录' ),
            Padding(
                padding: EdgeInsets.only(top: 4),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: ListTile(
                          title: Text('馆藏'),
                          onTap: (){
                            setState(() {
                                flag = true;
                            });
                          },
                        ),
                    ),
                    Expanded(
                        flex: 1,
                        child: ListTile(
                          title: Text('书评 (6)'),
                          onTap: (){
                            setState(() {
                              flag = false;
                            });
                          },
                        ),
                    ),
                  ],
                ),
            ),
            listlibrary(context),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    LoadBookDetailInfo();
  }

  void LoadBookDetailInfo() async {
     String bookdetail = await rootBundle.loadString('jsons/bookdetail.json');
     setState(() {
          Map<String,dynamic> jsonmap   = json.decode(bookdetail);
          final GuaLis = jsonmap['guancang'] as List;
          guancanglist =  GuaLis.map((value) => Guancang.fromJson(value)).toList();
          final CommentBookLi = jsonmap['boocomment'] as List;
          commentbooklist = CommentBookLi.map((value) => Commentbook.fromJson(value)).toList();
          commentbooknumber = commentbooklist.length;
          bookname  = jsonmap['bookname'] as String;
          bookimg = jsonmap['bookimgurl'] as String;
          author = jsonmap['author'] as String;
          dec = jsonmap['dec'] as String;
          press = jsonmap['press'] as String;
          pressdate = jsonmap['pressdate'] as String;
          chaptercount  = jsonmap['chaptercount'] as int;
          renqi = jsonmap['favoritecount'] as int;
     });
  }
}