import 'package:flutter/widgets.dart';

import 'theme_data.dart';

abstract class ICoreTheme extends InheritedWidget {
  const ICoreTheme({
    required this.themeData,
    required super.child,
    super.key,
  });

  final ICoreThemeData themeData;

  @override
  bool updateShouldNotify(covariant ICoreTheme oldWidget) {
    return themeData != oldWidget.themeData;
  }
}
