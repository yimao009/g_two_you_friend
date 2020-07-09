
import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:two_you_friend/util/struct/user_info_struct.dart';

main() {
  final UserInfoStruct userInfo = UserInfoStruct('guoruize', 'http://test.com');
  test('test userinfo', (){
    expect(userInfo.nickname == 'guoruize', true);
    expect(userInfo.headerImage, 'http://test.com');
  });
}