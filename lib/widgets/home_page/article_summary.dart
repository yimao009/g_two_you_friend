import 'package:flutter/material.dart';

/// 帖子标题描述组件
///
/// 包括帖子的标题，帖子描述和帖子中的图片
/// 需要外部参数[title]，点赞数量
/// 需要外部参数[summary]，点赞数量
/// 需要外部参数[articleImage]，点赞数量
class ArticleSummary extends StatelessWidget {
  /// 帖子标题
  final String title;

  /// 帖子概要描述信息
  final String summary;

  /// 帖子中的图片信息
  final String articleImage;

  /// 构造函数
  const ArticleSummary({Key key, this.title, this.summary, this.articleImage})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Column(
          children: <Widget>[Text(title), Text(summary)],
        ),
        Image.network(
          articleImage,
          width: 80,
          height: 80,
          fit: BoxFit.cover,
        )
      ],
    );
  }
}
