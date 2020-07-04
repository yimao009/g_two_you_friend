import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:two_you_friend/model/like_num_model.dart';
import 'package:two_you_friend/styles/text_styles.dart';

class ArticleDetailLike extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final likeNum = Provider.of<LikeNumModel>(context);
    print('ArticleDetailLike build');
    return Column(
      children: <Widget>[
        FlatButton(
          child: ThumbUpIcon(),
          onPressed: () => likeNum.changeLikeNum(),
        ),
        Text(
          '${likeNum.value}',
          style: TextStyles.commonStyle(),
        )
      ],
    );
  }
}

class ThumbUpIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('ThumbUpIcon build');
    return Icon(Icons.thumb_up, color: Colors.grey, size: 40,);
  }
}

