import 'package:flutt/models/index.dart';
import 'package:flutt/states/readitem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:convert';

class FourPage extends StatefulWidget{
  @override
  _FourPageState createState() => _FourPageState();
}
class _FourPageState extends State<FourPage>{
   List<Read> nowreads = new List();
   List<Read> historyreads = new List();
   List<Read> just = new List();



   headsection (BuildContext context){
     return Container(
       width: MediaQuery.of(context).size.width,
       height: 260,
       decoration: BoxDecoration(
         color: Colors.blue,
       ),
       child: Column(
         children: <Widget>[
           Expanded(
               flex: 3,
               child: Row(
                 children: <Widget>[
                   Expanded(
                       flex: 1,
                       child: IconButton(
                           icon: Icon(Icons.info_outline),
                           onPressed: (){

                           },
                       ),
                   ),
                   Expanded(
                       flex: 2,
                       child: Center(
                         child:Text(
                           "网vdfsvf名",
                           textScaleFactor: 2,
                         ),
                       ),
                   ),
                   Expanded(
                       flex: 1,
                       child: IconButton(
                           icon: Icon(Icons.settings),
                           onPressed: (){
                             Navigator.pushNamed(
                                 context,
                                 "setting",
                             );
                           },
                       ),
                   ),
                 ],
               ),
           ),
           Expanded(
               flex: 4,
               child: CircleAvatar(
                 radius: 50,
                 backgroundColor: Colors.white,
                 child: Image.network("https://cdn2.jianshu.io/assets/default_avatar/2-9636b13945b9ccf345bc98d0d81074eb.jpg"),
               ),
           ),
         ],
       ),
     );
   }

   middleSection(BuildContext context){
     return Container(
       padding: EdgeInsets.all(5),
       width: MediaQuery.of(context).size.width,
       height: 50,
       decoration: BoxDecoration(
         color: Colors.white,
       ),
       child: Row(
         children: <Widget>[
           Expanded(
               flex: 1,
               child: Column(
                 children: <Widget>[
                   Text("课结束"),
                   Text("12"),
                 ],
               ),
           ),
           Expanded(
               flex:1,
               child: Column(
                 children: <Widget>[
                   Text("课结束"),
                   Text("12"),
                 ],
               ),
           ),
           Expanded(
               flex: 1,
               child: Column(
                 children: <Widget>[
                   Text("课结束"),
                   Text("12"),
                 ],
               ),
           ),
         ],
       ),
     );
   }

   endsSection(BuildContext context){
     return Container(
       width: MediaQuery.of(context).size.width,
       height: 50,
       child:Row(
         children: <Widget>[
           Expanded(
               flex: 1,
               child: ListTile(
                 title: Text("正在借阅"),
                 onTap: (){
                   setState(() {
                     //historyreads.clear();
                     just = nowreads;
                     listSection(context,nowreads);
                   });
                 },
               ),
           ),
           Expanded(
             flex: 1,
             child: ListTile(
                 title: Text("借阅历史"),
                 onTap:(){
                   setState(() {
                     //nowreads.clear();
                     just = historyreads;
                     listSection(context,historyreads);
                   });
                 },
             ),
           ),
         ],
       ) ,
     );
   }
  listSection (BuildContext context,List<Read> reads){
     return ListView.separated(
           separatorBuilder: (index,context){
             return Divider(color: Colors.grey,);
           },
          itemCount: reads.length,
         itemBuilder: (context,index){
             return new ReadItem(context,reads[index]);
         },
     );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
                headsection(context),
                middleSection(context),
                endsSection(context),
                Expanded(child:listSection(context,just)),
          ],
        ),
      ),
    );
  }

   @override
   void initState() {
     super.initState();
     loadData();

   }

  void loadData() async{
     String recordjson =   await _loadinfo();
     setState(() {
       Map<String,dynamic> jsonmap = json.decode(recordjson);
       final nowreadList = jsonmap['nowread'] as List;
       nowreads = nowreadList.map((value) => Read.fromJson(value)).toList();
       final historyreadList = jsonmap['historyread'] as List;
       historyreads = historyreadList.map((value) => Read.fromJson(value)).toList();
       just = nowreads;
     });
   }

 Future<String> _loadinfo() async{
     return await rootBundle.loadString('jsons/record.json');
 }

}