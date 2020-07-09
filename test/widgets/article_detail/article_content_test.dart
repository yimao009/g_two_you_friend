import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:two_you_friend/widgets/article_detail/article_content.dart';

void main() {
  testWidgets('test article content', (WidgetTester tester) async {
    final Widget testWidgets = ArticleContent(content: 'test content',);
    /// pumpWidget 方法会建立并渲染我们提供的 widget。
    await tester.pumpWidget(
        MaterialApp(
          home: testWidgets,
        ),
    );
    expect(find.text('test content'), findsOneWidget);
    expect(find.byWidget(testWidgets), findsOneWidget);
  });
}