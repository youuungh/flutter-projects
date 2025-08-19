// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeEntity {

 int? get id; int? get categoryId; int? get projectTypeId; String? get userId; String? get title; String? get owner; int? get price; String? get thumbnail; String? get deadline; String? get description; int? get waitlistCount; int? get totalFundedCount; int? get totalFunded; String? get isOpen; String? get category; String? get type;
/// Create a copy of HomeEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeEntityCopyWith<HomeEntity> get copyWith => _$HomeEntityCopyWithImpl<HomeEntity>(this as HomeEntity, _$identity);

  /// Serializes this HomeEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.projectTypeId, projectTypeId) || other.projectTypeId == projectTypeId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.title, title) || other.title == title)&&(identical(other.owner, owner) || other.owner == owner)&&(identical(other.price, price) || other.price == price)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.deadline, deadline) || other.deadline == deadline)&&(identical(other.description, description) || other.description == description)&&(identical(other.waitlistCount, waitlistCount) || other.waitlistCount == waitlistCount)&&(identical(other.totalFundedCount, totalFundedCount) || other.totalFundedCount == totalFundedCount)&&(identical(other.totalFunded, totalFunded) || other.totalFunded == totalFunded)&&(identical(other.isOpen, isOpen) || other.isOpen == isOpen)&&(identical(other.category, category) || other.category == category)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,categoryId,projectTypeId,userId,title,owner,price,thumbnail,deadline,description,waitlistCount,totalFundedCount,totalFunded,isOpen,category,type);

@override
String toString() {
  return 'HomeEntity(id: $id, categoryId: $categoryId, projectTypeId: $projectTypeId, userId: $userId, title: $title, owner: $owner, price: $price, thumbnail: $thumbnail, deadline: $deadline, description: $description, waitlistCount: $waitlistCount, totalFundedCount: $totalFundedCount, totalFunded: $totalFunded, isOpen: $isOpen, category: $category, type: $type)';
}


}

