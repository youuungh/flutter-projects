// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MyPageState {

 bool? get loginState; LoginEntity? get loginEntity; List<ProjectEntity> get userProjects; bool get isLoading; String? get errorMessage;
/// Create a copy of MyPageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyPageStateCopyWith<MyPageState> get copyWith => _$MyPageStateCopyWithImpl<MyPageState>(this as MyPageState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyPageState&&(identical(other.loginState, loginState) || other.loginState == loginState)&&(identical(other.loginEntity, loginEntity) || other.loginEntity == loginEntity)&&const DeepCollectionEquality().equals(other.userProjects, userProjects)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,loginState,loginEntity,const DeepCollectionEquality().hash(userProjects),isLoading,errorMessage);

@override
String toString() {
  return 'MyPageState(loginState: $loginState, loginEntity: $loginEntity, userProjects: $userProjects, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $MyPageStateCopyWith<$Res>  {
  factory $MyPageStateCopyWith(MyPageState value, $Res Function(MyPageState) _then) = _$MyPageStateCopyWithImpl;
@useResult
$Res call({
 bool? loginState, LoginEntity? loginEntity, List<ProjectEntity> userProjects, bool isLoading, String? errorMessage
});


$LoginEntityCopyWith<$Res>? get loginEntity;

}
/// @nodoc
class _$MyPageStateCopyWithImpl<$Res>
    implements $MyPageStateCopyWith<$Res> {
  _$MyPageStateCopyWithImpl(this._self, this._then);

  final MyPageState _self;
  final $Res Function(MyPageState) _then;

/// Create a copy of MyPageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? loginState = freezed,Object? loginEntity = freezed,Object? userProjects = null,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
loginState: freezed == loginState ? _self.loginState : loginState // ignore: cast_nullable_to_non_nullable
as bool?,loginEntity: freezed == loginEntity ? _self.loginEntity : loginEntity // ignore: cast_nullable_to_non_nullable
as LoginEntity?,userProjects: null == userProjects ? _self.userProjects : userProjects // ignore: cast_nullable_to_non_nullable
as List<ProjectEntity>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of MyPageState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoginEntityCopyWith<$Res>? get loginEntity {
    if (_self.loginEntity == null) {
    return null;
  }

  return $LoginEntityCopyWith<$Res>(_self.loginEntity!, (value) {
    return _then(_self.copyWith(loginEntity: value));
  });
}
}


/// Adds pattern-matching-related methods to [MyPageState].
extension MyPageStatePatterns on MyPageState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyPageState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyPageState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyPageState value)  $default,){
final _that = this;
switch (_that) {
case _MyPageState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyPageState value)?  $default,){
final _that = this;
switch (_that) {
case _MyPageState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? loginState,  LoginEntity? loginEntity,  List<ProjectEntity> userProjects,  bool isLoading,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyPageState() when $default != null:
return $default(_that.loginState,_that.loginEntity,_that.userProjects,_that.isLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? loginState,  LoginEntity? loginEntity,  List<ProjectEntity> userProjects,  bool isLoading,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _MyPageState():
return $default(_that.loginState,_that.loginEntity,_that.userProjects,_that.isLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? loginState,  LoginEntity? loginEntity,  List<ProjectEntity> userProjects,  bool isLoading,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _MyPageState() when $default != null:
return $default(_that.loginState,_that.loginEntity,_that.userProjects,_that.isLoading,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _MyPageState implements MyPageState {
   _MyPageState({this.loginState, this.loginEntity, final  List<ProjectEntity> userProjects = const [], this.isLoading = false, this.errorMessage}): _userProjects = userProjects;
  

@override final  bool? loginState;
@override final  LoginEntity? loginEntity;
 final  List<ProjectEntity> _userProjects;
@override@JsonKey() List<ProjectEntity> get userProjects {
  if (_userProjects is EqualUnmodifiableListView) return _userProjects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_userProjects);
}

@override@JsonKey() final  bool isLoading;
@override final  String? errorMessage;

/// Create a copy of MyPageState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyPageStateCopyWith<_MyPageState> get copyWith => __$MyPageStateCopyWithImpl<_MyPageState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyPageState&&(identical(other.loginState, loginState) || other.loginState == loginState)&&(identical(other.loginEntity, loginEntity) || other.loginEntity == loginEntity)&&const DeepCollectionEquality().equals(other._userProjects, _userProjects)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,loginState,loginEntity,const DeepCollectionEquality().hash(_userProjects),isLoading,errorMessage);

@override
String toString() {
  return 'MyPageState(loginState: $loginState, loginEntity: $loginEntity, userProjects: $userProjects, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$MyPageStateCopyWith<$Res> implements $MyPageStateCopyWith<$Res> {
  factory _$MyPageStateCopyWith(_MyPageState value, $Res Function(_MyPageState) _then) = __$MyPageStateCopyWithImpl;
@override @useResult
$Res call({
 bool? loginState, LoginEntity? loginEntity, List<ProjectEntity> userProjects, bool isLoading, String? errorMessage
});


@override $LoginEntityCopyWith<$Res>? get loginEntity;

}
/// @nodoc
class __$MyPageStateCopyWithImpl<$Res>
    implements _$MyPageStateCopyWith<$Res> {
  __$MyPageStateCopyWithImpl(this._self, this._then);

  final _MyPageState _self;
  final $Res Function(_MyPageState) _then;

/// Create a copy of MyPageState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? loginState = freezed,Object? loginEntity = freezed,Object? userProjects = null,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_MyPageState(
loginState: freezed == loginState ? _self.loginState : loginState // ignore: cast_nullable_to_non_nullable
as bool?,loginEntity: freezed == loginEntity ? _self.loginEntity : loginEntity // ignore: cast_nullable_to_non_nullable
as LoginEntity?,userProjects: null == userProjects ? _self._userProjects : userProjects // ignore: cast_nullable_to_non_nullable
as List<ProjectEntity>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of MyPageState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoginEntityCopyWith<$Res>? get loginEntity {
    if (_self.loginEntity == null) {
    return null;
  }

  return $LoginEntityCopyWith<$Res>(_self.loginEntity!, (value) {
    return _then(_self.copyWith(loginEntity: value));
  });
}
}

// dart format on
