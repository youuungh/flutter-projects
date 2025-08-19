// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProjectEntity {

 int? get id; int? get categoryId; int? get projectTypeId; String? get projectClass; String? get userId; String? get title; String? get owner; int? get price; String? get thumbnail; String? get deadline; String? get description; int? get waitlistCount; int? get totalFundedCount; int? get totalFunded; String? get isOpen; String? get category; String? get type; List<int> get image; List<int> get projectImage;
/// Create a copy of ProjectEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectEntityCopyWith<ProjectEntity> get copyWith => _$ProjectEntityCopyWithImpl<ProjectEntity>(this as ProjectEntity, _$identity);

  /// Serializes this ProjectEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.projectTypeId, projectTypeId) || other.projectTypeId == projectTypeId)&&(identical(other.projectClass, projectClass) || other.projectClass == projectClass)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.title, title) || other.title == title)&&(identical(other.owner, owner) || other.owner == owner)&&(identical(other.price, price) || other.price == price)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.deadline, deadline) || other.deadline == deadline)&&(identical(other.description, description) || other.description == description)&&(identical(other.waitlistCount, waitlistCount) || other.waitlistCount == waitlistCount)&&(identical(other.totalFundedCount, totalFundedCount) || other.totalFundedCount == totalFundedCount)&&(identical(other.totalFunded, totalFunded) || other.totalFunded == totalFunded)&&(identical(other.isOpen, isOpen) || other.isOpen == isOpen)&&(identical(other.category, category) || other.category == category)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.image, image)&&const DeepCollectionEquality().equals(other.projectImage, projectImage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,categoryId,projectTypeId,projectClass,userId,title,owner,price,thumbnail,deadline,description,waitlistCount,totalFundedCount,totalFunded,isOpen,category,type,const DeepCollectionEquality().hash(image),const DeepCollectionEquality().hash(projectImage)]);

@override
String toString() {
  return 'ProjectEntity(id: $id, categoryId: $categoryId, projectTypeId: $projectTypeId, projectClass: $projectClass, userId: $userId, title: $title, owner: $owner, price: $price, thumbnail: $thumbnail, deadline: $deadline, description: $description, waitlistCount: $waitlistCount, totalFundedCount: $totalFundedCount, totalFunded: $totalFunded, isOpen: $isOpen, category: $category, type: $type, image: $image, projectImage: $projectImage)';
}


}

