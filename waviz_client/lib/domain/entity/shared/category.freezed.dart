// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProjectCategory {

 int? get id; String? get category; String? get title; String? get iconPath; String? get created;
/// Create a copy of ProjectCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectCategoryCopyWith<ProjectCategory> get copyWith => _$ProjectCategoryCopyWithImpl<ProjectCategory>(this as ProjectCategory, _$identity);

  /// Serializes this ProjectCategory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.category, category) || other.category == category)&&(identical(other.title, title) || other.title == title)&&(identical(other.iconPath, iconPath) || other.iconPath == iconPath)&&(identical(other.created, created) || other.created == created));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,category,title,iconPath,created);

@override
String toString() {
  return 'ProjectCategory(id: $id, category: $category, title: $title, iconPath: $iconPath, created: $created)';
}


}

/// @nodoc
abstract mixin class $ProjectCategoryCopyWith<$Res>  {
  factory $ProjectCategoryCopyWith(ProjectCategory value, $Res Function(ProjectCategory) _then) = _$ProjectCategoryCopyWithImpl;
@useResult
$Res call({
 int? id, String? category, String? title, String? iconPath, String? created
});




}
/// @nodoc
class _$ProjectCategoryCopyWithImpl<$Res>
    implements $ProjectCategoryCopyWith<$Res> {
  _$ProjectCategoryCopyWithImpl(this._self, this._then);

  final ProjectCategory _self;
  final $Res Function(ProjectCategory) _then;

/// Create a copy of ProjectCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? category = freezed,Object? title = freezed,Object? iconPath = freezed,Object? created = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,iconPath: freezed == iconPath ? _self.iconPath : iconPath // ignore: cast_nullable_to_non_nullable
as String?,created: freezed == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProjectCategory].
extension ProjectCategoryPatterns on ProjectCategory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectCategory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectCategory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectCategory value)  $default,){
final _that = this;
switch (_that) {
case _ProjectCategory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectCategory value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectCategory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? category,  String? title,  String? iconPath,  String? created)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectCategory() when $default != null:
return $default(_that.id,_that.category,_that.title,_that.iconPath,_that.created);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? category,  String? title,  String? iconPath,  String? created)  $default,) {final _that = this;
switch (_that) {
case _ProjectCategory():
return $default(_that.id,_that.category,_that.title,_that.iconPath,_that.created);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? category,  String? title,  String? iconPath,  String? created)?  $default,) {final _that = this;
switch (_that) {
case _ProjectCategory() when $default != null:
return $default(_that.id,_that.category,_that.title,_that.iconPath,_that.created);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProjectCategory implements ProjectCategory {
  const _ProjectCategory({this.id, this.category, this.title, this.iconPath, this.created});
  factory _ProjectCategory.fromJson(Map<String, dynamic> json) => _$ProjectCategoryFromJson(json);

@override final  int? id;
@override final  String? category;
@override final  String? title;
@override final  String? iconPath;
@override final  String? created;

/// Create a copy of ProjectCategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectCategoryCopyWith<_ProjectCategory> get copyWith => __$ProjectCategoryCopyWithImpl<_ProjectCategory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjectCategoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.category, category) || other.category == category)&&(identical(other.title, title) || other.title == title)&&(identical(other.iconPath, iconPath) || other.iconPath == iconPath)&&(identical(other.created, created) || other.created == created));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,category,title,iconPath,created);

@override
String toString() {
  return 'ProjectCategory(id: $id, category: $category, title: $title, iconPath: $iconPath, created: $created)';
}


}

/// @nodoc
abstract mixin class _$ProjectCategoryCopyWith<$Res> implements $ProjectCategoryCopyWith<$Res> {
  factory _$ProjectCategoryCopyWith(_ProjectCategory value, $Res Function(_ProjectCategory) _then) = __$ProjectCategoryCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? category, String? title, String? iconPath, String? created
});




}
/// @nodoc
class __$ProjectCategoryCopyWithImpl<$Res>
    implements _$ProjectCategoryCopyWith<$Res> {
  __$ProjectCategoryCopyWithImpl(this._self, this._then);

  final _ProjectCategory _self;
  final $Res Function(_ProjectCategory) _then;

/// Create a copy of ProjectCategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? category = freezed,Object? title = freezed,Object? iconPath = freezed,Object? created = freezed,}) {
  return _then(_ProjectCategory(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,iconPath: freezed == iconPath ? _self.iconPath : iconPath // ignore: cast_nullable_to_non_nullable
as String?,created: freezed == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
