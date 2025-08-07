import 'package:community_domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:tool_community_component/component.dart';

class _CommunityChannelChip extends CommunityChannelChip {
  const _CommunityChannelChip({
    required super.imageUrl,
    required super.name,
    required super.onTap,
  });

  factory _CommunityChannelChip.item(
    Channel channel, {
    required VoidCallback onTap,
  }) {
    return _CommunityChannelChip(
      imageUrl: channel.imageUrl,
      name: channel.name,
      onTap: onTap,
    );
  }
}

class CommunityLoadingChannelListView extends StatelessWidget {
  const CommunityLoadingChannelListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      itemCount: 10,
      itemBuilder: (context, index) => const CommunityLoadingChannelChip(),
      separatorBuilder: (context, index) => const SizedBox(
        width: 6.0,
      ),
    );
  }
}

class CommunityChannelListView extends StatelessWidget {
  const CommunityChannelListView({
    required this.items,
    required this.onTap,
    super.key,
  });

  final List<Channel> items;
  final void Function(Channel) onTap;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) => _CommunityChannelChip.item(
        items[index],
        onTap: () => onTap.call(items[index]),
      ),
      separatorBuilder: (context, index) => const SizedBox(
        width: 6.0,
      ),
    );
  }
}
