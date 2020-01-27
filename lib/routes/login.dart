
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class LoginRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginRouteState();
  }

}

class _LoginRouteState extends State<LoginRoute> {

  //焦点
  FocusNode _focusNodeUserName = new FocusNode();
  FocusNode _focusNodePassWord = new FocusNode();

  //用户名输入框控制器，此控制器可以监听用户名输入框操作
  TextEditingController _userNameController = new TextEditingController();

  //表单状态
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var _password = '';//用户名
  var _username = '';//密码
  var _isShowPwd = false;//是否显示密码
  var _isShowClear = false;//是否显示输入框尾部的清除按钮

  @override
  void initState() {
    //设置焦点监听
    _focusNodeUserName.addListener(_focusNodeListener);
    _focusNodePassWord.addListener(_focusNodeListener);
    //监听用户名框的输入改变
    _userNameController.addListener((){
      print(_userNameController.text);
      //监听文本框输入变化，当有内容的时候，显示尾部清除按钮，否则不显示
      if(_userNameController.text.length > 0){
        _isShowClear = true;
      }else{
        _isShowClear = false;
      }
      setState(() {

      });
    });
    super.initState();
  }

  @override
  void dispose() {
    //移除焦点监听
    _focusNodeUserName.removeListener(_focusNodeListener);
    _focusNodePassWord.removeListener(_focusNodeListener);
    _userNameController.dispose();
    super.dispose();
  }
    //监听焦点
  Future<Null> _focusNodeListener() async{
    if(_focusNodeUserName.hasFocus){
      print('用户名框获取焦点');
      _focusNodePassWord.unfocus();
    }
    if(_focusNodePassWord.hasFocus){
      print('密码框获取焦点');
      _focusNodeUserName.unfocus();
    }
  }

  /**
   * 验证用户名
   */
  String validateUserName(value){

  }

  /**
   * 验证密码
   */
  String validatePassWord(String value) {

  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
   //logo 图片区域
    Widget logoImageArea = new Container(
      alignment: Alignment.topCenter,
      //设置图片为圆形
      child: ClipOval(
        child: Image.asset(
            "imgs/ic_launcher.png",
          height: 100,
          width: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
    
    //输入文本框区域
    Widget inputTextArea = new Container(
      margin: EdgeInsets.only(left: 20,right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Colors.white,
      ),
      child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                controller: _userNameController,
                focusNode: _focusNodeUserName,
                //设置键盘类型
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "请输入学号",
                  prefixIcon: Icon(Icons.person),
                  //尾部添加清楚按钮
                  suffixIcon: (_isShowClear) ? IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: (){
                        //清楚输入框内容
                        _userNameController.clear();
                      },
                  )
                      : null,
                ),
                validator: validateUserName,
                onSaved: (String value){
                  _username = value;
                },
              ),
              TextFormField(
                focusNode: _focusNodePassWord,
                decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "请输入密码",
                  prefixIcon: Icon(Icons.lock),
                  //是否显示密码
                  suffixIcon: IconButton(
                      icon: Icon((_isShowPwd) ? Icons.visibility:Icons.visibility_off),
                      //点击改变显示或隐藏按钮
                      onPressed: (){
                        setState(() {
                          _isShowPwd = !_isShowPwd;
                        });
                      },
                  )
                ),
                obscureText: !_isShowPwd,
                //密码验证
                validator: validatePassWord,
                //保存数据
                onSaved: (String value){
                  _password = value;
                },
              ),
            ],
          )),
    );

    //登陆按钮区域
    Widget loginButtonArea = new Container(
      margin: EdgeInsets.only(left: 20,right: 20),
      height: 45.0,
      child: RaisedButton(
          color: Colors.blue[300],
          child: Text(
            "登陆",
            style: Theme.of(context).primaryTextTheme.headline,
          ),
          //设置按钮圆角
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),

          onPressed: (){
            //点击登陆按钮，解除焦点，回收键盘
            _focusNodePassWord.unfocus();
            _focusNodeUserName.unfocus();
            if(_formKey.currentState.validate()){
              //只有通过验证，才会执行这里
              _formKey.currentState.save();
              //TODO:登陆操作
              print('$_username + $_password');
              Navigator.pushReplacementNamed(
                  context,
                  "home",
              );
            }
          },
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      //外层添加一个手势，用于点击空白部分
      body: GestureDetector(
          onTap: (){
            print('点击了空白区域');
            _focusNodePassWord.unfocus();
            _focusNodeUserName.unfocus();
          },
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: ScreenUtil().setHeight(100),
              ),
              logoImageArea,
              SizedBox(
                height: ScreenUtil().setHeight(80),
              ),
              inputTextArea,
              SizedBox(
                height: ScreenUtil().setHeight(80),
              ),
              loginButtonArea,
            ],
          ),
        ),
    );
  }


}