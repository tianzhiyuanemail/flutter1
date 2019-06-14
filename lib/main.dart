import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter1/test/AnimatedListSample.dart';
import 'package:flutter1/test/MyApp.dart';
import 'package:flutter1/test/W.dart';
import 'package:flutter1/test/form_widget.dart';
import 'package:flutter1/test/scaffold_widget.dart';


void main() {
  runApp(App());
  if (Platform.isAndroid) {
    /// 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，
    /// 覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle style =
        new SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(style);
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: W() ,
    );
  }
}
