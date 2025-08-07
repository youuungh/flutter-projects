import 'package:search_domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:tool_community_component/component.dart';
import 'package:tool_community_theme/theme.dart';

class SearchPostCard extends CommunityPostCard {
  SearchPostCard({
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

  factory SearchPostCard.item(
    Post post, {
    required VoidCallback onChannelTapped,
    required VoidCallback onCompanyTapped,
    required VoidCallback onLikeTapped,
    required VoidCallback onCommentTapped,
    required VoidCallback onViewTapped,
    required VoidCallback onTap,
  }) {
    return SearchPostCard(
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

class SearchPostCardListView extends StatelessWidget {
  const SearchPostCardListView({
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
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final Post item = items[index];
        final Widget child = SearchPostCard.item(
          item,
          onChannelTapped: () => onChannelTapped.call(item),
          onCompanyTapped: () => onCompanyTapped.call(item),
          onLikeTapped: () => onLikeTapped.call(item),
          onCommentTapped: () => onCommentTapped.call(item),
          onViewTapped: () => onViewTapped.call(item),
          onTap: () => onTap.call(item),
        );
        if (isLoadMore) {
          if (index == items.length - 1) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                child,
                SizedBox(
                  width: double.infinity,
                  height: 60.0,
                  child: Center(
                    child: CommunityIcon.restartAlt(
                      size: 44.0,
                      color: context.colorScheme.gray600,
                    ),
                  ),
                ),
              ],
            );
          }
        }
        return child;
      },
      separatorBuilder: (context, index) => CommunityDivider.horizontal(),
    );
  }
}
