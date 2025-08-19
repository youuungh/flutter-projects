// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProjectState {

 ProjectEntity? get currentProject; List<ProjectType> get projectTypes; bool get isLoading; String? get errorMessage;
/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectStateCopyWith<ProjectState> get copyWith => _$ProjectStateCopyWithImpl<ProjectState>(this as ProjectState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectState&&(identical(other.currentProject, currentProject) || other.currentProject == currentProject)&&const DeepCollectionEquality().equals(other.projectTypes, projectTypes)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,currentProject,const DeepCollectionEquality().hash(projectTypes),isLoading,errorMessage);

@override
String toString() {
  return 'ProjectState(currentProject: $currentProject, projectTypes: $projectTypes, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ProjectStateCopyWith<$Res>  {
  factory $ProjectStateCopyWith(ProjectState value, $Res Function(ProjectState) _then) = _$ProjectStateCopyWithImpl;
@useResult
$Res call({
 ProjectEntity? currentProject, List<ProjectType> projectTypes, bool isLoading, String? errorMessage
});


$ProjectEntityCopyWith<$Res>? get currentProject;

}
/// @nodoc
class _$ProjectStateCopyWithImpl<$Res>
    implements $ProjectStateCopyWith<$Res> {
  _$ProjectStateCopyWithImpl(this._self, this._then);

  final ProjectState _self;
  final $Res Function(ProjectState) _then;

/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentProject = freezed,Object? projectTypes = null,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
currentProject: freezed == currentProject ? _self.currentProject : currentProject // ignore: cast_nullable_to_non_nullable
as ProjectEntity?,projectTypes: null == projectTypes ? _self.projectTypes : projectTypes // ignore: cast_nullable_to_non_nullable
as List<ProjectType>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectEntityCopyWith<$Res>? get currentProject {
    if (_self.currentProject == null) {
    return null;
  }

  return $ProjectEntityCopyWith<$Res>(_self.currentProject!, (value) {
    return _then(_self.copyWith(currentProject: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProjectState].
extension ProjectStatePatterns on ProjectState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectState value)  $default,){
final _that = this;
switch (_that) {
case _ProjectState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectState value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ProjectEntity? currentProject,  List<ProjectType> projectTypes,  bool isLoading,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectState() when $default != null:
return $default(_that.currentProject,_that.projectTypes,_that.isLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ProjectEntity? currentProject,  List<ProjectType> projectTypes,  bool isLoading,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _ProjectState():
return $default(_that.currentProject,_that.projectTypes,_that.isLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ProjectEntity? currentProject,  List<ProjectType> projectTypes,  bool isLoading,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _ProjectState() when $default != null:
return $default(_that.currentProject,_that.projectTypes,_that.isLoading,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _ProjectState implements ProjectState {
   _ProjectState({this.currentProject, final  List<ProjectType> projectTypes = const [], this.isLoading = false, this.errorMessage}): _projectTypes = projectTypes;
  

@override final  ProjectEntity? currentProject;
 final  List<ProjectType> _projectTypes;
@override@JsonKey() List<ProjectType> get projectTypes {
  if (_projectTypes is EqualUnmodifiableListView) return _projectTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_projectTypes);
}

@override@JsonKey() final  bool isLoading;
@override final  String? errorMessage;

/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectStateCopyWith<_ProjectState> get copyWith => __$ProjectStateCopyWithImpl<_ProjectState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectState&&(identical(other.currentProject, currentProject) || other.currentProject == currentProject)&&const DeepCollectionEquality().equals(other._projectTypes, _projectTypes)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,currentProject,const DeepCollectionEquality().hash(_projectTypes),isLoading,errorMessage);

@override
String toString() {
  return 'ProjectState(currentProject: $currentProject, projectTypes: $projectTypes, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$ProjectStateCopyWith<$Res> implements $ProjectStateCopyWith<$Res> {
  factory _$ProjectStateCopyWith(_ProjectState value, $Res Function(_ProjectState) _then) = __$ProjectStateCopyWithImpl;
@override @useResult
$Res call({
 ProjectEntity? currentProject, List<ProjectType> projectTypes, bool isLoading, String? errorMessage
});


@override $ProjectEntityCopyWith<$Res>? get currentProject;

}
/// @nodoc
class __$ProjectStateCopyWithImpl<$Res>
    implements _$ProjectStateCopyWith<$Res> {
  __$ProjectStateCopyWithImpl(this._self, this._then);

  final _ProjectState _self;
  final $Res Function(_ProjectState) _then;

/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentProject = freezed,Object? projectTypes = null,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_ProjectState(
currentProject: freezed == currentProject ? _self.currentProject : currentProject // ignore: cast_nullable_to_non_nullable
as ProjectEntity?,projectTypes: null == projectTypes ? _self._projectTypes : projectTypes // ignore: cast_nullable_to_non_nullable
as List<ProjectType>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectEntityCopyWith<$Res>? get currentProject {
    if (_self.currentProject == null) {
    return null;
  }

  return $ProjectEntityCopyWith<$Res>(_self.currentProject!, (value) {
    return _then(_self.copyWith(currentProject: value));
  });
}
}

// dart format on
