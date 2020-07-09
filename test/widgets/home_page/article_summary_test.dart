
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:two_you_friend/util/struct/article_summary_struct.dart';
import 'package:image_test_utils/image_test_utils.dart';
import 'package:two_you_friend/widgets/home_page/article_summary.dart';

void main() {
  final ArticleSummaryStruct articleInfo = ArticleSummaryStruct(
    '你好，交个朋友',
    '我是一个小可爱，很长的一个测试看看效果，会换行吗',
    'https://i.pinimg.com/originals/e0/64/4b/e0644bd2f13db50d0ef6a4df5a756fd9.png',
    20,
    30
  );
  testWidgets('test article summary', (WidgetTester tester){
    provideMockedNetworkImages(() async {
      final Widget testWidgets = ArticleSummary(
        title: articleInfo.title,
        summary: articleInfo.summary,
        articleImage: articleInfo.articleImage,
      );
      await tester.pumpWidget(
        new MaterialApp(
         home: testWidgets,
        )
      );
      expect(find.text('你好，交个朋友'), findsOneWidget);
      expect(find.text('我是一个小可爱，很长的一个测试看看效果，会换行吗'), findsOneWidget);

      expect(find.byWidget(testWidgets), findsOneWidget);
    });
  });
}