/// @nodoc
abstract mixin class $HomeEntityCopyWith<$Res>  {
  factory $HomeEntityCopyWith(HomeEntity value, $Res Function(HomeEntity) _then) = _$HomeEntityCopyWithImpl;
@useResult
$Res call({
 int? id, int? categoryId, int? projectTypeId, String? userId, String? title, String? owner, int? price, String? thumbnail, String? deadline, String? description, int? waitlistCount, int? totalFundedCount, int? totalFunded, String? isOpen, String? category, String? type
});




}
/// @nodoc
class _$HomeEntityCopyWithImpl<$Res>
    implements $HomeEntityCopyWith<$Res> {
  _$HomeEntityCopyWithImpl(this._self, this._then);

  final HomeEntity _self;
  final $Res Function(HomeEntity) _then;

/// Create a copy of HomeEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? categoryId = freezed,Object? projectTypeId = freezed,Object? userId = freezed,Object? title = freezed,Object? owner = freezed,Object? price = freezed,Object? thumbnail = freezed,Object? deadline = freezed,Object? description = freezed,Object? waitlistCount = freezed,Object? totalFundedCount = freezed,Object? totalFunded = freezed,Object? isOpen = freezed,Object? category = freezed,Object? type = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,projectTypeId: freezed == projectTypeId ? _self.projectTypeId : projectTypeId // ignore: cast_nullable_to_non_nullable
as int?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,owner: freezed == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int?,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String?,deadline: freezed == deadline ? _self.deadline : deadline // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,waitlistCount: freezed == waitlistCount ? _self.waitlistCount : waitlistCount // ignore: cast_nullable_to_non_nullable
as int?,totalFundedCount: freezed == totalFundedCount ? _self.totalFundedCount : totalFundedCount // ignore: cast_nullable_to_non_nullable
as int?,totalFunded: freezed == totalFunded ? _self.totalFunded : totalFunded // ignore: cast_nullable_to_non_nullable
as int?,isOpen: freezed == isOpen ? _self.isOpen : isOpen // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeEntity].
extension HomeEntityPatterns on HomeEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeEntity value)  $default,){
final _that = this;
switch (_that) {
case _HomeEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeEntity value)?  $default,){
final _that = this;
switch (_that) {
case _HomeEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  int? categoryId,  int? projectTypeId,  String? userId,  String? title,  String? owner,  int? price,  String? thumbnail,  String? deadline,  String? description,  int? waitlistCount,  int? totalFundedCount,  int? totalFunded,  String? isOpen,  String? category,  String? type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeEntity() when $default != null:
return $default(_that.id,_that.categoryId,_that.projectTypeId,_that.userId,_that.title,_that.owner,_that.price,_that.thumbnail,_that.deadline,_that.description,_that.waitlistCount,_that.totalFundedCount,_that.totalFunded,_that.isOpen,_that.category,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  int? categoryId,  int? projectTypeId,  String? userId,  String? title,  String? owner,  int? price,  String? thumbnail,  String? deadline,  String? description,  int? waitlistCount,  int? totalFundedCount,  int? totalFunded,  String? isOpen,  String? category,  String? type)  $default,) {final _that = this;
switch (_that) {
case _HomeEntity():
return $default(_that.id,_that.categoryId,_that.projectTypeId,_that.userId,_that.title,_that.owner,_that.price,_that.thumbnail,_that.deadline,_that.description,_that.waitlistCount,_that.totalFundedCount,_that.totalFunded,_that.isOpen,_that.category,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  int? categoryId,  int? projectTypeId,  String? userId,  String? title,  String? owner,  int? price,  String? thumbnail,  String? deadline,  String? description,  int? waitlistCount,  int? totalFundedCount,  int? totalFunded,  String? isOpen,  String? category,  String? type)?  $default,) {final _that = this;
switch (_that) {
case _HomeEntity() when $default != null:
return $default(_that.id,_that.categoryId,_that.projectTypeId,_that.userId,_that.title,_that.owner,_that.price,_that.thumbnail,_that.deadline,_that.description,_that.waitlistCount,_that.totalFundedCount,_that.totalFunded,_that.isOpen,_that.category,_that.type);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _HomeEntity implements HomeEntity {
  const _HomeEntity({this.id, this.categoryId, this.projectTypeId, this.userId, this.title, this.owner, this.price, this.thumbnail, this.deadline, this.description, this.waitlistCount, this.totalFundedCount, this.totalFunded, this.isOpen, this.category, this.type});
  factory _HomeEntity.fromJson(Map<String, dynamic> json) => _$HomeEntityFromJson(json);

@override final  int? id;
@override final  int? categoryId;
@override final  int? projectTypeId;
@override final  String? userId;
@override final  String? title;
@override final  String? owner;
@override final  int? price;
@override final  String? thumbnail;
@override final  String? deadline;
@override final  String? description;
@override final  int? waitlistCount;
@override final  int? totalFundedCount;
@override final  int? totalFunded;
@override final  String? isOpen;
@override final  String? category;
@override final  String? type;

/// Create a copy of HomeEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeEntityCopyWith<_HomeEntity> get copyWith => __$HomeEntityCopyWithImpl<_HomeEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.projectTypeId, projectTypeId) || other.projectTypeId == projectTypeId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.title, title) || other.title == title)&&(identical(other.owner, owner) || other.owner == owner)&&(identical(other.price, price) || other.price == price)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.deadline, deadline) || other.deadline == deadline)&&(identical(other.description, description) || other.description == description)&&(identical(other.waitlistCount, waitlistCount) || other.waitlistCount == waitlistCount)&&(identical(other.totalFundedCount, totalFundedCount) || other.totalFundedCount == totalFundedCount)&&(identical(other.totalFunded, totalFunded) || other.totalFunded == totalFunded)&&(identical(other.isOpen, isOpen) || other.isOpen == isOpen)&&(identical(other.category, category) || other.category == category)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,categoryId,projectTypeId,userId,title,owner,price,thumbnail,deadline,description,waitlistCount,totalFundedCount,totalFunded,isOpen,category,type);

@override
String toString() {
  return 'HomeEntity(id: $id, categoryId: $categoryId, projectTypeId: $projectTypeId, userId: $userId, title: $title, owner: $owner, price: $price, thumbnail: $thumbnail, deadline: $deadline, description: $description, waitlistCount: $waitlistCount, totalFundedCount: $totalFundedCount, totalFunded: $totalFunded, isOpen: $isOpen, category: $category, type: $type)';
}


}

/// @nodoc
abstract mixin class _$HomeEntityCopyWith<$Res> implements $HomeEntityCopyWith<$Res> {
  factory _$HomeEntityCopyWith(_HomeEntity value, $Res Function(_HomeEntity) _then) = __$HomeEntityCopyWithImpl;
@override @useResult
$Res call({
 int? id, int? categoryId, int? projectTypeId, String? userId, String? title, String? owner, int? price, String? thumbnail, String? deadline, String? description, int? waitlistCount, int? totalFundedCount, int? totalFunded, String? isOpen, String? category, String? type
});




}
/// @nodoc
class __$HomeEntityCopyWithImpl<$Res>
    implements _$HomeEntityCopyWith<$Res> {
  __$HomeEntityCopyWithImpl(this._self, this._then);

  final _HomeEntity _self;
  final $Res Function(_HomeEntity) _then;

/// Create a copy of HomeEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? categoryId = freezed,Object? projectTypeId = freezed,Object? userId = freezed,Object? title = freezed,Object? owner = freezed,Object? price = freezed,Object? thumbnail = freezed,Object? deadline = freezed,Object? description = freezed,Object? waitlistCount = freezed,Object? totalFundedCount = freezed,Object? totalFunded = freezed,Object? isOpen = freezed,Object? category = freezed,Object? type = freezed,}) {
  return _then(_HomeEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,projectTypeId: freezed == projectTypeId ? _self.projectTypeId : projectTypeId // ignore: cast_nullable_to_non_nullable
as int?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,owner: freezed == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int?,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String?,deadline: freezed == deadline ? _self.deadline : deadline // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,waitlistCount: freezed == waitlistCount ? _self.waitlistCount : waitlistCount // ignore: cast_nullable_to_non_nullable
as int?,totalFundedCount: freezed == totalFundedCount ? _self.totalFundedCount : totalFundedCount // ignore: cast_nullable_to_non_nullable
as int?,totalFunded: freezed == totalFunded ? _self.totalFunded : totalFunded // ignore: cast_nullable_to_non_nullable
as int?,isOpen: freezed == isOpen ? _self.isOpen : isOpen // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
