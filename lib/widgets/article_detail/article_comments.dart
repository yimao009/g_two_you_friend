import 'package:flutter/material.dart';
import 'package:two_you_friend/styles/text_styles.dart';
import 'package:two_you_friend/util/struct/comment_info_struct.dart';
/// 具体的评论内容信息
///
/// [commentList]为帖子的评论列表
class ArticleComments extends StatelessWidget {
  /// 传入的用户信息
  final List<CommentInfoStruct> commentList;

  /// 构造函数
  const ArticleComments({Key key, this.commentList}) : super(key: key);

  /// 获取单行的评论展示信息
  ///
  /// 包括展示评论内容，以及评论者头像和昵称
  Widget getOneItemSection(CommentInfoStruct commentItem) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6.0),
            child: Image.network(
              commentItem.userInfo.headerImage,
              width: 50.0,
              height: 50.0,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                commentItem.userInfo.nickname,
                style: TextStyles.commonStyle(),
              ),
              Text(
                commentItem.headerURL,
                style: TextStyles.commonStyle(.8),
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, position) {
          return getOneItemSection(commentList[position]);
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: .5,
            color: Color(0xFFDDDDDD),
          );
        },
        itemCount: commentList.length
    );
  }
}
