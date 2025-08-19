// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResponseDto {

@JsonKey(name: "status") String? get status;@JsonKey(name: 'msg') String? get msg;@JsonKey(name: 'body') String? get body;
/// Create a copy of ResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResponseDtoCopyWith<ResponseDto> get copyWith => _$ResponseDtoCopyWithImpl<ResponseDto>(this as ResponseDto, _$identity);

  /// Serializes this ResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResponseDto&&(identical(other.status, status) || other.status == status)&&(identical(other.msg, msg) || other.msg == msg)&&(identical(other.body, body) || other.body == body));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,msg,body);

@override
String toString() {
  return 'ResponseDto(status: $status, msg: $msg, body: $body)';
}


}

/// @nodoc
abstract mixin class $ResponseDtoCopyWith<$Res>  {
  factory $ResponseDtoCopyWith(ResponseDto value, $Res Function(ResponseDto) _then) = _$ResponseDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "status") String? status,@JsonKey(name: 'msg') String? msg,@JsonKey(name: 'body') String? body
});




}
/// @nodoc
class _$ResponseDtoCopyWithImpl<$Res>
    implements $ResponseDtoCopyWith<$Res> {
  _$ResponseDtoCopyWithImpl(this._self, this._then);

  final ResponseDto _self;
  final $Res Function(ResponseDto) _then;

/// Create a copy of ResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? msg = freezed,Object? body = freezed,}) {
  return _then(_self.copyWith(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,msg: freezed == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String?,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ResponseDto].
extension ResponseDtoPatterns on ResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _ResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _ResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "status")  String? status, @JsonKey(name: 'msg')  String? msg, @JsonKey(name: 'body')  String? body)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResponseDto() when $default != null:
return $default(_that.status,_that.msg,_that.body);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "status")  String? status, @JsonKey(name: 'msg')  String? msg, @JsonKey(name: 'body')  String? body)  $default,) {final _that = this;
switch (_that) {
case _ResponseDto():
return $default(_that.status,_that.msg,_that.body);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "status")  String? status, @JsonKey(name: 'msg')  String? msg, @JsonKey(name: 'body')  String? body)?  $default,) {final _that = this;
switch (_that) {
case _ResponseDto() when $default != null:
return $default(_that.status,_that.msg,_that.body);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResponseDto implements ResponseDto {
  const _ResponseDto({@JsonKey(name: "status") this.status, @JsonKey(name: 'msg') this.msg, @JsonKey(name: 'body') this.body});
  factory _ResponseDto.fromJson(Map<String, dynamic> json) => _$ResponseDtoFromJson(json);

@override@JsonKey(name: "status") final  String? status;
@override@JsonKey(name: 'msg') final  String? msg;
@override@JsonKey(name: 'body') final  String? body;

/// Create a copy of ResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResponseDtoCopyWith<_ResponseDto> get copyWith => __$ResponseDtoCopyWithImpl<_ResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResponseDto&&(identical(other.status, status) || other.status == status)&&(identical(other.msg, msg) || other.msg == msg)&&(identical(other.body, body) || other.body == body));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,msg,body);

@override
String toString() {
  return 'ResponseDto(status: $status, msg: $msg, body: $body)';
}


}

/// @nodoc
abstract mixin class _$ResponseDtoCopyWith<$Res> implements $ResponseDtoCopyWith<$Res> {
  factory _$ResponseDtoCopyWith(_ResponseDto value, $Res Function(_ResponseDto) _then) = __$ResponseDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "status") String? status,@JsonKey(name: 'msg') String? msg,@JsonKey(name: 'body') String? body
});




}
/// @nodoc
class __$ResponseDtoCopyWithImpl<$Res>
    implements _$ResponseDtoCopyWith<$Res> {
  __$ResponseDtoCopyWithImpl(this._self, this._then);

  final _ResponseDto _self;
  final $Res Function(_ResponseDto) _then;

/// Create a copy of ResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? msg = freezed,Object? body = freezed,}) {
  return _then(_ResponseDto(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,msg: freezed == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String?,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
