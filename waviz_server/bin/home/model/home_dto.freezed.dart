// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeDto {

 String? get status; int? get totalCount; List<HomeItemModel>? get projects;
/// Create a copy of HomeDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeDtoCopyWith<HomeDto> get copyWith => _$HomeDtoCopyWithImpl<HomeDto>(this as HomeDto, _$identity);

  /// Serializes this HomeDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeDto&&(identical(other.status, status) || other.status == status)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&const DeepCollectionEquality().equals(other.projects, projects));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,totalCount,const DeepCollectionEquality().hash(projects));

@override
String toString() {
  return 'HomeDto(status: $status, totalCount: $totalCount, projects: $projects)';
}


}

/// @nodoc
abstract mixin class $HomeDtoCopyWith<$Res>  {
  factory $HomeDtoCopyWith(HomeDto value, $Res Function(HomeDto) _then) = _$HomeDtoCopyWithImpl;
@useResult
$Res call({
 String? status, int? totalCount, List<HomeItemModel>? projects
});




}
/// @nodoc
class _$HomeDtoCopyWithImpl<$Res>
    implements $HomeDtoCopyWith<$Res> {
  _$HomeDtoCopyWithImpl(this._self, this._then);

  final HomeDto _self;
  final $Res Function(HomeDto) _then;

/// Create a copy of HomeDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? totalCount = freezed,Object? projects = freezed,}) {
  return _then(_self.copyWith(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,totalCount: freezed == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int?,projects: freezed == projects ? _self.projects : projects // ignore: cast_nullable_to_non_nullable
as List<HomeItemModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeDto].
extension HomeDtoPatterns on HomeDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeDto value)  $default,){
final _that = this;
switch (_that) {
case _HomeDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeDto value)?  $default,){
final _that = this;
switch (_that) {
case _HomeDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? status,  int? totalCount,  List<HomeItemModel>? projects)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeDto() when $default != null:
return $default(_that.status,_that.totalCount,_that.projects);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? status,  int? totalCount,  List<HomeItemModel>? projects)  $default,) {final _that = this;
switch (_that) {
case _HomeDto():
return $default(_that.status,_that.totalCount,_that.projects);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? status,  int? totalCount,  List<HomeItemModel>? projects)?  $default,) {final _that = this;
switch (_that) {
case _HomeDto() when $default != null:
return $default(_that.status,_that.totalCount,_that.projects);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _HomeDto implements HomeDto {
  const _HomeDto({this.status, this.totalCount, final  List<HomeItemModel>? projects = const []}): _projects = projects;
  factory _HomeDto.fromJson(Map<String, dynamic> json) => _$HomeDtoFromJson(json);

@override final  String? status;
@override final  int? totalCount;
 final  List<HomeItemModel>? _projects;
@override@JsonKey() List<HomeItemModel>? get projects {
  final value = _projects;
  if (value == null) return null;
  if (_projects is EqualUnmodifiableListView) return _projects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of HomeDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeDtoCopyWith<_HomeDto> get copyWith => __$HomeDtoCopyWithImpl<_HomeDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeDto&&(identical(other.status, status) || other.status == status)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&const DeepCollectionEquality().equals(other._projects, _projects));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,totalCount,const DeepCollectionEquality().hash(_projects));

@override
String toString() {
  return 'HomeDto(status: $status, totalCount: $totalCount, projects: $projects)';
}


}

/// @nodoc
abstract mixin class _$HomeDtoCopyWith<$Res> implements $HomeDtoCopyWith<$Res> {
  factory _$HomeDtoCopyWith(_HomeDto value, $Res Function(_HomeDto) _then) = __$HomeDtoCopyWithImpl;
@override @useResult
$Res call({
 String? status, int? totalCount, List<HomeItemModel>? projects
});




}
/// @nodoc
class __$HomeDtoCopyWithImpl<$Res>
    implements _$HomeDtoCopyWith<$Res> {
  __$HomeDtoCopyWithImpl(this._self, this._then);

  final _HomeDto _self;
  final $Res Function(_HomeDto) _then;

/// Create a copy of HomeDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? totalCount = freezed,Object? projects = freezed,}) {
  return _then(_HomeDto(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,totalCount: freezed == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int?,projects: freezed == projects ? _self._projects : projects // ignore: cast_nullable_to_non_nullable
as List<HomeItemModel>?,
  ));
}


}

// dart format on
