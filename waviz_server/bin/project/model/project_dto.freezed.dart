// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProjectDto {

 List<ProjectItemModel> get data;
/// Create a copy of ProjectDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectDtoCopyWith<ProjectDto> get copyWith => _$ProjectDtoCopyWithImpl<ProjectDto>(this as ProjectDto, _$identity);

  /// Serializes this ProjectDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectDto&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'ProjectDto(data: $data)';
}


}

/// @nodoc
abstract mixin class $ProjectDtoCopyWith<$Res>  {
  factory $ProjectDtoCopyWith(ProjectDto value, $Res Function(ProjectDto) _then) = _$ProjectDtoCopyWithImpl;
@useResult
$Res call({
 List<ProjectItemModel> data
});




}
/// @nodoc
class _$ProjectDtoCopyWithImpl<$Res>
    implements $ProjectDtoCopyWith<$Res> {
  _$ProjectDtoCopyWithImpl(this._self, this._then);

  final ProjectDto _self;
  final $Res Function(ProjectDto) _then;

/// Create a copy of ProjectDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<ProjectItemModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProjectDto].
extension ProjectDtoPatterns on ProjectDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectDto value)  $default,){
final _that = this;
switch (_that) {
case _ProjectDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectDto value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ProjectItemModel> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectDto() when $default != null:
return $default(_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ProjectItemModel> data)  $default,) {final _that = this;
switch (_that) {
case _ProjectDto():
return $default(_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ProjectItemModel> data)?  $default,) {final _that = this;
switch (_that) {
case _ProjectDto() when $default != null:
return $default(_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProjectDto implements ProjectDto {
  const _ProjectDto({final  List<ProjectItemModel> data = const []}): _data = data;
  factory _ProjectDto.fromJson(Map<String, dynamic> json) => _$ProjectDtoFromJson(json);

 final  List<ProjectItemModel> _data;
@override@JsonKey() List<ProjectItemModel> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of ProjectDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectDtoCopyWith<_ProjectDto> get copyWith => __$ProjectDtoCopyWithImpl<_ProjectDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjectDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectDto&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'ProjectDto(data: $data)';
}


}

/// @nodoc
abstract mixin class _$ProjectDtoCopyWith<$Res> implements $ProjectDtoCopyWith<$Res> {
  factory _$ProjectDtoCopyWith(_ProjectDto value, $Res Function(_ProjectDto) _then) = __$ProjectDtoCopyWithImpl;
@override @useResult
$Res call({
 List<ProjectItemModel> data
});




}
/// @nodoc
class __$ProjectDtoCopyWithImpl<$Res>
    implements _$ProjectDtoCopyWith<$Res> {
  __$ProjectDtoCopyWithImpl(this._self, this._then);

  final _ProjectDto _self;
  final $Res Function(_ProjectDto) _then;

/// Create a copy of ProjectDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_ProjectDto(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<ProjectItemModel>,
  ));
}


}

// dart format on
