import 'package:core_util/util.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.freezed.dart';

part 'notification.g.dart';

@freezed
class CommunityNotification with _$CommunityNotification {
  const factory CommunityNotification({
    @Default('') String id,
    @Default('') String title,
    @Default('') String content,
    @Default('') String route,
    @JsonKey(fromJson: millisToDateTimeDefaultToday)
    required DateTime createdAt,
    @Default(NotificationType.unknown) NotificationType type,
  }) = _CommunityNotification;

  factory CommunityNotification.fromJson(Map<String, dynamic> json) =>
      _$CommunityNotificationFromJson(json);
}

@JsonEnum()
enum NotificationType {
  @JsonValue('ALARM')
  alarm,
  @JsonValue('NOTICE')
  notice,
  unknown,
}
