// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommunityNotificationImpl _$$CommunityNotificationImplFromJson(
  Map<String, dynamic> json,
) => _$CommunityNotificationImpl(
  id: json['id'] as String? ?? '',
  title: json['title'] as String? ?? '',
  content: json['content'] as String? ?? '',
  route: json['route'] as String? ?? '',
  createdAt: millisToDateTimeDefaultToday((json['createdAt'] as num?)?.toInt()),
  type:
      $enumDecodeNullable(_$NotificationTypeEnumMap, json['type']) ??
      NotificationType.unknown,
);

Map<String, dynamic> _$$CommunityNotificationImplToJson(
  _$CommunityNotificationImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'content': instance.content,
  'route': instance.route,
  'createdAt': instance.createdAt.toIso8601String(),
  'type': _$NotificationTypeEnumMap[instance.type]!,
};

const _$NotificationTypeEnumMap = {
  NotificationType.alarm: 'ALARM',
  NotificationType.notice: 'NOTICE',
  NotificationType.unknown: 'unknown',
};
