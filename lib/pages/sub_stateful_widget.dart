import 'package:flutter/material.dart';

/// 创建子组件类
class SubStatefulWidget extends StatefulWidget {
  @override
  _SubStatefulWidgetState createState() {
    print('sub create state');
    return _SubStatefulWidgetState();
  }
}

/// 创建子组件状态管理类
class _SubStatefulWidgetState extends State<SubStatefulWidget> {
  String name = 'sub test';
  @override
  void initState() {
    print('sub init state');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('sub did change dependencies');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(SubStatefulWidget oldWidget) {
    print('sub did update widget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    print('sub deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    print('sub dispose');
    super.dispose();
  }

  @override
  void reassemble() {
    print('sub reassemble');
    super.reassemble();
  }

  @override
  Widget build(BuildContext context) {
    print('sub build');
    return Text('subname $name');
  }
}
