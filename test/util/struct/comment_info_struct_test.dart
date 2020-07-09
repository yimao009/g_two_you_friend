import 'package:flutter_test/flutter_test.dart';
import 'package:two_you_friend/util/struct/comment_info_struct.dart';
import 'package:two_you_friend/util/struct/user_info_struct.dart';

void main() {
  final UserInfoStruct userInfo = UserInfoStruct('test', 'http://test.com');

  test('test-userinfo', (){
    final CommentInfoStruct commentInfo =
    CommentInfoStruct(userInfo, 'headerURl test');

    expect(commentInfo.headerURL == 'headerURl test', true);
    expect(commentInfo.userInfo.nickname == 'test', true);
    expect(commentInfo.userInfo.headerImage, 'http://test.com');
  });
}