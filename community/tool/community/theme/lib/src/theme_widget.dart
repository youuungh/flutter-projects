import 'package:core_theme/theme.dart';
import 'package:flutter/widgets.dart';
import 'package:tool_community_theme/theme.dart';

class CommunityTheme extends ICoreTheme {
  const CommunityTheme({
    required CommunityThemeData themeData,
    required super.child,
    super.key,
  }) : super(themeData: themeData);

  static CommunityThemeData of(BuildContext context) {
    return context
            .dependOnInheritedWidgetOfExactType<CommunityTheme>()!
            .themeData
        as CommunityThemeData;
  }
}
