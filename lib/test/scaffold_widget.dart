/*
 * Copyright (C) 2019 Baidu, Inc. All Rights Reserved.
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScaffoldWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//        this.appBar,//标题栏
//        this.body,//内容
//        this.floatingActionButton,//悬浮按钮
//        this.persistentFooterButtons,底部持久化现实按钮
//        this.drawer,//侧滑菜单左
//        this.endDrawer,//侧滑菜单右
//        this.bottomNavigationBar,//底部导航
//        this.backgroundColor,//背景颜色
//        this.resizeToAvoidBottomPadding: true,//自动适应底部padding
//        this.primary: true,试用使用primary主色

      backgroundColor: Colors.pinkAccent,
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        title: Text("appbar"),
      ),
      body: new Text("neirong"),
      floatingActionButton: FloatingActionButton(
        child: Text("xuanfuanniu"),
        onPressed: null,
      ),
      persistentFooterButtons: <Widget>[
        Text("1"),
        Text("2"),
        Text("3"),
        Text("4"),
      ],
      drawer: Text("zuobian"),
      endDrawer: Text("zuobian"),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 1,
        items: [
          BottomNavigationBarItem(
            title: Text("yi"),
            icon: Icon(Icons.map)
          ),BottomNavigationBarItem(
            title: Text("yi"),
              icon: Icon(Icons.map)
          ),BottomNavigationBarItem(
            title: Text("yi"),
              icon: Icon(Icons.map)
          ),BottomNavigationBarItem(
            title: Text("yi"),
              icon: Icon(Icons.map)
          ),BottomNavigationBarItem(
            title: Text("yi"),
              icon: Icon(Icons.map)
          ),
        ],
      ),
    );
  }
}
