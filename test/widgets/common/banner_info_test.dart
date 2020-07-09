

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';
import 'package:two_you_friend/widgets/common/banner_info.dart';

void main() {
  testWidgets('test banner info', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      BannerInfo bannerInfo = BannerInfo(
        bannerImage: 'https://img.089t.com/content/20200227/osbbw9upeelfqnxnwt0glcht.jpg',);
      await tester.pumpWidget(
        MaterialApp(
          home: bannerInfo,  
        )
      );
      expect(find.byWidget(bannerInfo), findsOneWidget);
    });
  });
}