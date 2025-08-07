import 'dart:ui';

import 'package:notification_domain/domain.dart';
import 'package:tool_community_component/component.dart';
import 'package:tool_community_theme/gen/gen.dart';

class NotificationTile extends CommunityNotificationTile {
  const NotificationTile({
    required super.title,
    required super.content,
    required super.createdAt,
    required super.onTap,
    super.key,
    super.leading,
  });

  factory NotificationTile.item(
    CommunityNotification notification, {
    required VoidCallback onTap,
  }) {
    return NotificationTile(
      leading: switch (notification.type) {
        NotificationType.alarm => CommunityIcon.flagCircle(
          color: ColorName.mainRed,
        ),
        NotificationType.notice => CommunityIcon.circleNotifications(
          color: ColorName.mainRed,
        ),
        _ => CommunityIcon.circleNotifications(
          color: ColorName.mainRed,
        ),
      },
      title: notification.title,
      content: notification.content,
      createdAt: notification.createdAt,
      onTap: onTap,
    );
  }
}