/// @nodoc
abstract mixin class $ProjectEntityCopyWith<$Res>  {
  factory $ProjectEntityCopyWith(ProjectEntity value, $Res Function(ProjectEntity) _then) = _$ProjectEntityCopyWithImpl;
@useResult
$Res call({
 int? id, int? categoryId, int? projectTypeId, String? projectClass, String? userId, String? title, String? owner, int? price, String? thumbnail, String? deadline, String? description, int? waitlistCount, int? totalFundedCount, int? totalFunded, String? isOpen, String? category, String? type, List<int> image, List<int> projectImage
});




}
/// @nodoc
class _$ProjectEntityCopyWithImpl<$Res>
    implements $ProjectEntityCopyWith<$Res> {
  _$ProjectEntityCopyWithImpl(this._self, this._then);

  final ProjectEntity _self;
  final $Res Function(ProjectEntity) _then;

/// Create a copy of ProjectEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? categoryId = freezed,Object? projectTypeId = freezed,Object? projectClass = freezed,Object? userId = freezed,Object? title = freezed,Object? owner = freezed,Object? price = freezed,Object? thumbnail = freezed,Object? deadline = freezed,Object? description = freezed,Object? waitlistCount = freezed,Object? totalFundedCount = freezed,Object? totalFunded = freezed,Object? isOpen = freezed,Object? category = freezed,Object? type = freezed,Object? image = null,Object? projectImage = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,projectTypeId: freezed == projectTypeId ? _self.projectTypeId : projectTypeId // ignore: cast_nullable_to_non_nullable
as int?,projectClass: freezed == projectClass ? _self.projectClass : projectClass // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
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
as String?,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as List<int>,projectImage: null == projectImage ? _self.projectImage : projectImage // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProjectEntity].
extension ProjectEntityPatterns on ProjectEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectEntity value)  $default,){
final _that = this;
switch (_that) {
case _ProjectEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  int? categoryId,  int? projectTypeId,  String? projectClass,  String? userId,  String? title,  String? owner,  int? price,  String? thumbnail,  String? deadline,  String? description,  int? waitlistCount,  int? totalFundedCount,  int? totalFunded,  String? isOpen,  String? category,  String? type,  List<int> image,  List<int> projectImage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectEntity() when $default != null:
return $default(_that.id,_that.categoryId,_that.projectTypeId,_that.projectClass,_that.userId,_that.title,_that.owner,_that.price,_that.thumbnail,_that.deadline,_that.description,_that.waitlistCount,_that.totalFundedCount,_that.totalFunded,_that.isOpen,_that.category,_that.type,_that.image,_that.projectImage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  int? categoryId,  int? projectTypeId,  String? projectClass,  String? userId,  String? title,  String? owner,  int? price,  String? thumbnail,  String? deadline,  String? description,  int? waitlistCount,  int? totalFundedCount,  int? totalFunded,  String? isOpen,  String? category,  String? type,  List<int> image,  List<int> projectImage)  $default,) {final _that = this;
switch (_that) {
case _ProjectEntity():
return $default(_that.id,_that.categoryId,_that.projectTypeId,_that.projectClass,_that.userId,_that.title,_that.owner,_that.price,_that.thumbnail,_that.deadline,_that.description,_that.waitlistCount,_that.totalFundedCount,_that.totalFunded,_that.isOpen,_that.category,_that.type,_that.image,_that.projectImage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  int? categoryId,  int? projectTypeId,  String? projectClass,  String? userId,  String? title,  String? owner,  int? price,  String? thumbnail,  String? deadline,  String? description,  int? waitlistCount,  int? totalFundedCount,  int? totalFunded,  String? isOpen,  String? category,  String? type,  List<int> image,  List<int> projectImage)?  $default,) {final _that = this;
switch (_that) {
case _ProjectEntity() when $default != null:
return $default(_that.id,_that.categoryId,_that.projectTypeId,_that.projectClass,_that.userId,_that.title,_that.owner,_that.price,_that.thumbnail,_that.deadline,_that.description,_that.waitlistCount,_that.totalFundedCount,_that.totalFunded,_that.isOpen,_that.category,_that.type,_that.image,_that.projectImage);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _ProjectEntity implements ProjectEntity {
  const _ProjectEntity({this.id, this.categoryId, this.projectTypeId, this.projectClass, this.userId, this.title, this.owner, this.price, this.thumbnail, this.deadline, this.description, this.waitlistCount, this.totalFundedCount, this.totalFunded, this.isOpen, this.category, this.type, final  List<int> image = const [], final  List<int> projectImage = const []}): _image = image,_projectImage = projectImage;
  factory _ProjectEntity.fromJson(Map<String, dynamic> json) => _$ProjectEntityFromJson(json);

@override final  int? id;
@override final  int? categoryId;
@override final  int? projectTypeId;
@override final  String? projectClass;
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
 final  List<int> _image;
@override@JsonKey() List<int> get image {
  if (_image is EqualUnmodifiableListView) return _image;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_image);
}

 final  List<int> _projectImage;
@override@JsonKey() List<int> get projectImage {
  if (_projectImage is EqualUnmodifiableListView) return _projectImage;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_projectImage);
}


/// Create a copy of ProjectEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectEntityCopyWith<_ProjectEntity> get copyWith => __$ProjectEntityCopyWithImpl<_ProjectEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjectEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.projectTypeId, projectTypeId) || other.projectTypeId == projectTypeId)&&(identical(other.projectClass, projectClass) || other.projectClass == projectClass)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.title, title) || other.title == title)&&(identical(other.owner, owner) || other.owner == owner)&&(identical(other.price, price) || other.price == price)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.deadline, deadline) || other.deadline == deadline)&&(identical(other.description, description) || other.description == description)&&(identical(other.waitlistCount, waitlistCount) || other.waitlistCount == waitlistCount)&&(identical(other.totalFundedCount, totalFundedCount) || other.totalFundedCount == totalFundedCount)&&(identical(other.totalFunded, totalFunded) || other.totalFunded == totalFunded)&&(identical(other.isOpen, isOpen) || other.isOpen == isOpen)&&(identical(other.category, category) || other.category == category)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._image, _image)&&const DeepCollectionEquality().equals(other._projectImage, _projectImage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,categoryId,projectTypeId,projectClass,userId,title,owner,price,thumbnail,deadline,description,waitlistCount,totalFundedCount,totalFunded,isOpen,category,type,const DeepCollectionEquality().hash(_image),const DeepCollectionEquality().hash(_projectImage)]);

@override
String toString() {
  return 'ProjectEntity(id: $id, categoryId: $categoryId, projectTypeId: $projectTypeId, projectClass: $projectClass, userId: $userId, title: $title, owner: $owner, price: $price, thumbnail: $thumbnail, deadline: $deadline, description: $description, waitlistCount: $waitlistCount, totalFundedCount: $totalFundedCount, totalFunded: $totalFunded, isOpen: $isOpen, category: $category, type: $type, image: $image, projectImage: $projectImage)';
}


}

/// @nodoc
abstract mixin class _$ProjectEntityCopyWith<$Res> implements $ProjectEntityCopyWith<$Res> {
  factory _$ProjectEntityCopyWith(_ProjectEntity value, $Res Function(_ProjectEntity) _then) = __$ProjectEntityCopyWithImpl;
@override @useResult
$Res call({
 int? id, int? categoryId, int? projectTypeId, String? projectClass, String? userId, String? title, String? owner, int? price, String? thumbnail, String? deadline, String? description, int? waitlistCount, int? totalFundedCount, int? totalFunded, String? isOpen, String? category, String? type, List<int> image, List<int> projectImage
});




}
/// @nodoc
class __$ProjectEntityCopyWithImpl<$Res>
    implements _$ProjectEntityCopyWith<$Res> {
  __$ProjectEntityCopyWithImpl(this._self, this._then);

  final _ProjectEntity _self;
  final $Res Function(_ProjectEntity) _then;

/// Create a copy of ProjectEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? categoryId = freezed,Object? projectTypeId = freezed,Object? projectClass = freezed,Object? userId = freezed,Object? title = freezed,Object? owner = freezed,Object? price = freezed,Object? thumbnail = freezed,Object? deadline = freezed,Object? description = freezed,Object? waitlistCount = freezed,Object? totalFundedCount = freezed,Object? totalFunded = freezed,Object? isOpen = freezed,Object? category = freezed,Object? type = freezed,Object? image = null,Object? projectImage = null,}) {
  return _then(_ProjectEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,projectTypeId: freezed == projectTypeId ? _self.projectTypeId : projectTypeId // ignore: cast_nullable_to_non_nullable
as int?,projectClass: freezed == projectClass ? _self.projectClass : projectClass // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
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
as String?,image: null == image ? _self._image : image // ignore: cast_nullable_to_non_nullable
as List<int>,projectImage: null == projectImage ? _self._projectImage : projectImage // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

// dart format on
