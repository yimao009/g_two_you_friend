
import 'package:flutter/material.dart';
/// likeNum状态管理模块
class LikeNumModel with ChangeNotifier {
  /// 声明私有变量
  int _likeNum = 0;
  int get value => _likeNum;

  void changeLikeNum() {
    _likeNum++;
    notifyListeners();
  }
}