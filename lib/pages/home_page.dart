import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// App 首页入口
///
/// 本模块函数， 加载状态类组件HomePageState
/// [prefix]是显示在时间之前的一个字符串
class HomePage extends StatefulWidget {
  /// 当前时间显示的前缀信息
  final String prefix = '当前时间';
  @override
  _HomePageState createState() => _HomePageState();
}

/// 首页有状态类组件类
///
/// 主要是获取当前时间，并动态展示当前时间
class _HomePageState extends State<HomePage> {
  /// 展示当前字符串
  String currentTimeStr;
  @override
  void initState() {
    super.initState();
    currentTimeStr = getCurrentTime();
    refreshTimeStr();
  }

  /// 更新当前时间 [currentTimeStr]
  ///
  /// 每 500ms 更新一次，使用Timer
  void refreshTimeStr() {
    const period = Duration(milliseconds: 500);
    Timer.periodic(period, (timer) {
      setState(() {
        currentTimeStr = getCurrentTime();
      });
    });
  }

  /// 获取当前时间戳
  ///
  /// [prxfix]需要传入一个前缀信息
  /// 返回一个字符串类型的前缀信息： 时间戳
  String getCurrentTime({String prefix = ''}) {
    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd hh:mm:ss');
    var nowTime = formatter.format(now);

    return '$prefix $nowTime';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[Text(widget.prefix), Text(currentTimeStr)],
    );
  }
}
