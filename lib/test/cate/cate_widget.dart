/*
 * Copyright (C) 2019 Baidu, Inc. All Rights Reserved.
 */
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CatePage1 extends StatefulWidget {
  @override
  _CatePage1State createState() => _CatePage1State();
}

class _CatePage1State extends State<CatePage1> {
  int selectIndex = 0;

  List list = new List(100);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          leftWidget(),
          rightWidget(),
        ],
      ),
    );
  }

  Widget _item(int index) {
    bool _selected = selectIndex == index;

    return InkWell(
      onTap: (){
        setState(() {
          selectIndex = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(top: 10,bottom: 10,left: 5,right: 5),
        padding: EdgeInsets.only(top: 3,bottom: 3),
        decoration: _selected
            ? BoxDecoration(
              color: Colors.redAccent,
              border: Border.all(width: 2.0, color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            )
            : BoxDecoration(
              border: Border.all(width: 2.0,color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
        child: Text(
          "分类",
          style: TextStyle(
            color: _selected ? Colors.white : Colors.black,
            letterSpacing: 6,
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
        ),
      ),
    );
  }

  Widget leftWidget() {
    return Container(
      width: 80,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width: 2, color: Colors.white),
          )),
      child: ListView(
        children: list.asMap().keys.map((v) {
          return _item(v);
        }).toList(),
      ),
    );
  }

  Widget rightWidget() {
    return Container(
      color: Colors.amberAccent,
      width: 280,
    );
  }
}

