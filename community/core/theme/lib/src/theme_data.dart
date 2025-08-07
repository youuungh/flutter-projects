import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class ICoreThemeData {
  const ICoreThemeData({
    required this.textTheme,
    required this.colorScheme,
    required this.appBarTheme,
    required this.navigationBarThemeData,
    required this.dialogTheme,
    required this.dividerTheme,
  });

  final ICoreTextTheme textTheme;
  final ICoreColorScheme colorScheme;
  final ICoreAppBarTheme appBarTheme;
  final ICoreNavigationBarThemeData navigationBarThemeData;
  final ICoreDialogTheme dialogTheme;
  final ICoreDividerTheme dividerTheme;
}

abstract class ICoreTextTheme {
  const ICoreTextTheme();
}

abstract class ICoreColorScheme {
  const ICoreColorScheme({required this.brightness});

  final Brightness brightness;
}

abstract class ICoreAppBarTheme {
  const ICoreAppBarTheme({
    required this.systemOverlayStyle,
    required this.primaryColor,
    required this.backgroundColor,
    required this.toolbarHeight,
    required this.titleSpacing,
    required this.centerTitle,
  });

  final SystemUiOverlayStyle systemOverlayStyle;
  final Color primaryColor;
  final Color backgroundColor;
  final double toolbarHeight;
  final double titleSpacing;
  final bool centerTitle;
}

abstract class ICoreNavigationBarThemeData {
  const ICoreNavigationBarThemeData({
    required this.backgroundColor,
    required this.height,
  });

  final Color backgroundColor;
  final double height;
}

abstract class ICoreDialogTheme {
  const ICoreDialogTheme({
    required this.titleTextStyle,
    required this.backgroundColor,
    required this.confirmTextStyle,
    required this.confirmBackgroundColor,
    required this.cancelTextStyle,
    required this.cancelBackgroundColor,
  });

  final TextStyle titleTextStyle;
  final Color backgroundColor;
  final TextStyle confirmTextStyle;
  final Color confirmBackgroundColor;
  final TextStyle cancelTextStyle;
  final Color cancelBackgroundColor;
}

abstract class ICoreDividerTheme {
  const ICoreDividerTheme({
    required this.color,
  });

  final Color color;
}
