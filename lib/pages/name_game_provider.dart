import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:two_you_friend/model/name_model.dart';
import 'package:two_you_friend/widgets/name_game/test_other.dart';
import 'package:two_you_friend/widgets/provider/random_name_provider.dart';
import 'package:two_you_friend/widgets/provider/welcome_provider.dart';
/// 测试随机名字游戏组件
class NameGameProvider extends StatelessWidget {
  final name = NameModel();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Provider<String>.value(
          child: ChangeNotifierProvider.value(
            value: name,
            child: Column(
              children: <Widget>[
                WelcomeProvider(),
                RandomNameProvider()
              ],
            ),
          ),
        ),
        TestOther()
      ],
    );
  }
}
