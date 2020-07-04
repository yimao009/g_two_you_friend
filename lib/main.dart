import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';
import 'package:two_you_friend/model/like_num_model.dart';

import 'package:two_you_friend/pages/home_new_page.dart';
import 'package:two_you_friend/pages/name_game.dart';
import 'package:two_you_friend/pages/name_game_provider.dart';
import 'package:two_you_friend/pages/name_game_redux.dart';

import 'package:two_you_friend/pages/home_page.dart';

import 'package:two_you_friend/pages/test_stateful_widget.dart';
import 'package:two_you_friend/states/name_states.dart';
/// 返回dart运行环境模式
const bool isRelease = bool.fromEnvironment('dart.vm.product');

/// App 核心入口文件
void main() {
  final store =
  Store<NameStates>(reducer, initialState: NameStates.initState());
  runApp(MyApp(store));
}

/// MyApp 核心入口界面
class MyApp extends StatelessWidget {
  /// 初始
  final Store<NameStates> store;
  /// 构造函数
  MyApp(this.store);

  final LikeNumModel liekNum = LikeNumModel();
  @override
  Widget build(BuildContext context) {
    /// Redux 示例
//    return StoreProvider<NameStates>(
//      store: store,
//      child: MaterialApp(
//        title: 'Two You', // app的title信息
//        showSemanticsDebugger: false,
//        theme: ThemeData(
//          primarySwatch: Colors.blue, //页面的主题颜色
//        ),
//        home: Scaffold(
//          appBar: AppBar(
//            title: Text('Two You'),
//          ),
//          body: Center(
//            child: NameGameRedux(store: store,)
//          ),
//        ),
//      ),
//    );

    return Provider<int>.value(
      child: ChangeNotifierProvider.value(
        value: liekNum,
        child: MaterialApp(
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
        ),
      ),
    );
  }
}
