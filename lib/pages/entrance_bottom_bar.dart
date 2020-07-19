import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:two_you_friend/pages/search_page/custom_delegate.dart';
import 'package:two_you_friend/router.dart';
import 'package:two_you_friend/widgets/menu/draw.dart';
import 'package:uni_links/uni_links.dart';

/// eum 类型
enum UniLinksType {
  /// string link
  String,
}

class Entrance extends StatefulWidget {
  /// 页面索引位置
  final int indexValue;

  /// 构造函数
  const Entrance({Key key, this.indexValue}) : super(key: key);
  @override
  _EntranceState createState() => _EntranceState();
}
/// entrance 状态类
///
/// 入口文件
class _EntranceState extends State<Entrance> {
  int _indexNum = 0;

  UniLinksType _type = UniLinksType.String;
  StreamSubscription _sub;
  Router router = Router();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //  scheme初始化，保证有上下文，需要跳转页面
    initPlatformState();
    if(widget.indexValue != null) {
      _indexNum = widget.indexValue;
    }
  }

  ///  初始化Scheme只使用了String类型的路由跳转
  ///  所以只有一个有需求可以使用[initPlatformStateForUriUniLinks]
  Future<void> initPlatformState() async {
    if(_type ==UniLinksType.String) {
      await initPlatformstateForStringUniLinks();
    }
  }

  /// 使用[String]链接实现
  Future<void> initPlatformstateForStringUniLinks() async {
    String initiaLink;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      initiaLink = await getInitialLink();
      redirect(initiaLink);
    } on PlatformException {
      initiaLink = 'Faild to get initial link.';
    } on FormatException {
      initiaLink = 'Faild to parse the initial link as Uri.';
    }

    // Attach a listener to the links stream
    _sub = getLinksStream().listen((String link) {
      if(!mounted || link == null) return;
      redirect(link);
    }, onError: (Object err) {
      if(!mounted) return;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    if(_sub != null) _sub.cancel();
  }

  /// 跳转页面
  void redirect(String link) {
    if(link == null) {
      return;
    }
    int indexNum = router.open(context, link);
    if(indexNum > -1 && _indexNum != indexNum) {
      setState(() {
        _indexNum = indexNum;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Two You'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: SearchPageCustomDelegate());
            },
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          _getPagesWidget(0),
          _getPagesWidget(1),
          _getPagesWidget(2)
        ],
      ),
      drawer: MenuDraw(redirect),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text('推荐'),
            activeIcon: Icon(Icons.people_outline)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              title: Text('关注'),
              activeIcon: Icon(Icons.favorite_border)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('我'),
              activeIcon: Icon(Icons.person_outline)
          ),
        ],
        iconSize: 24,
        currentIndex: _indexNum,
        /// 选中后，底部BottomNavigationBar内容的颜色(选中时，默认为主题色)
        /// （仅当type: BottomNavigationBarType.fixed,时生效）
        fixedColor: Colors.red,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          ///这里根据点击的index来显示，非index的page均隐藏
          if(_indexNum != index) {
            setState(() {
              _indexNum = index;
            });
          }
        },
      ),
    );
  }

  Widget _getPagesWidget(int index) {
    List<Widget> widgetList = [
      router.getPageByRouter('homePage'),
      Icon(Icons.directions_transit),
      router.getPageByRouter('userpage')
    ];
    return Offstage(
      offstage: _indexNum != index,
      child: TickerMode(
        enabled: _indexNum == index,
        child: widgetList[index],
      ),
    );
  }
}
