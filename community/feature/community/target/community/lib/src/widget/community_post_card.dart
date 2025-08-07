import 'dart:math';

import 'package:community_domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tool_community_component/component.dart';
import 'package:tool_community_theme/theme.dart';

class _CommunityPostCard extends CommunityPostCard {
  _CommunityPostCard({
    required super.imageUrl,
    required super.channel,
    required super.company,
    required super.createdAt,
    required super.title,
    required super.onChannelTapped,
    required super.onCompanyTapped,
    required super.onLikeTapped,
    required super.onCommentTapped,
    required super.onViewTapped,
    required super.onTap,
    super.key,
    super.content,
    super.thumbnailUrls,
    super.isLike,
    super.likeCount,
    super.commentCount,
    super.viewCount,
  });

  factory _CommunityPostCard.item(
    Post post, {
    required VoidCallback onChannelTapped,
    required VoidCallback onCompanyTapped,
    required VoidCallback onLikeTapped,
    required VoidCallback onCommentTapped,
    required VoidCallback onViewTapped,
    required VoidCallback onTap,
  }) {
    return _CommunityPostCard(
      imageUrl: post.imageUrl,
      channel: post.channel,
      company: post.company,
      createdAt: post.createdAt,
      title: post.title,
      content: post.content,
      thumbnailUrls: post.thumbnailUrls,
      isLike: post.isLike,
      likeCount: post.likeCount,
      commentCount: post.commentCount,
      viewCount: post.viewCount,
      onChannelTapped: onChannelTapped,
      onCompanyTapped: onCompanyTapped,
      onLikeTapped: onLikeTapped,
      onCommentTapped: onCommentTapped,
      onViewTapped: onViewTapped,
      onTap: onTap,
    );
  }
}

class CommunityLoadingPostCardListView extends StatelessWidget {
  const CommunityLoadingPostCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: 10,
      itemBuilder: (context, index) => const CommunityLoadingPostCard(),
      separatorBuilder: (context, index) => const SizedBox(
        height: 15.0,
      ),
    );
  }
}

class CommunityPostCardListView extends StatefulWidget {
  const CommunityPostCardListView({
    required this.items,
    required this.onChannelTapped,
    required this.onCompanyTapped,
    required this.onLikeTapped,
    required this.onCommentTapped,
    required this.onViewTapped,
    required this.onTap,
    super.key,
    this.isLoadMore = false,
  });

  final List<Post> items;
  final void Function(Post) onChannelTapped;
  final void Function(Post) onCompanyTapped;
  final void Function(Post) onLikeTapped;
  final void Function(Post) onCommentTapped;
  final void Function(Post) onViewTapped;
  final void Function(Post) onTap;
  final bool isLoadMore;

  @override
  State<CommunityPostCardListView> createState() => _CommunityPostCardListViewState();
}

class _CommunityPostCardListViewState extends State<CommunityPostCardListView>
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
  void didUpdateWidget(CommunityPostCardListView oldWidget) {
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
    return SliverList.separated(
      itemCount: widget.items.length,
      itemBuilder: (context, index) {
        final Post item = widget.items[index];
        final Widget child = _CommunityPostCard.item(
          item,
          onChannelTapped: () => widget.onChannelTapped.call(item),
          onCompanyTapped: () => widget.onCompanyTapped.call(item),
          onLikeTapped: () => widget.onLikeTapped.call(item),
          onCommentTapped: () => widget.onCommentTapped.call(item),
          onViewTapped: () => widget.onViewTapped.call(item),
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
      separatorBuilder: (context, index) => const SizedBox(
        height: 15.0,
      ),
    );
  }
}
