import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:two_you_friend/router.dart';
import 'package:uni_links/uni_links.dart';
/// eum 类型
enum UniLinksType {
  /// string link
  string,
}

class Entrance extends StatefulWidget {
  @override
  _EntranceState createState() => _EntranceState();
}

class _EntranceState extends State<Entrance> {
  UniLinksType _type = UniLinksType.string;
  StreamSubscription _sub;
  Router router = Router();
  /// 使用[String]链接实现
  Future<void> initPlatformStateForStringUniLinks() async {
    String initialLink;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      initialLink = await getInitialLink();
      if(initialLink != null) {
        //  跳转到指定页面 外部直接拉起 APP 的业务逻辑
        router.push(context, initialLink);
      }
    } on PlatformException {
      initialLink = 'Failed to get initial link.';
    } on FormatException {
      initialLink = 'Failed to parse the initial link as Uri.';
    }
    // Attach a listener to the links stream
    /// 表示当前 APP 处于打开状态，监听外部拉起事件，监听变化后处理相应的跳转逻辑
    _sub = getLinksStream().listen((String link) {
      if(!mounted || link == null) return;
      //  跳转到指定页面
      router.push(context, link);
    }, onError: (Object err) {
      if(!mounted) return;
    });
  }

  Future<void> initPlatformState() async {
    if(_type == UniLinksType.string) {
      await initPlatformStateForStringUniLinks();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlatformState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    if(_sub != null) _sub.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Text('Hello Flutter scaffold'),
          )
        ],
      ),
    );
  }
}

