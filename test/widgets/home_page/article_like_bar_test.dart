

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:two_you_friend/model/like_num_model.dart';
import 'package:two_you_friend/widgets/home_page/article_like_bar.dart';

void main() {
  final LikeNumModel likeNumModel = LikeNumModel();

  testWidgets('test article like bar', (WidgetTester tester) async {
    final ArticleLikeBar likeBar = ArticleLikeBar();
    await tester.pumpWidget(
        Provider<int>.value(
          child: ChangeNotifierProvider.value(
            value: likeNumModel,
            child: MaterialApp(
              home: likeBar,
            ),
          ),
        )
    );
    expect(find.text('0'), findsOneWidget);
    expect(find.byType(FlatButton), findsOneWidget);
    expect(find.byIcon(Icons.thumb_up), findsOneWidget);
  });

  testWidgets('test article like widget When liek action', (WidgetTester tester) async {
    final ArticleLikeBar likeBar = ArticleLikeBar();
    await tester.pumpWidget(
        Provider<int>.value(
          child: ChangeNotifierProvider.value(
            value: likeNumModel,
            child: MaterialApp(
              home: likeBar,
            ),
          ),
        )
    );
    await tester.tap(find.byType(FlatButton));
    await Future.microtask(tester.pump);
    expect(find.text('1'), findsOneWidget);
  });
}