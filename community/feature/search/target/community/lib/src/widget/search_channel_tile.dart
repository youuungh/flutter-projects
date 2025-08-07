import 'package:search_domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:tool_community_component/component.dart';

class SearchChannelTile extends CommunityChannelTile {
  const SearchChannelTile({
    required super.imageUrl,
    required super.name,
    required super.onTap,
    super.key,
    super.followCount,
    super.onDelete,
  });

  factory SearchChannelTile.item(
    Channel channel, {
    required VoidCallback onTap,
    VoidCallback? onDelete,
  }) {
    return SearchChannelTile(
      imageUrl: channel.imageUrl,
      name: channel.name,
      followCount: channel.followCount,
      onTap: onTap,
      onDelete: onDelete,
    );
  }
}
