import 'package:flutter/material.dart';
import 'package:two_you_friend/util/struct/article_summary_struct.dart';
import 'package:two_you_friend/util/struct/user_info_struct.dart';
import 'package:two_you_friend/widgets/common/banner_info.dart';
import 'package:two_you_friend/widgets/home_page/article_card.dart';

/// 首页列表信息
///
/// 展示banner和帖子信息
class HomeNewPage extends StatelessWidget {
  /// banner 地址信息
  final String bannerImage =
      'https://img.089t.com/content/20200227/osbbw9upeelfqnxnwt0glcht.jpg';

  /// 帖子标题
  final UserInfoStruct userInfo = UserInfoStruct('flutter',
      'https://img.089t.com/content/20200227/osbbw9upeelfqnxnwt0glcht.jpg');

  /// 帖子概要描述信息
  final ArticleSummaryStruct articleInfo = ArticleSummaryStruct(
      '你好，教个朋友',
      '我是一个小可爱',
      'https://img.089t.com/content/20200227/osbbw9upeelfqnxnwt0glcht.jpg',
      20,
      30);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          BannerInfo(
            bannerImage: bannerImage,
          ),
          ArticleCard(
            userInfo: userInfo,
            articleInfo: articleInfo,
          )
        ],
      ),
    );
  }
}
