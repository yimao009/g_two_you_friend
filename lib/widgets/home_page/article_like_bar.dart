import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:two_you_friend/model/like_num_model.dart';
import 'package:two_you_friend/styles/text_styles.dart';

/// 帖子文章点赞组件
///
/// 包括点赞组件icon， 以及组件点击效果
/// 需要外部参数[likeNum]，点赞数量
class ArticleLikeBar extends StatefulWidget {
  /// 外部传入参数
  final int likeNum;

  /// 构造函数
  const ArticleLikeBar({Key key, this.likeNum});
  @override
  _ArticleLikeBarState createState() => _ArticleLikeBarState();
}

/// 帖子d文章的赞组件的状态管理类
///
/// 内部包括组件的点赞效果，点击后触发数字更新操作
/// [likeNum] 为状态组件可变数据
class _ArticleLikeBarState extends State<ArticleLikeBar> {
  /// 状态 state
  int likeNum;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    likeNum ??= widget.likeNum;
  }

  /// 点赞动作效果，点击后[likeNum]加1
  void like() {
    setState(() {
      likeNum = ++likeNum;
    });
  }

  /// 有状态类返回组件信息
  @override
  Widget build(BuildContext context) {
    print('ArticleLikeBar build');
    final likeNum = Provider.of<LikeNumModel>(context);

    return Container(
//      color: Colors.lightGreen,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: ()=> likeNum.changeLikeNum(),
            child: Row(
              children: <Widget>[
                ThumbUpIcon(),
                Padding(padding: EdgeInsets.only(left: 10),),
                Text('${likeNum.value}',style: TextStyles.commonStyle())
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ThumbUpIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('ThumbUpIcon First build');
    return Icon(Icons.thumb_up,  color: Colors.grey, size: 18,);
  }
}