
import 'package:flutter/material.dart';

class SearchPageCustomDelegate extends SearchDelegate{
  /// 修改提示框内容
  String get searchFieldLabel => '用户、帖子';
  TextInputType get keyboardType => TextInputType.url;

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        tooltip: 'Clear',
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      tooltip: 'Back',
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }
  /// 搜索结果显示列表
  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return ListView();
  }

  /// 搜索提示列表
  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return ListView();
  }

//  @override
//  ThemeData appBarTheme(BuildContext context) {
//    // TODO: implement appBarTheme
//    final ThemeData theme = Theme.of(context);
//    return theme.copyWith(
//      inputDecorationTheme: InputDecorationTheme(),
//      primaryColor: theme.primaryColor,
//      primaryIconTheme: theme.primaryIconTheme,
//      primaryColorBrightness: theme.primaryColorBrightness,
//      primaryTextTheme: theme.primaryTextTheme
//    );
//  }
}