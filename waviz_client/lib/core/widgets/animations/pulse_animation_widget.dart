import 'package:flutter/material.dart';
import 'package:waviz_client/theme.dart';

/// 펄스 애니메이션 위젯
class PulseAnimationWidget extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final double minOpacity;
  final double maxOpacity;

  const PulseAnimationWidget({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 1500),
    this.minOpacity = 0.3,
    this.maxOpacity = 1.0,
  });

  @override
  State<PulseAnimationWidget> createState() => _PulseAnimationWidgetState();
}

class _PulseAnimationWidgetState extends State<PulseAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _animation = Tween<double>(
      begin: widget.minOpacity,
      end: widget.maxOpacity,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Opacity(
          opacity: _animation.value,
          child: widget.child,
        );
      },
    );
  }
}

/// 로딩용 스켈레톤 위젯
class SkeletonWidget extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius? borderRadius;

  const SkeletonWidget({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return PulseAnimationWidget(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.wavizGray[200],
          borderRadius: borderRadius ?? BorderRadius.circular(4),
        ),
      ),
    );
  }
}

/// 프로젝트 카드 스켈레톤
class ProjectCardSkeleton extends StatelessWidget {
  const ProjectCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.wavizGray[100]!, width: 1),
      ),
      child: Row(
        children: [
          const SkeletonWidget(
            width: 140,
            height: 100,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SkeletonWidget(width: double.infinity, height: 16),
                const SizedBox(height: 8),
                const SkeletonWidget(width: 100, height: 12),
                const SizedBox(height: 8),
                const SkeletonWidget(width: 80, height: 14),
                const SizedBox(height: 8),
                SkeletonWidget(
                  width: 60,
                  height: 20,
                  borderRadius: BorderRadius.circular(4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// 카테고리 탭 스켈레톤
class CategoryTabSkeleton extends StatelessWidget {
  const CategoryTabSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Row(
        children: List.generate(
          4,
          (index) => Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: index == 3 ? 0 : 12),
              child: Column(
                children: [
                  const SkeletonWidget(
                    width: 36,
                    height: 36,
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  const SizedBox(height: 8),
                  SkeletonWidget(
                    width: 50,
                    height: 12,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
