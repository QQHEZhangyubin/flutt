/*
第一页的书单item布局
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShuDanItem extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 190,
      child:Card(
        elevation: 15.0,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))),
        child: Column(
          children: <Widget>[
            Text(
              '肺炎肆略，病毒来袭|4本',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text('面对流行病，人类将何去何从？'),
            Padding(padding: EdgeInsets.only(top: 8)),
            Row(
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: Column(
                      children: <Widget>[
                        Image.network("https://img11.360buyimg.com/n7/jfs/t1/101338/28/9744/30162/5e13099cE40042d5e/0acf7f187e1043d4.jpg"),
                        Text('病毒来袭')
                      ],
                    ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Image.network("https://img11.360buyimg.com/n7/jfs/t1/101338/28/9744/30162/5e13099cE40042d5e/0acf7f187e1043d4.jpg"),
                      Text('病毒来袭')
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Image.network("https://img11.360buyimg.com/n7/jfs/t1/101338/28/9744/30162/5e13099cE40042d5e/0acf7f187e1043d4.jpg"),
                      Text('病毒来袭')
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Image.network("https://img11.360buyimg.com/n7/jfs/t1/101338/28/9744/30162/5e13099cE40042d5e/0acf7f187e1043d4.jpg"),
                      Text('病毒来袭')
                    ],
                  ),
                )


              ],
            )
          ],
        ),
      ) ,
    );
  }

}