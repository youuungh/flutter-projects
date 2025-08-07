import 'dart:math';

import 'package:core_util/util.dart';
import 'package:community_domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:tool_community_component/component.dart';
import 'package:tool_community_theme/gen/gen.dart';
import 'package:tool_community_theme/theme.dart';

class PostCommentTile extends StatelessWidget {
  const PostCommentTile({
    required this.name,
    required this.company,
    required this.content,
    required this.createdAt,
    required this.onTap,
    super.key,
  });

  factory PostCommentTile.item(
    Comment comment, {
    required VoidCallback onTap,
  }) {
    return PostCommentTile(
      name: comment.user.name,
      company: comment.user.company,
      content: comment.content,
      createdAt: comment.createdAt,
      onTap: onTap,
    );
  }

  final String name;
  final String company;
  final String content;
  final DateTime createdAt;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap.call,
      behavior: HitTestBehavior.translucent,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 20.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: company.trim().isNotEmpty ? '$name · ' : name,
                      style: context.textTheme.default14Regular.copyWith(
                        color: context.colorScheme.gray500,
                      ),
                    ),
                    if (company.trim().isNotEmpty)
                      WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: Transform.translate(
                          offset: Offset.zero,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                4.0,
                              ),
                              border: Border.all(
                                color: ColorName.blue,
                              ),
                            ),
                            child: Text(
                              company,
                              style: context.textTheme.default12Regular
                                  .copyWith(
                                    color: ColorName.blue,
                                    height: 1.0,
                                  ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(
                height: 14.0,
              ),
              Text(
                content,
                style: context.textTheme.default15Regular.copyWith(
                  color: context.colorScheme.gray200,
                ),
              ),
              const SizedBox(
                height: 14.0,
              ),
              Text(
                createdAt.toTimeAgo(),
                style: context.textTheme.default15Regular.copyWith(
                  color: context.colorScheme.gray400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PostCommentListView extends StatefulWidget {
  const PostCommentListView({
    required this.items,
    required this.onTap,
    super.key,
    this.isLoadMore = false,
  });

  final List<Comment> items;
  final void Function(Comment) onTap;
  final bool isLoadMore;

  @override
  State<PostCommentListView> createState() => _PostCommentListViewState();
}

class _PostCommentListViewState extends State<PostCommentListView>
    with SingleTickerProviderStateMixin {
  late AnimationController _loadMoreRotationController;

  @override
  void initState() {
    super.initState();
    _loadMoreRotationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _loadMoreRotationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(PostCommentListView oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isLoadMore != oldWidget.isLoadMore) {
      if (widget.isLoadMore) {
        _loadMoreRotationController.repeat();
      } else {
        _loadMoreRotationController.stop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: widget.items.length,
      itemBuilder: (context, index) {
        final Comment item = widget.items[index];
        final Widget child = PostCommentTile.item(
          item,
          onTap: () => widget.onTap.call(item),
        );
        if (widget.isLoadMore) {
          if (index == widget.items.length - 1) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                child,
                SizedBox(
                  width: double.infinity,
                  height: 80.0,
                  child: Center(
                    child: AnimatedBuilder(
                      animation: _loadMoreRotationController,
                      builder: (context, child) {
                        return Transform.rotate(
                          angle: _loadMoreRotationController.value * 2 * pi,
                          child: CommunityIcon.restartAlt(
                            size: 44.0,
                            color: context.colorScheme.gray600,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          }
        }
        return child;
      },
    );
  }
}
