// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CategoryScreenState {

 ProjectType? get selectedType; EnumCategoryProjectType? get projectFilter; List<CategoryEntity> get projects; List<ProjectType> get projectTypes; AsyncValue<List<CategoryEntity>> get projectState; bool get isLoading; String? get errorMessage;
/// Create a copy of CategoryScreenState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryScreenStateCopyWith<CategoryScreenState> get copyWith => _$CategoryScreenStateCopyWithImpl<CategoryScreenState>(this as CategoryScreenState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryScreenState&&(identical(other.selectedType, selectedType) || other.selectedType == selectedType)&&(identical(other.projectFilter, projectFilter) || other.projectFilter == projectFilter)&&const DeepCollectionEquality().equals(other.projects, projects)&&const DeepCollectionEquality().equals(other.projectTypes, projectTypes)&&(identical(other.projectState, projectState) || other.projectState == projectState)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,selectedType,projectFilter,const DeepCollectionEquality().hash(projects),const DeepCollectionEquality().hash(projectTypes),projectState,isLoading,errorMessage);

@override
String toString() {
  return 'CategoryScreenState(selectedType: $selectedType, projectFilter: $projectFilter, projects: $projects, projectTypes: $projectTypes, projectState: $projectState, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $CategoryScreenStateCopyWith<$Res>  {
  factory $CategoryScreenStateCopyWith(CategoryScreenState value, $Res Function(CategoryScreenState) _then) = _$CategoryScreenStateCopyWithImpl;
@useResult
$Res call({
 ProjectType? selectedType, EnumCategoryProjectType? projectFilter, List<CategoryEntity> projects, List<ProjectType> projectTypes, AsyncValue<List<CategoryEntity>> projectState, bool isLoading, String? errorMessage
});


$ProjectTypeCopyWith<$Res>? get selectedType;

}
/// @nodoc
class _$CategoryScreenStateCopyWithImpl<$Res>
    implements $CategoryScreenStateCopyWith<$Res> {
  _$CategoryScreenStateCopyWithImpl(this._self, this._then);

  final CategoryScreenState _self;
  final $Res Function(CategoryScreenState) _then;

/// Create a copy of CategoryScreenState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedType = freezed,Object? projectFilter = freezed,Object? projects = null,Object? projectTypes = null,Object? projectState = null,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
selectedType: freezed == selectedType ? _self.selectedType : selectedType // ignore: cast_nullable_to_non_nullable
as ProjectType?,projectFilter: freezed == projectFilter ? _self.projectFilter : projectFilter // ignore: cast_nullable_to_non_nullable
as EnumCategoryProjectType?,projects: null == projects ? _self.projects : projects // ignore: cast_nullable_to_non_nullable
as List<CategoryEntity>,projectTypes: null == projectTypes ? _self.projectTypes : projectTypes // ignore: cast_nullable_to_non_nullable
as List<ProjectType>,projectState: null == projectState ? _self.projectState : projectState // ignore: cast_nullable_to_non_nullable
as AsyncValue<List<CategoryEntity>>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of CategoryScreenState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectTypeCopyWith<$Res>? get selectedType {
    if (_self.selectedType == null) {
    return null;
  }

  return $ProjectTypeCopyWith<$Res>(_self.selectedType!, (value) {
    return _then(_self.copyWith(selectedType: value));
  });
}
}


