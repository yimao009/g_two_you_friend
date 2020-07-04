import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:two_you_friend/inherited_widget/name_inherited_widget.dart';
import 'package:two_you_friend/states/name_states.dart';

/// 欢迎人展示组件
class WelcomeRedux extends StatelessWidget {
  /// store
  final Store store;
  /// 构造函数
  WelcomeRedux({Key key, this.store}) : super(key: key);
  /// 无状态组件返回组件信息
  @override
  Widget build(BuildContext context) {
    print('WelcomeRedux build');
    return StoreConnector<NameStates, String>(
      converter: (store)=> store.state.name.toString(),
      builder: (context, name){
        return Text('欢迎 $name');
      },
    );
  }
}
