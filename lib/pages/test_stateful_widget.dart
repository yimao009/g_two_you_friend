import 'package:flutter/material.dart';
//import 'package:two_you_friendriend/pages/sub_stateful_widget.dart';

// ignore: public_member_api_docs
class TestStatefulWidget extends StatefulWidget {
  @override
  _TestStatefulWidgetState createState() {
    print('create state');
    return _TestStatefulWidgetState();
  }
}

class _TestStatefulWidgetState extends State<TestStatefulWidget> {
  /// 定义 state [count] 计算器
  int count;

  /// 定义 state [name] 为当前描述字符串
  String name;

  @override
  void initState() {
    print('init state');
    super.initState();
    setState(() {
      count = 1;
      name = 'test';
    });
  }

  @override
  void didChangeDependencies() {
    print('did change dependencies');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(TestStatefulWidget oldWidget) {
    count++;
    print('did update widget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    print('deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    print('dispose');
    super.dispose();
  }

  @override
  void reassemble() {
    print('reassemble');
    super.reassemble();
  }

  /// 修改 state name
  void changeName() {
    setState(() {
      print('set staet');
      name = 'flutter';
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Column(
      children: <Widget>[
        FlatButton(
          child: Text('$name $count'), // 使用 Text 组件显示描述字符和当前计算
          onPressed: () => changeName(), // 点击触发修改描述字符 state name
        ),
//        SubStatefulWidget()
      ],
    );
  }
}
