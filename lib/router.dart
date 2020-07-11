import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:two_you_friend/pages/common/web_view_page.dart';
import 'package:two_you_friend/pages/home_page/index.dart';
import 'package:two_you_friend/pages/user_page/index.dart';

/// app 协议头 tyfapp://userPageIndex?userId=1001
const String appScheme = "tyfapp://";
const String actionKey = 'action';
const String paramsKey = 'params';
class Router {

  /// 执行页面跳转
  void push(BuildContext context, String url) {
    Map<String, dynamic> urlParseRet = _parseUrl(url);
//    Navigator.push(context, MaterialPageRoute(
//      builder: (context)=> _getPage(url, urlParseRet)
//    ));
    /// 进阶
    Navigator.pushNamedAndRemoveUntil(
        context,
        urlParseRet[actionKey].toString(),
        (route) {
          if(route.settings.name == urlParseRet[actionKey].toString()) {
            return false;
          }
          return true;
        },
      arguments: urlParseRet[paramsKey]
    );
  }

  Widget _getPage(String url, Map<String, dynamic> urlParseRet) {
    if(url.startsWith('https://') || url.startsWith('http://')) {
      return CommonWebViewPage(url: url,);
    } else if(url.startsWith(appScheme)) {
      String pathAction = urlParseRet[actionKey].toString();
      switch(pathAction) {
        case 'homepage': {
          return _buildPage(HomePageIndex());
        }
        case 'userpage': {
          if(urlParseRet[paramsKey]['user_id'].toString() == null) {
            return null;
          }
          return _buildPage(
              UserPageIndex(
                userId: urlParseRet[paramsKey]['user_id'].toString(),
              )
          );
        }
        
        default: {
          return _buildPage(HomePageIndex());
        }
      }
    }
  }
  
  /// 增加Scaffold
  Widget _buildPage(Widget widget) {
    return Scaffold(
      appBar: AppBar(title: Text('Two you'),), // 页面名字
      body: widget,
    );
  }
  
  /// 解析跳转url， 并且分析其内部参数
  Map<String, dynamic> _parseUrl(String url) {
    if(url == null || url == '') {
      return {actionKey: '/', paramsKey: null};
    }
    if(url.startsWith(appScheme)) {
      url = url.substring(9);
    }
    int placeIndex = url.indexOf('?');
    if(placeIndex < 0) {
      return {actionKey: url, paramsKey: null};
    }
    String action = url.substring(0, placeIndex);
    String paramStr = url.substring(placeIndex+1);
    if(paramStr == null) {
      return {actionKey: action, paramsKey: null};
    }
    Map params = {};
    List<String> paramsStrArr = paramStr.split('&');
    for(String singleParamsStr in paramsStrArr) {
      List<String> singleParamsArr = singleParamsStr.split('=');
      params[singleParamsArr[0]] = singleParamsArr[1];
    }
    return {actionKey: action, paramsKey: params};
  }

  /// 注册路由
  Map<String, Widget Function(BuildContext)> registerRouter() {
    return {
      'homepage': (context) => _buildPage(HomePageIndex()),
      'userpage': (context) => _buildPage(UserPageIndex())
    };
  }
}