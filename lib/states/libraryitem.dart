import 'package:flutt/models/commentbook.dart';
import 'package:flutt/models/guancang.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
/*
书籍详情页面中的馆藏信息子布局
书籍详情页面中的评论信息子布局
 */
class LibraryItem extends StatelessWidget{
  Guancang _guancang;

  LibraryItem(Guancang guancang){
    _guancang = guancang;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      child: Column(
        children: <Widget>[
          Text('所在馆：' + _guancang.suozaiguan),
          Row(
            children: <Widget>[
              Text('馆藏点：' + _guancang.guancangdian),
              RaisedButton(
                color: Colors.blue,
                child: Text('收藏'),
                onPressed: (){
                  print('收藏');
                },
              ),
            ],
          ),
          Text('索书号：' + _guancang.suoshuhao),
        ],
      ),
    );
  }
}

class CommentItem extends StatelessWidget{
  Commentbook _commentbook;
  CommentItem(Commentbook commentbooklist){
    _commentbook = commentbooklist;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child:   Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                child: Image.network(_commentbook.commentuserimg),
                backgroundColor: Colors.red,
              ),
              Column(
                children: <Widget>[
                  Text(_commentbook.commentuser),
                  Padding(
                    padding: EdgeInsets.all(4),
//                    child: Expanded(
//                      child: ListView.builder(
//                        scrollDirection: Axis.horizontal,
//                        itemCount: 5,
//                        itemBuilder: (context,index){
//                          return Icon(Icons.favorite,color: Colors.red,);
//                        },
//                      ),
//                    ),
                  ),
                ],
              ),
              Text('135'),
              IconButton(
                icon: Icon(Icons.favorite_border,),
                onPressed: (){
                },
              ),
            ],
          ),
          Text(_commentbook.commentcontent,softWrap: true,semanticsLabel: "sgscahisca",),
        ],
      ),
    );

  }

}