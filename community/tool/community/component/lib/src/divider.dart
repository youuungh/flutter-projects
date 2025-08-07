import 'package:flutter/material.dart';
import 'package:tool_community_theme/theme.dart';

class CommunityDivider extends StatelessWidget {
  const CommunityDivider({
    required this.width,
    required this.height,
    this.color,
    super.key,
  });

  factory CommunityDivider.vertical({double thickness = 1.0, Color? color}) {
    return CommunityDivider(
      width: thickness,
      height: double.infinity,
      color: color,
    );
  }

  factory CommunityDivider.horizontal({double thickness = 1.0, Color? color}) {
    return CommunityDivider(
      width: double.infinity,
      height: thickness,
      color: color,
    );
  }

  final double width;
  final double height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ColoredBox(color: color ?? context.dividerTheme.color),
    );
  }
}
