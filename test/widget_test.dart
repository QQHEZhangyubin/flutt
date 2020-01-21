// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';

import 'expandabletext.dart';

void main() => runApp(TestApp());

class TestApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _ExpandableTextPageState();
  }
}

class _ExpandableTextPageState extends State<TestApp> {

  @override
  Widget build(BuildContext context) {
    String shortText = '不超过最大行数三行的多行文本不超过最大行数三行的多行文本';
    String longText = '超过最大行数三行的多行文本超过最大行数三行的多行文本超过最大行数三行的多行文本'
        '超过最大行数三行的多行文本超过最大行数三行的多行文本超过最大行数三行的多行文本超过最大行数三行的多行文本';

    return Scaffold(
      appBar: AppBar(
        title: Text('Deomo'),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('short text test:'),
            Container(
              color: Colors.yellow,
              child: ExpandableText(
                text: shortText,
                maxLines: 3,
                style: TextStyle(fontSize: 15,color:  Colors.black),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20),),
            Text('long text test:'),
            Container(
              color: Colors.yellow,
              child:ExpandableText(
                text: longText,
                maxLines: 3,
                style: TextStyle(fontSize: 15,color:  Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
