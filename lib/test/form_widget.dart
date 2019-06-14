/*
 * Copyright (C) 2019 Baidu, Inc. All Rights Reserved.
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter/widgets.dart';

class FormWidget extends StatefulWidget {
  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  TextEditingController editingController =  new
  TextEditingController();

  bool b = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: <Widget>[
//          controller: controller,
//          maxLength: 30,//最大长度，设置此项会让TextField右下角有一个输入数量的统计字符串
//          maxLines: 1,//最大行数
//          autocorrect: true,//是否自动更正
//          autofocus: true,//是否自动对焦
//          obscureText: true,//是否是密码
//          textAlign: TextAlign.center,//文本对齐方式
//          style: TextStyle(fontSize: 30.0, color: Colors.blue),//输入文本的样式
//          inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],//允许的输入格式
//          onChanged: (text) {//内容改变的回调
//            print('change $text');
//          },
//          onSubmitted: (text) {//内容提交(按回车)的回调
//            print('submit $text');
//          },
//          enabled: true,//是否禁用

          TextField(
            controller: editingController,
            maxLength: 30,
            maxLines: 2,
            autocorrect: true,
            autofocus: true,
            obscureText: false,
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 30,color: Colors.redAccent),
            onChanged: (s){print(s);},
          ),
          CheckboxListTile(
            value: false,
            selected:true,// 默认文字是否高亮
            onChanged: (b){},
            dense: false,// 文字是否对齐 图标高度
            isThreeLine: false,// 文字是否三行显示
            title:  Text('全部'), // 主标题
            controlAffinity: ListTileControlAffinity.trailing, // 将控件放在何处相对于文本,leading 按钮显示在文字后面,platform,trailing 按钮显示在文字前面
            subtitle:  Text('勾选下列全部结果'), // 标题下方显示的副标题
            secondary:  Icon(Icons.archive), // 从复选框显示在磁贴另一侧的小组件
            activeColor: Colors.red, // 选中此复选框时要使用的颜色

          ),
          CheckboxListTile(
            value: b,
            selected:true,// 默认文字是否高亮
            onChanged: (b){
              setState(() {
                this.b = b;
              });
            },
            dense: false,// 文字是否对齐 图标高度
            isThreeLine: false,// 文字是否三行显示
            title:  Text('全部'), // 主标题
            controlAffinity: ListTileControlAffinity.trailing, // 将控件放在何处相对于文本,leading 按钮显示在文字后面,platform,trailing 按钮显示在文字前面
            subtitle:  Text('勾选下列全部结果'), // 标题下方显示的副标题
            secondary:  Icon(Icons.archive), // 从复选框显示在磁贴另一侧的小组件
            activeColor: Colors.red, // 选中此复选框时要使用的颜色

          ),
          Checkbox(
            value: false,
            onChanged: (b){
              setState(() {
                this.b = b;
              });
            },
          ),
          Align(
            alignment: Alignment.bottomRight,
//            heightFactor: 20,
            child: Text("pppp"),
          ),
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Image(
                image: NetworkImage("https://user-gold-cdn.xitu.io/2018/8/9/1651da01739c4c0c?imageView2/0/w/1280/h/960/format/webp/ignore-error/1"),
              ),

              Text("werwerw")
            ],
          ),


        ],
      )
    );
  }
}
