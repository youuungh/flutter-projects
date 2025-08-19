// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reward_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RewardEntity {

 int? get id; int? get projectId; String? get imageUrl; String? get title; int? get price; String? get description; List<int> get imageRaw;
/// Create a copy of RewardEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RewardEntityCopyWith<RewardEntity> get copyWith => _$RewardEntityCopyWithImpl<RewardEntity>(this as RewardEntity, _$identity);

  /// Serializes this RewardEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RewardEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.title, title) || other.title == title)&&(identical(other.price, price) || other.price == price)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.imageRaw, imageRaw));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,projectId,imageUrl,title,price,description,const DeepCollectionEquality().hash(imageRaw));

@override
String toString() {
  return 'RewardEntity(id: $id, projectId: $projectId, imageUrl: $imageUrl, title: $title, price: $price, description: $description, imageRaw: $imageRaw)';
}


}

/// @nodoc
abstract mixin class $RewardEntityCopyWith<$Res>  {
  factory $RewardEntityCopyWith(RewardEntity value, $Res Function(RewardEntity) _then) = _$RewardEntityCopyWithImpl;
@useResult
$Res call({
 int? id, int? projectId, String? imageUrl, String? title, int? price, String? description, List<int> imageRaw
});




}
/// @nodoc
class _$RewardEntityCopyWithImpl<$Res>
    implements $RewardEntityCopyWith<$Res> {
  _$RewardEntityCopyWithImpl(this._self, this._then);

  final RewardEntity _self;
  final $Res Function(RewardEntity) _then;

/// Create a copy of RewardEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? projectId = freezed,Object? imageUrl = freezed,Object? title = freezed,Object? price = freezed,Object? description = freezed,Object? imageRaw = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,projectId: freezed == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as int?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,imageRaw: null == imageRaw ? _self.imageRaw : imageRaw // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}

}


/// Adds pattern-matching-related methods to [RewardEntity].
extension RewardEntityPatterns on RewardEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RewardEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RewardEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RewardEntity value)  $default,){
final _that = this;
switch (_that) {
case _RewardEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RewardEntity value)?  $default,){
final _that = this;
switch (_that) {
case _RewardEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  int? projectId,  String? imageUrl,  String? title,  int? price,  String? description,  List<int> imageRaw)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RewardEntity() when $default != null:
return $default(_that.id,_that.projectId,_that.imageUrl,_that.title,_that.price,_that.description,_that.imageRaw);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  int? projectId,  String? imageUrl,  String? title,  int? price,  String? description,  List<int> imageRaw)  $default,) {final _that = this;
switch (_that) {
case _RewardEntity():
return $default(_that.id,_that.projectId,_that.imageUrl,_that.title,_that.price,_that.description,_that.imageRaw);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  int? projectId,  String? imageUrl,  String? title,  int? price,  String? description,  List<int> imageRaw)?  $default,) {final _that = this;
switch (_that) {
case _RewardEntity() when $default != null:
return $default(_that.id,_that.projectId,_that.imageUrl,_that.title,_that.price,_that.description,_that.imageRaw);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _RewardEntity implements RewardEntity {
  const _RewardEntity({this.id, this.projectId, this.imageUrl, this.title, this.price, this.description, final  List<int> imageRaw = const []}): _imageRaw = imageRaw;
  factory _RewardEntity.fromJson(Map<String, dynamic> json) => _$RewardEntityFromJson(json);

@override final  int? id;
@override final  int? projectId;
@override final  String? imageUrl;
@override final  String? title;
@override final  int? price;
@override final  String? description;
 final  List<int> _imageRaw;
@override@JsonKey() List<int> get imageRaw {
  if (_imageRaw is EqualUnmodifiableListView) return _imageRaw;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_imageRaw);
}


/// Create a copy of RewardEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RewardEntityCopyWith<_RewardEntity> get copyWith => __$RewardEntityCopyWithImpl<_RewardEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RewardEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RewardEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.title, title) || other.title == title)&&(identical(other.price, price) || other.price == price)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._imageRaw, _imageRaw));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,projectId,imageUrl,title,price,description,const DeepCollectionEquality().hash(_imageRaw));

@override
String toString() {
  return 'RewardEntity(id: $id, projectId: $projectId, imageUrl: $imageUrl, title: $title, price: $price, description: $description, imageRaw: $imageRaw)';
}


}

/// @nodoc
abstract mixin class _$RewardEntityCopyWith<$Res> implements $RewardEntityCopyWith<$Res> {
  factory _$RewardEntityCopyWith(_RewardEntity value, $Res Function(_RewardEntity) _then) = __$RewardEntityCopyWithImpl;
@override @useResult
$Res call({
 int? id, int? projectId, String? imageUrl, String? title, int? price, String? description, List<int> imageRaw
});




}
/// @nodoc
class __$RewardEntityCopyWithImpl<$Res>
    implements _$RewardEntityCopyWith<$Res> {
  __$RewardEntityCopyWithImpl(this._self, this._then);

  final _RewardEntity _self;
  final $Res Function(_RewardEntity) _then;

/// Create a copy of RewardEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? projectId = freezed,Object? imageUrl = freezed,Object? title = freezed,Object? price = freezed,Object? description = freezed,Object? imageRaw = null,}) {
  return _then(_RewardEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,projectId: freezed == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as int?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,imageRaw: null == imageRaw ? _self._imageRaw : imageRaw // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

// dart format on
