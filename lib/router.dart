import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:two_you_friend/pages/common/web_view_page.dart';
import 'package:two_you_friend/pages/home_page/index.dart';
import 'package:two_you_friend/pages/user_page/index.dart';
import 'package:two_you_friend/util/struct/router_struct.dart';

/// app 协议头 tyfapp://userPageIndex?userId=1001
const String appScheme = "tyfapp://";
const String actionKey = 'action';
const String paramsKey = 'params';
/// 路由配置信息
/// entranceIndex 为首页位置， 如果非首页为-1
/// params 为组件需要对参数数组
const Map<String, RouterStruct> routerMapping = {
  'homepage' : RouterStruct(HomePageIndex(), 0, null),
  'userpage' : RouterStruct(UserPageIndex(), 2, ['userId']),
  'default' : RouterStruct(HomePageIndex(), 0, null)
};

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
      body: Center(
        child: widget,
      ),
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
  /// 执行页面跳转
  ///
  /// 需要特别注意以下逻辑
  /// -1 不在首页，则执行跳转
  /// 大于 -1 则为首页，需要在首页进行 tab 切换，而不是进行跳转
  int open(BuildContext context, String url) {
    /// 非Entrance入口标示
    int notEntrancePageIndex = -1;
    if(url.startsWith('https') || url.startsWith('http')) {
      /// 打开网页
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return CommonWebViewPage(url: url,);
      }));
      return notEntrancePageIndex;
    }
    Map<String, dynamic> urlParsRet = _parseUrl(url);
    int entranceIndex = routerMapping[urlParsRet[actionKey]].entranceIndex;
    if(entranceIndex > notEntrancePageIndex) {
      // 判断为首页，返回切换的tab信息
      return entranceIndex;
    }
    Navigator.pushNamedAndRemoveUntil(
        context,
        urlParsRet[actionKey].toString(), (route) {
          if(route.settings.name == urlParsRet[actionKey].toString()) {
            return false;
          }
          return true;
        },
      arguments: urlParsRet[paramsKey]
    );
    // 执行跳转，非首页
    return notEntrancePageIndex;
  }

  /// 注册路由事件
  Map<String, Widget Function(BuildContext)> registerRouter() {
    Map<String, Widget Function(BuildContext)> routerInfo = {};
    routerMapping.forEach((routerName, routerData) {
      if(routerName.toString() == 'default') {
        return;
      }
      routerInfo[routerName.toString()] =
          (context) => _buildPage(routerData.widget);
    });
    return {
      'homepage': (context) => _buildPage(HomePageIndex()),
      'userpage': (context) => _buildPage(UserPageIndex())
    };
  }

  /// 根据页面路由偶， 获取页面信息
  Widget getPageByRouter(String pageName) {
    Widget pageWidget;
    if(routerMapping[pageName] != null) {
      pageWidget = routerMapping[pageName].widget;
    } else {
      pageWidget = routerMapping['default'].widget;
    }
    return pageWidget;
  }
}