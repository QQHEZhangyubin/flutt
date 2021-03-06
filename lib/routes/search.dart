import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//class SearchRoute extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("搜索页"),
//      ),
//      body: Center(
//        child:InkWell(
//          child:Icon(Icons.search),
//          onTap: (){
//            showSearch(context: context, delegate: SearchBarDelegate());
//          }
//        )
//
//      ),
//    );
//  }
//
//}

class SearchBarDelegate extends SearchDelegate<String>{
  @override
  List<Widget> buildActions(BuildContext context) {
    //    右侧显示内容 这里放清除按钮
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: (){
            query = "";
            showSuggestions(context);
          },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // 左侧显示内容 这里放了返回按钮
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
      ),
      onPressed: (){
        if(query.isEmpty){
          close(context, null);
        }else{
          query = "";
          showSuggestions(context);
        }
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO:点击了搜索显示的页面
    return Center(
      child: Text(query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SearchContentView();
  }
}

class SearchContentView extends StatefulWidget {

  @override
  _SearchContentViewState createState() => _SearchContentViewState();
}

class _SearchContentViewState  extends State<SearchContentView>{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
                '大家都在搜',
                style: TextStyle(fontSize: 16),
            ),
          ),
          SearchItemView(),
          Container(
            child: Text(
                '历史记录',
                style: TextStyle(fontSize: 16),
            ),
          ),
          SearchItemView(),
        ],
      ),
    );
  }

}

class SearchItemView extends StatefulWidget {
  @override
  _SearchItemViewState createState() => _SearchItemViewState();
}

class _SearchItemViewState extends State<SearchItemView> {
  List<String> items = [
    '追风筝的人',
    '经济学通识',
    '倚天屠龙记',
    '数学之美',
    '大学中庸',
    '论持久战'
  ];

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Wrap(
        spacing: 10,
        children:
          items.map((item){
            return SearchItem(title:item);
          }).toList(),
      ),
    );
  }
}

class SearchItem extends StatefulWidget{
  @required
  final String title;
  const SearchItem({Key key,this.title}) : super (key:key);
  @override
  _SearchItemState createState() => _SearchItemState();

}

class _SearchItemState extends State<SearchItem> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        child: Chip(
          label: Text(widget.title),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onTap: (){
          print(widget.title);
        },
      ),
      color: Colors.white,
    );
  }
}