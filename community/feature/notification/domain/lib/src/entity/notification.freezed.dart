// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CommunityNotification _$CommunityNotificationFromJson(
  Map<String, dynamic> json,
) {
  return _CommunityNotification.fromJson(json);
}

/// @nodoc
mixin _$CommunityNotification {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get route => throw _privateConstructorUsedError;
  @JsonKey(fromJson: millisToDateTimeDefaultToday)
  DateTime get createdAt => throw _privateConstructorUsedError;
  NotificationType get type => throw _privateConstructorUsedError;

  /// Serializes this CommunityNotification to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommunityNotification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommunityNotificationCopyWith<CommunityNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommunityNotificationCopyWith<$Res> {
  factory $CommunityNotificationCopyWith(
    CommunityNotification value,
    $Res Function(CommunityNotification) then,
  ) = _$CommunityNotificationCopyWithImpl<$Res, CommunityNotification>;
  @useResult
  $Res call({
    String id,
    String title,
    String content,
    String route,
    @JsonKey(fromJson: millisToDateTimeDefaultToday) DateTime createdAt,
    NotificationType type,
  });
}

/// @nodoc
class _$CommunityNotificationCopyWithImpl<
  $Res,
  $Val extends CommunityNotification
>
    implements $CommunityNotificationCopyWith<$Res> {
  _$CommunityNotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommunityNotification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? route = null,
    Object? createdAt = null,
    Object? type = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
            route: null == route
                ? _value.route
                : route // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as NotificationType,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CommunityNotificationImplCopyWith<$Res>
    implements $CommunityNotificationCopyWith<$Res> {
  factory _$$CommunityNotificationImplCopyWith(
    _$CommunityNotificationImpl value,
    $Res Function(_$CommunityNotificationImpl) then,
  ) = __$$CommunityNotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String content,
    String route,
    @JsonKey(fromJson: millisToDateTimeDefaultToday) DateTime createdAt,
    NotificationType type,
  });
}

/// @nodoc
class __$$CommunityNotificationImplCopyWithImpl<$Res>
    extends
        _$CommunityNotificationCopyWithImpl<$Res, _$CommunityNotificationImpl>
    implements _$$CommunityNotificationImplCopyWith<$Res> {
  __$$CommunityNotificationImplCopyWithImpl(
    _$CommunityNotificationImpl _value,
    $Res Function(_$CommunityNotificationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CommunityNotification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? route = null,
    Object? createdAt = null,
    Object? type = null,
  }) {
    return _then(
      _$CommunityNotificationImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        route: null == route
            ? _value.route
            : route // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as NotificationType,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CommunityNotificationImpl implements _CommunityNotification {
  const _$CommunityNotificationImpl({
    this.id = '',
    this.title = '',
    this.content = '',
    this.route = '',
    @JsonKey(fromJson: millisToDateTimeDefaultToday) required this.createdAt,
    this.type = NotificationType.unknown,
  });

  factory _$CommunityNotificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommunityNotificationImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String content;
  @override
  @JsonKey()
  final String route;
  @override
  @JsonKey(fromJson: millisToDateTimeDefaultToday)
  final DateTime createdAt;
  @override
  @JsonKey()
  final NotificationType type;

  @override
  String toString() {
    return 'CommunityNotification(id: $id, title: $title, content: $content, route: $route, createdAt: $createdAt, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommunityNotificationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.route, route) || other.route == route) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, content, route, createdAt, type);

  /// Create a copy of CommunityNotification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommunityNotificationImplCopyWith<_$CommunityNotificationImpl>
  get copyWith =>
      __$$CommunityNotificationImplCopyWithImpl<_$CommunityNotificationImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CommunityNotificationImplToJson(this);
  }
}

abstract class _CommunityNotification implements CommunityNotification {
  const factory _CommunityNotification({
    final String id,
    final String title,
    final String content,
    final String route,
    @JsonKey(fromJson: millisToDateTimeDefaultToday)
    required final DateTime createdAt,
    final NotificationType type,
  }) = _$CommunityNotificationImpl;

  factory _CommunityNotification.fromJson(Map<String, dynamic> json) =
      _$CommunityNotificationImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get content;
  @override
  String get route;
  @override
  @JsonKey(fromJson: millisToDateTimeDefaultToday)
  DateTime get createdAt;
  @override
  NotificationType get type;

  /// Create a copy of CommunityNotification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommunityNotificationImplCopyWith<_$CommunityNotificationImpl>
  get copyWith => throw _privateConstructorUsedError;
}
