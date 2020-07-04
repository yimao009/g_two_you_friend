import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:two_you_friend/states/name_states.dart';

class RandomNameRedux extends StatelessWidget {
  /// store
  final Store store;

  /// 构造函数
  RandomNameRedux({Key key, this.store}) : super(key: key);
  /// 有状态类返回组件信息
  @override
  Widget build(BuildContext context) {
    print('RandomNameRedux name build');
    return StoreConnector<NameStates, String>(
      converter: (store)=> store.state.name.toString(),
      builder: (context, name){
        return StoreConnector<NameStates, VoidCallback>(
          converter: (store) {
            return () => store.dispatch(NameAction.changName);
          },
          builder: (context, callback) {
            return FlatButton(
              child: Text(name),
              onPressed: ()=> callback(),
            );
          },
        );
      },
    );
  }
}

