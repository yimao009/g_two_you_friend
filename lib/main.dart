import 'package:flutter/material.dart';
import 'package:two_you_friend/pages/home_new_page.dart';

//import 'package:two_you_friend/pages/home_page.dart';

//import 'package:two_you_friend/pages/test_stateful_widget.dart';
/// 返回dart运行环境模式
const bool isRelease = bool.fromEnvironment('dart.vm.product');

/// App 核心入口文件
void main() {
  print(isRelease);
  runApp(MyApp());
}

/// MyApp 核心入口界面
class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Two You', // app的title信息
      theme: ThemeData(
        primarySwatch: Colors.blue, //页面的主题颜色
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Two You'),
        ),
        body: Center(
          child: HomeNewPage(),
        ),
      ),
    );
  }
}
