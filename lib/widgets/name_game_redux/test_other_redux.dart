import 'package:flutter/material.dart';
/// 其它展示组件
class TestOtherRedux extends StatelessWidget {
  /// 有状态类返回组件信息
  @override
  Widget build(BuildContext context) {
    print('TestOtherRedux other build');
    return Text(
      '我是其他组件'
    );
  }
}
