import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

/// 通用逻辑跳转
class CommonWebViewPage extends StatelessWidget {
  /// url 地址
  final String url;
  /// 构造函数
  CommonWebViewPage({Key key, this.url}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: url,
      appBar: AppBar(
        title: Text('web page'),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
