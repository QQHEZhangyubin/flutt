import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SetRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SetRouteState();
  }
}

class _SetRouteState extends State<SetRoute> {
  bool _switchListTitleValue = true;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    ScreenUtil.init(context, width: 750, height: 1334);
    return Scaffold(
      appBar: AppBar(
        title: Text('设置'),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          SwitchListTile(
              title: Text('接受信息通知'),
              value: _switchListTitleValue,
              selected: false,
              activeColor: Colors.blue,
              onChanged: (data){
                setState(() {
                  _switchListTitleValue = !_switchListTitleValue;
                });
              },
          ),
          SizedBox(height:ScreenUtil().setHeight(30) ,),
          Divider(color: Colors.grey,),
          ListTile(
            title: Text('去评分'),
          ),
          Divider(color: Colors.grey,),
          ListTile(
            title: Text('清除缓存'),
            subtitle: Text('12.8MB'),
          ),
          Divider(color: Colors.grey,),
          ListTile(
            title: Text('检查更新'),
            subtitle: Text('已是最新版本'),
          ),
          Divider(color: Colors.grey,),
          SizedBox(height:ScreenUtil().setHeight(30) ,),
          ListTile(
            title: Text('帮助与反馈'),
          ),
          Divider(color: Colors.grey,),
          ListTile(
            title: Text('关于借阅帮'),
          ),
          SizedBox(height:ScreenUtil().setHeight(10) ,),
          ListTile(
            title: Center(
                child: RaisedButton(
                onPressed: (){
                  Navigator.of(context).pushNamedAndRemoveUntil("login", (Route route) => false);
                },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Text('退出帐号'),
                  color: Colors.blue,
                  textColor: Colors.white,
                ),
            ),
          ),
        ],
      ),
    );
  }
}