import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CoreShimmer extends StatelessWidget {
  const CoreShimmer({
    required this.child,
    required this.baseColor,
    required this.highlightColor,
    this.enabled = true,
    super.key,
  });

  final Widget child;
  final Color baseColor;
  final Color highlightColor;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      enabled: enabled,
      child: child,
    );
  }
}
