
import 'package:flutter/material.dart';
/// likeNum状态管理模块
class LikeNumModel with ChangeNotifier {
  /// 声明私有变量
  int _likeNum = 0;
  /// 设置get方法
  int get value => _likeNum;
  /// 修改当前like数量
  void changeLikeNum() {
    print('like succes');
    _likeNum++;
    notifyListeners();
  }
}