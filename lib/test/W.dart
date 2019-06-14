/*
 * Copyright (C) 2019 Baidu, Inc. All Rights Reserved.
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' as math;

import 'cate/cate_widget.dart';


class W extends StatefulWidget {
  @override
  _WState createState() => _WState();
}

class _WState extends State<W> with SingleTickerProviderStateMixin{
  List<Widget> pages = new List<Widget>();

  final defaultItemColor = Color.fromARGB(255, 125, 125, 125);

  final itemNames = [
    _Item('首页', 'assets/images/ic_tab_home_active.png', 'assets/images/ic_tab_home_normal.png'),
    _Item('分类', 'assets/images/ic_tab_subject_active.png', 'assets/images/ic_tab_subject_normal.png'),
    _Item('市集', 'assets/images/ic_tab_shiji_active.png', 'assets/images/ic_tab_shiji_normal.png'),
    _Item('我的', 'assets/images/ic_tab_profile_active.png', 'assets/images/ic_tab_profile_normal.png')
  ];

  List<BottomNavigationBarItem> itemList;
  int _selectIndex = 0;

  List<Widget>  tabList;

  TabController tabController ;


  @override
  void initState() {
    super.initState();

    tabList = ['电影', '电视', '综艺', '读书', '音乐', '22', '33', '44', '55', '66']
        .map((item) => Text(
          '$item',
          style: TextStyle(fontSize: 15),
        ))
        .toList();
    tabController = TabController(vsync: this, length: tabList.length);

    pages
      ..add(
          Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.pink, //导航栏和状态栏的的颜色
              elevation: 0, //阴影的高度
              brightness: Brightness.light, //控制状态栏的颜色，lignt 文字是灰色的，dark是白色的
              //        iconTheme: IconThemeData(
              //            color: Colors.yellow,
              //            opacity: 0.5,
              //            size: 30), //icon的主题样式,默认的颜色是黑色的，不透明为1，size是24
              //        textTheme: TextTheme(), //这个主题的参数比较多,flutter定义了13种不同的字体样式
              centerTitle: true, //标题是否居中，默认为false
              //        toolbarOpacity: 0.5, //整个导航栏的不透明度
              bottomOpacity: 0.8, //bottom的不透明度
              titleSpacing: 0, //标题两边的空白区域,

              // 左侧返回按钮，可以有按钮，可以有文字
              leading: Builder(
                builder: (BuildContext context) {
                  return Align(
                    widthFactor: 10,
                    alignment: Alignment.center,
                    child: Text('咸鱼',style: TextStyle(color: Colors.white),),
                  );
                },
              ),
              title: Container(
                width: 400,
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                decoration: BoxDecoration(
                    color:  Colors.white70,
                    border: Border(
                      bottom: BorderSide(width: 0.5, color: Colors.black12),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Text('标题1'),
              ),
              actions: <Widget>[
                IconButton(
                  color: Colors.black54,
                  icon: Icon(Icons.border_horizontal),
                  // tooltip: 'Restitch it',
                  onPressed: (){},
                ),
              ],
              bottom: PreferredSize(
                child: Container(
                  //color: Colors.white,
                  height: 30,
                  child: TabBar(
                    tabs: tabList,
                    isScrollable: true,
                    controller: tabController,
                    indicatorColor: Colors.yellowAccent,
                    labelColor: Colors.yellowAccent,
                    labelStyle: TextStyle(fontSize: 18, color: Colors.white),
                    unselectedLabelColor: Colors.white,
                    unselectedLabelStyle: TextStyle(fontSize: 18, color: Colors.white),
                    indicatorSize: TabBarIndicatorSize.label,
                  ),
                ),
                preferredSize: Size(10, 10),
              ),
            ),
            body: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[

                    new SliverToBoxAdapter(
                      child: new Container(
                        width: 100,
                        height: 200,
                        color: Colors.black,
                      ),
                    ),
                    new SliverPersistentHeader( /// 头部导航栏
                      floating: true,
                      pinned: true,
                      delegate: new _SliverAppBarDelegate(
                        maxHeight: 50.0,
                        minHeight: 50.0,
                        child: new Container(
                          color: Colors.redAccent,
                          child: Container(
                            width: 100,
                            height: 200,
                            color: Colors.green,
                            child:  Text("second SliverPersistentHeader"),
                          ),
                        ),
                      ),
                    ),
                  ];
                },
                body: TabBarView(
                  controller: tabController,
                  children:tabList.map((r){
                    return CustomScrollView(
                      slivers: <Widget>[
                        new SliverPersistentHeader( /// 头部导航栏
                          floating: true,
                          pinned: true,
                          delegate: new _SliverAppBarDelegate(
                            maxHeight: 150.0,
                            minHeight: 150.0,
                            child: new Container(
                              color: Colors.redAccent,
                              child: Container(
                                width: 100,
                                height: 200,
                                color: Colors.redAccent,
                                child:  Text(r.toString()),
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  }).toList(),
                ),
          )
          )
      )
      ..add(CatePage1())
      ..add(CatePage2())
      ..add(CatePage3());

    if (itemList == null) {
      itemList = itemNames
          .map((item) => BottomNavigationBarItem(
          icon: Image.asset(item.normalIcon, width: 30.0, height: 30.0),
          title: Text(item.name, style: TextStyle(fontSize: 10.0)),
          activeIcon: Image.asset(item.activeIcon, width: 30.0, height: 30.0)))
          .toList();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
        items: this.itemList,
        onTap: (int index) {
          ///这里根据点击的index来显示，非index的page均隐藏
          setState(() {
            _selectIndex = index;
            //这个是用来控制比较特别的shopPage中WebView不能动态隐藏的问题
            //shopPageWidget.setShowState(pages.indexOf(shopPageWidget) == _selectIndex);
          });
        },

        ///图标大小
        iconSize: 24,
        ///当前选中的索引
        currentIndex: _selectIndex,
        ///选中后，底部BottomNavigationBar内容的颜色(选中时，默认为主题色)（仅当type:
        ///BottomNavigationBarType.fixed,时生效）
        fixedColor: Color.fromARGB(255, 0, 188, 96),
        type: BottomNavigationBarType.fixed,
      ),
      body: IndexedStack(
        index: _selectIndex,
        children: pages,
      ),

    );
  }
}
class CatePage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}class CatePage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}





class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max((minHeight ?? kToolbarHeight), minExtent);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

/// vo 对象
class _Item {
  String name, activeIcon, normalIcon;

  _Item(this.name, this.activeIcon, this.normalIcon);
}
