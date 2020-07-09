
import 'package:flutter_test/flutter_test.dart';
import 'package:two_you_friend/model/like_num_model.dart';

void main() {
  final LikeNumModel likeNumModel = LikeNumModel();

  test('test like model value', (){
    expect(likeNumModel.value, 0);
  });

  test('test like model method', (){
    likeNumModel.changeLikeNum();
    expect(likeNumModel.value, 1);

    likeNumModel.changeLikeNum();
    expect(likeNumModel.value, 2);
  });

}