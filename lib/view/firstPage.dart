import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutt/models/bannerdata.dart';
import 'package:flutt/routes/search.dart';

class FirstPage extends StatefulWidget{
  @override
  _FirstPageState createState() => _FirstPageState();
}
class _FirstPageState extends State<FirstPage>{
  List<Bannerdata> bannerDatas = List();
  @override
  void initState() {
      for(int i =0;i<5;++i){
        Bannerdata bannerdata = new Bannerdata();
        bannerdata.imgurl = "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1579327324199&di=c7425062d8cb16e37b672a15af8b5a4a&imgtype=0&src=http%3A%2F%2F00.imgmini.eastday.com%2Fmobile%2F20180614%2F20180614081508_a2bdd51f69827d1c852675bf6687917d_5.jpeg";
        bannerdata.clickurl="https://www.jianshu.com/p/7187203e5e88";
        bannerDatas.add(bannerdata);
      }
  }

  @override
  Widget build(BuildContext context) {
     var daxuebidu = Column(
       crossAxisAlignment: CrossAxisAlignment.center,
       children: <Widget>[
         Expanded(
             flex: 1,
             child: Row(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
                 Text(
                   '大学必读',
                 ),
                 IconButton(
                     icon: Icon(Icons.keyboard_arrow_right),
                     onPressed: (){
                       Navigator.pushNamed(
                           context,
                           "hotbang",
                           arguments: ScreenArguments("大学必读书单", "x2")
                       );
                     },
                 ),
               ],
             ),
         ),
         Expanded(
           flex: 3,
           child: Row(
             children: <Widget>[
               Image.network("https://img10.360buyimg.com/n2/jfs/t1/5363/11/10030/702200/5bc991d2Eda85e518/ddcf47f8b711357e.jpg"),
               Column(
                 children: <Widget>[
                   Text("书名"),
                   Text("作者"),
                   Text("简介"),
                 ],
               ),
             ],
           ),
         ),
         Expanded(
           flex: 3,
           child: Row(
             children: <Widget>[
               Expanded(
                 flex: 1,
                 child: Column(
                   children: <Widget>[
                     Image.network("https://img10.360buyimg.com/n2/jfs/t1/5363/11/10030/702200/5bc991d2Eda85e518/ddcf47f8b711357e.jpg"),
                     Text("书名")
                   ],
                 ),
               ),
               Expanded(
                 flex: 1,
                 child: Column(
                   children: <Widget>[
                     Image.network("https://img10.360buyimg.com/n2/jfs/t1/5363/11/10030/702200/5bc991d2Eda85e518/ddcf47f8b711357e.jpg"),
                     Text("书名")
                   ],
                 ),
               ),
               Expanded(
                 flex: 1,
                 child: Column(
                   children: <Widget>[
                     Image.network(
                         "https://img10.360buyimg.com/n2/jfs/t1/5363/11/10030/702200/5bc991d2Eda85e518/ddcf47f8b711357e.jpg"),
                     Text("书名")
                   ],
                 ),
               ),
             ],
           ),
         ),
       ],
     );
     var suibiankankan = Container(
       width: MediaQuery.of(context).size.width,
       child: Column(
         children: <Widget>[
           ListTile(
             title: Text('随便看看'),
             leading: Icon(Icons.rotate_left,color: Colors.blue,),
             trailing: IconButton(
                 icon: Icon(
                   Icons.arrow_forward_ios,
                   color: Colors.blue,
                 ),
                 onPressed: (){

                 },
             ),
           ),
           Expanded(
               child: GridView.builder(
                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                     crossAxisCount: 3,
                     childAspectRatio: 1.0,
                   ),
                   itemBuilder: (context,index){
                     return GestureDetector(
                       onTap: (){

                       },
                       child: Column(
                         children: <Widget>[
                           Image.network("https://img12.360buyimg.com/n7/jfs/t29086/155/678303512/196690/31039bd0/5bfb571bN407bfa35.jpg"),
                           Text("浮生六记"),
                         ],
                       ),
                     );
                   },
                   itemCount: 6,
               ),
           ),
         ],
       ),
     );

    return Scaffold(
      appBar: AppBar(
        title: TextFiledWidget(),
        backgroundColor: Colors.transparent,
      ),
      body:CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: Swiper(
                    itemCount: bannerDatas.length,
                    itemBuilder: (BuildContext context,int index){
                      return Image.network(
                        bannerDatas[index].imgurl,
                        fit: BoxFit.fill,
                      );
                    },
                    pagination: SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                        color: Colors.black54,
                        activeColor: Colors.white,
                        size: 5.0,
                        activeSize: 8.0,
                      ),
                    ),
                    scrollDirection: Axis.horizontal,
                    autoplay: true,
                    onTap: (index) => print('点击了第$index个'),
                  ),
                ),
          ),
          SliverToBoxAdapter(
                 child:  Padding(
                  padding: const EdgeInsets.only(top: 0.5),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: RaisedButton(
                          child: Text("分类榜"),
                          textColor: Colors.white,
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)
                          ),
                          onPressed: (){
                            Navigator.pushNamed(
                                context,
                                "sortbang",
                                arguments: ScreenArguments("分类榜", "x2")
                            );
                          },
                        ),
                      ),
                      Expanded(
                        // flex: 1,
                        child: RaisedButton(
                            child: Text("借阅榜"),
                            textColor: Colors.white,
                            color: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)
                            ),
                            onPressed: (){
                              Navigator.pushNamed(
                                  context,
                                  "newbook",
                                  arguments: ScreenArguments("借阅榜", "x1")
                              );
                            }
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: RaisedButton(
                            child: Text("新书榜"),
                            textColor: Colors.white,
                            color: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)
                            ),
                            onPressed: (){
                              Navigator.pushNamed(
                                  context,
                                  "newbook",
                                  arguments: ScreenArguments("新书榜", "x0")
                              );
                            }
                        ),
                      ),
                    ],
                  ),
                ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 400,
              child: daxuebidu,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 500,
              child: suibiankankan,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 400,
              child: daxuebidu,
            ),
          ),
        // daxuebidu,
        ],
      )

    );
  }
}

//点击借阅榜，新书榜后，传递的参数
class ScreenArguments{
  final String title;
  final String type;

  ScreenArguments(this.title, this.type);

}

class TextFiledWidget extends StatelessWidget {
  Widget buildTextField(BuildContext context){
    return Theme(
        data: ThemeData(primaryColor: Colors.grey),
        child: TextField(
          autofocus: false,
          cursorColor: Colors.grey,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
            border: InputBorder.none,
            icon: Icon(Icons.search),
            hintText: "搜索书名/著作",
          ),
          onTap: (){
            //点击搜索框进入搜索页面
            showSearch(context: context, delegate: SearchBarDelegate());

//            Navigator.pushNamed(
//                context,
//                "search");
          },
        ));
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: <Widget>[
            Expanded(
                flex: 6,
                child:Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(9.0)),
                  ),
                  alignment: Alignment.center,
                  height:40,
                  child: buildTextField(context),
                ),
            ),
            Expanded(
                flex: 1,
                child:  IconButton(
                  iconSize: 45,
                  icon: Icon(Icons.fullscreen),
                  onPressed: (){
                      Navigator.pushNamed(context, "scanner");
                  },  //点击扫描二维码时行为
                ),
            ),
      ],
    ) ;
      
  }




}