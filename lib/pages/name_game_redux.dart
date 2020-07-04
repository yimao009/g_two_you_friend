import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'package:two_you_friend/widgets/name_game_redux/random_name_redux.dart';
import 'package:two_you_friend/widgets/name_game_redux/test_other_redux.dart';
import 'package:two_you_friend/widgets/name_game_redux/welcome_redux.dart';


class NameGameRedux extends StatelessWidget {
  /// store
  final Store store;
  /// 构造函数
  NameGameRedux({Key key, this.store}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print('NameGameRedux build');
    return Column(
      children: <Widget>[
        WelcomeRedux(store: store,),
        RandomNameRedux(store: store,),
        TestOtherRedux()
      ],
    );
  }
}