/// Adds pattern-matching-related methods to [CategoryScreenState].
extension CategoryScreenStatePatterns on CategoryScreenState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryScreenState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryScreenState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryScreenState value)  $default,){
final _that = this;
switch (_that) {
case _CategoryScreenState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryScreenState value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryScreenState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ProjectType? selectedType,  EnumCategoryProjectType? projectFilter,  List<CategoryEntity> projects,  List<ProjectType> projectTypes,  AsyncValue<List<CategoryEntity>> projectState,  bool isLoading,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryScreenState() when $default != null:
return $default(_that.selectedType,_that.projectFilter,_that.projects,_that.projectTypes,_that.projectState,_that.isLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ProjectType? selectedType,  EnumCategoryProjectType? projectFilter,  List<CategoryEntity> projects,  List<ProjectType> projectTypes,  AsyncValue<List<CategoryEntity>> projectState,  bool isLoading,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _CategoryScreenState():
return $default(_that.selectedType,_that.projectFilter,_that.projects,_that.projectTypes,_that.projectState,_that.isLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ProjectType? selectedType,  EnumCategoryProjectType? projectFilter,  List<CategoryEntity> projects,  List<ProjectType> projectTypes,  AsyncValue<List<CategoryEntity>> projectState,  bool isLoading,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _CategoryScreenState() when $default != null:
return $default(_that.selectedType,_that.projectFilter,_that.projects,_that.projectTypes,_that.projectState,_that.isLoading,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _CategoryScreenState implements CategoryScreenState {
   _CategoryScreenState({this.selectedType, this.projectFilter = EnumCategoryProjectType.recommend, final  List<CategoryEntity> projects = const [], final  List<ProjectType> projectTypes = const [], this.projectState = const AsyncValue.loading(), this.isLoading = false, this.errorMessage}): _projects = projects,_projectTypes = projectTypes;
  

@override final  ProjectType? selectedType;
@override@JsonKey() final  EnumCategoryProjectType? projectFilter;
 final  List<CategoryEntity> _projects;
@override@JsonKey() List<CategoryEntity> get projects {
  if (_projects is EqualUnmodifiableListView) return _projects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_projects);
}

 final  List<ProjectType> _projectTypes;
@override@JsonKey() List<ProjectType> get projectTypes {
  if (_projectTypes is EqualUnmodifiableListView) return _projectTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_projectTypes);
}

@override@JsonKey() final  AsyncValue<List<CategoryEntity>> projectState;
@override@JsonKey() final  bool isLoading;
@override final  String? errorMessage;

/// Create a copy of CategoryScreenState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryScreenStateCopyWith<_CategoryScreenState> get copyWith => __$CategoryScreenStateCopyWithImpl<_CategoryScreenState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryScreenState&&(identical(other.selectedType, selectedType) || other.selectedType == selectedType)&&(identical(other.projectFilter, projectFilter) || other.projectFilter == projectFilter)&&const DeepCollectionEquality().equals(other._projects, _projects)&&const DeepCollectionEquality().equals(other._projectTypes, _projectTypes)&&(identical(other.projectState, projectState) || other.projectState == projectState)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,selectedType,projectFilter,const DeepCollectionEquality().hash(_projects),const DeepCollectionEquality().hash(_projectTypes),projectState,isLoading,errorMessage);

@override
String toString() {
  return 'CategoryScreenState(selectedType: $selectedType, projectFilter: $projectFilter, projects: $projects, projectTypes: $projectTypes, projectState: $projectState, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$CategoryScreenStateCopyWith<$Res> implements $CategoryScreenStateCopyWith<$Res> {
  factory _$CategoryScreenStateCopyWith(_CategoryScreenState value, $Res Function(_CategoryScreenState) _then) = __$CategoryScreenStateCopyWithImpl;
@override @useResult
$Res call({
 ProjectType? selectedType, EnumCategoryProjectType? projectFilter, List<CategoryEntity> projects, List<ProjectType> projectTypes, AsyncValue<List<CategoryEntity>> projectState, bool isLoading, String? errorMessage
});


@override $ProjectTypeCopyWith<$Res>? get selectedType;

}
/// @nodoc
class __$CategoryScreenStateCopyWithImpl<$Res>
    implements _$CategoryScreenStateCopyWith<$Res> {
  __$CategoryScreenStateCopyWithImpl(this._self, this._then);

  final _CategoryScreenState _self;
  final $Res Function(_CategoryScreenState) _then;

/// Create a copy of CategoryScreenState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedType = freezed,Object? projectFilter = freezed,Object? projects = null,Object? projectTypes = null,Object? projectState = null,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_CategoryScreenState(
selectedType: freezed == selectedType ? _self.selectedType : selectedType // ignore: cast_nullable_to_non_nullable
as ProjectType?,projectFilter: freezed == projectFilter ? _self.projectFilter : projectFilter // ignore: cast_nullable_to_non_nullable
as EnumCategoryProjectType?,projects: null == projects ? _self._projects : projects // ignore: cast_nullable_to_non_nullable
as List<CategoryEntity>,projectTypes: null == projectTypes ? _self._projectTypes : projectTypes // ignore: cast_nullable_to_non_nullable
as List<ProjectType>,projectState: null == projectState ? _self.projectState : projectState // ignore: cast_nullable_to_non_nullable
as AsyncValue<List<CategoryEntity>>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of CategoryScreenState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectTypeCopyWith<$Res>? get selectedType {
    if (_self.selectedType == null) {
    return null;
  }

  return $ProjectTypeCopyWith<$Res>(_self.selectedType!, (value) {
    return _then(_self.copyWith(selectedType: value));
  });
}
}

// dart format on
