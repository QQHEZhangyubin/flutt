import 'package:flutt/models/index.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget{
  @override
  _SecondPageState createState() => _SecondPageState();
}
class _SecondPageState extends State<SecondPage>{
  List<Bookdata> books = new List() ;
  bool refresh = true;
  @override
  void initState() {
    super.initState();
    if(refresh){
      loadMoreData();
    }
  }
  @override
  Widget build(BuildContext context) {
    Widget divider1=Divider(color: Colors.grey,);
    return Scaffold(
      appBar: AppBar(
        title: Text('收藏',),
      ),
      body: books.length == 0 ? Center(child: Text("暂无数据"),): RefreshIndicator(
          onRefresh: _pullToRefresh,
          child: ListView.separated(
              itemCount: books.length,
              itemBuilder: (context,index) {
                return renderRow(index,context);
              },
              separatorBuilder: (context,index){
                return divider1;
              },
          ),
      )
    );
  }

  void loadMoreData() {
    for(int i = 0;i<15;++i){
      Bookdata bookdata = new Bookdata();
      bookdata.bookimgurl = "https://img10.360buyimg.com/n2/jfs/t1/5363/11/10030/702200/5bc991d2Eda85e518/ddcf47f8b711357e.jpg";
      bookdata.author = "撒贝宁";
      bookdata.bookname = "为人民服务";
      bookdata.library="中区三楼";
      bookdata.suoshuhao="TP368/377";
      books.add(bookdata);
    }
  }

  Widget renderRow(int index, BuildContext context) {
    return GestureDetector(
      onLongPress: (){
        print(books[index].bookname);
      },
      child: Row(
        children: <Widget>[
          Expanded(
              child: Image.network(books[index].bookimgurl),
          ),

          Expanded(
              child: Column(
                children: <Widget>[
                  Text(books[index].bookname),
                  Text(books[index].author),
                  Text(books[index].library),
                  Text(books[index].suoshuhao),
                ],
              ),
          )

        ],
      ),
    );

  }




  Future<void> _pullToRefresh() async{
    books.clear();
    loadMoreData();
  }
}