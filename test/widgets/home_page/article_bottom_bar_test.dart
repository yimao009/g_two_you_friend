
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';
import 'package:two_you_friend/widgets/home_page/article_bottom_bar.dart';

void main() {
  testWidgets('test article bottom bar ', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      final ArticleBottomBar testWidgets = ArticleBottomBar(
        headerImage: 'https://i.pinimg.com/originals/e0/64/4b/e0644bd2f13db50d0ef6a4df5a756fd9.png',
        nickName: 'test',
        commentNum: 2,
      );
      await tester.pumpWidget(
        MaterialApp(
          home: testWidgets,
        )
      );
      expect(find.text('test'), findsOneWidget);
      expect(find.text('2'), findsOneWidget);
      expect(find.byWidget(testWidgets), findsOneWidget);
    });
  });
}