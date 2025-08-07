import 'package:core_util/util.dart';
import 'package:flutter/material.dart';
import 'package:tool_community_component/component.dart';
import 'package:tool_community_theme/gen/gen.dart';
import 'package:tool_community_theme/theme.dart';

class CommunityChannelTile extends StatelessWidget {
  const CommunityChannelTile({
    required this.imageUrl,
    required this.name,
    required this.onTap,
    this.followCount = 0,
    this.onDelete,
    super.key,
  });

  final String imageUrl;
  final String name;
  final int followCount;
  final VoidCallback onTap;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap.call,
      behavior: HitTestBehavior.translucent,
      child: Row(
        children: [
          CommunityProfileImage(imageUrl: imageUrl, size: 46.0),
          const SizedBox(width: 14.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: context.textTheme.default15Medium.copyWith(
                    color: context.colorScheme.gray100,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8.0),
                Text(
                  '${followCount.convertToKMB()} 팔로우',
                  style: context.textTheme.default14Regular.copyWith(
                    color: context.colorScheme.gray600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          if (onDelete != null) ...[
            GestureDetector(
              onTap: () => onDelete!.call(),
              behavior: HitTestBehavior.translucent,
              child: SizedBox(
                width: 46.0,
                height: 46.0,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: CommunityIcon.close(
                    color: context.colorScheme.gray600,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class CommunityProfileTile extends StatelessWidget {
  const CommunityProfileTile({
    required this.imageUrl,
    required this.channel,
    required this.company,
    required this.createdAt,
    required this.onChannelTapped,
    required this.onCompanyTapped,
    super.key,
  });

  final String imageUrl;
  final String channel;
  final String company;
  final DateTime createdAt;
  final VoidCallback onChannelTapped;
  final VoidCallback onCompanyTapped;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onChannelTapped.call,
          behavior: HitTestBehavior.translucent,
          child: CommunityProfileImage(imageUrl: imageUrl),
        ),
        const SizedBox(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Flexible(
                    child: GestureDetector(
                      onTap: onChannelTapped.call,
                      behavior: HitTestBehavior.translucent,
                      child: Text(
                        channel,
                        style: context.textTheme.default15Medium.copyWith(
                          color: context.colorScheme.gray100,
                          letterSpacing: 0.01,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  const SizedBox(width: 7.0),
                  Text(
                    createdAt.toTimeAgo(),
                    style: context.textTheme.default13Light.copyWith(
                      color: context.colorScheme.gray500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6.0),
              if (company.trim().isNotEmpty)
                GestureDetector(
                  onTap: onCompanyTapped.call,
                  behavior: HitTestBehavior.translucent,
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
                      style: context.textTheme.default12Regular.copyWith(
                        color: ColorName.blue,
                        height: 1.0,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class CommunityNotificationTile extends StatelessWidget {
  const CommunityNotificationTile({
    required this.title,
    required this.content,
    required this.createdAt,
    required this.onTap,
    this.leading,
    super.key,
  });

  factory CommunityNotificationTile.icon({
    required String icon,
    required Color iconColor,
    required String title,
    required String content,
    required DateTime createdAt,
    required VoidCallback onTap,
  }) {
    return CommunityNotificationTile(
      leading: CommunitySvgPicture.asset(icon, color: iconColor),
      title: title,
      content: content,
      createdAt: createdAt,
      onTap: onTap,
    );
  }

  final Widget? leading;
  final String title;
  final String content;
  final DateTime createdAt;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap.call,
      behavior: HitTestBehavior.translucent,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (leading != null) ...[leading!, const SizedBox(width: 8.0)],
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: context.textTheme.default13Medium.copyWith(
                      color: context.colorScheme.gray500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    content,
                    style: context.textTheme.default15Regular.copyWith(
                      color: context.colorScheme.gray200,
                      height: 19.5 / 15.0,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    createdAt.toTimeAgo(),
                    style: context.textTheme.default13Medium.copyWith(
                      color: context.colorScheme.gray500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CommunitySettingTile extends StatelessWidget {
  const CommunitySettingTile({
    required this.onTap,
    this.leading,
    this.title = '',
    this.trailing,
    super.key,
  });

  factory CommunitySettingTile.simple(
    BuildContext context, {
    required String title,
    required VoidCallback onTap,
  }) {
    return CommunitySettingTile(
      title: title,
      trailing: CommunityIcon.chevronRight(color: context.colorScheme.gray600),
      onTap: onTap,
    );
  }

  factory CommunitySettingTile.icon(
    BuildContext context, {
    required Widget icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return CommunitySettingTile(
      leading: icon,
      title: title,
      trailing: CommunityIcon.chevronRight(color: context.colorScheme.gray500),
      onTap: onTap,
    );
  }

  final Widget? leading;
  final String title;
  final Widget? trailing;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap.call,
      behavior: HitTestBehavior.translucent,
      child: Container(
        height: 50.0,
        color: context.colorScheme.lightBlack,
        padding: const EdgeInsets.only(
          top: 13.0,
          bottom: 13.0,
          left: 20.0,
          right: 8.0,
        ),
        child: Row(
          children: [
            if (leading != null) ...[leading!, const SizedBox(width: 10.0)],
            Expanded(
              child: Text(
                title,
                style: context.textTheme.default17Regular.copyWith(
                  color: context.colorScheme.gray200,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (trailing != null) ...[const SizedBox(width: 12.0), trailing!],
          ],
        ),
      ),
    );
  }
}
