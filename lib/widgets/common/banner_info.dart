import 'package:flutter/material.dart';

/// banner 展示组件
///
/// 只需要传入需要展示的[bannerImage]
class BannerInfo extends StatelessWidget {
  /// 帖子标题
  final String bannerImage;

  /// 构造函数
  const BannerInfo({Key key, this.bannerImage}) : super(key: key);

  /// 返回无状态组件
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Image.network(
          bannerImage,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        )
      ],
    );
  }
}
