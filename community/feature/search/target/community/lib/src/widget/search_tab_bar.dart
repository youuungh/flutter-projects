import 'package:flutter/material.dart';
import 'package:tool_community_theme/theme.dart';

class SearchTabBar extends StatelessWidget {
  const SearchTabBar({
    required this.controller,
    required this.tabs,
    required this.onTap,
    super.key,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 20.0,
    ),
  });

  final TabController controller;
  final List<String> tabs;
  final void Function(int) onTap;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      padding: padding,
      tabAlignment: TabAlignment.fill,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: context.colorScheme.gray100,
      labelStyle: context.textTheme.default15Medium,
      labelColor: context.colorScheme.gray100,
      unselectedLabelStyle: context.textTheme.default15Medium,
      unselectedLabelColor: context.colorScheme.gray400,
      dividerColor: context.appBarTheme.backgroundColor,
      tabs: List.generate(
        tabs.length,
        (index) => Tab(text: tabs[index]),
      ),
      onTap: onTap.call,
      overlayColor: WidgetStateProperty.resolveWith<Color>(
        (_) => Colors.transparent,
      ),
    );
  }
}
