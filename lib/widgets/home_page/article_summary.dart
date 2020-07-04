import 'package:flutter/material.dart';
import 'package:two_you_friend/styles/text_styles.dart';

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
  /// 左侧的标题和标题描述组件
  Widget getLeftInfo() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyles.commonStyle(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Padding(padding: EdgeInsets.only(top: 8),),
          Text(
            summary,
            style: TextStyles.commonStyle(0.8),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('ArticleSummary build');
    return Row(
//      mainAxisAlignment: MainAxisAlignment.spac,
      children: <Widget>[
        Expanded(
          flex: 6,
          child: getLeftInfo(),
        ),
        Expanded(
          flex: 2,
          child: Image.network(
            articleImage,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }
}
