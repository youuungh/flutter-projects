// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
  id: json['id'] as String? ?? '',
  imageUrl: json['imageUrl'] as String? ?? '',
  company: json['company'] as String? ?? '',
  name: json['name'] as String? ?? '',
  postCount: (json['postCount'] as num?)?.toInt() ?? 0,
  commentCount: (json['commentCount'] as num?)?.toInt() ?? 0,
  likeCount: (json['likeCount'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'company': instance.company,
      'name': instance.name,
      'postCount': instance.postCount,
      'commentCount': instance.commentCount,
      'likeCount': instance.likeCount,
    };
