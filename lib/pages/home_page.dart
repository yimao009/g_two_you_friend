import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// App 首页入口
///
/// 本模块函数， 记载状态类组件HomePageState
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

/// 首页有状态类组件类
///
/// 主要是获取当前时间，并动态展示当前时间
class _HomePageState extends State<HomePage> {
  /// 获取当前时间戳
  ///
  /// [prxfix]需要传入一个前缀信息
  /// 返回一个字符串类型的前缀信息： 时间戳
  String getCurrentTime(String prefix) {
    var now = DateTime.now();
    var formatter = DateFormat('yy-mm-dd H:m:s');
    var nowTime = formatter.format(now);

    return '$prefix $nowTime';
  }

  @override
  Widget build(BuildContext context) {
    return Text(getCurrentTime('当前时间'));
  }
}
