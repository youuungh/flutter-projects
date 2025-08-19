// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reward_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RewardEntity _$RewardEntityFromJson(Map<String, dynamic> json) =>
    _RewardEntity(
      id: (json['id'] as num?)?.toInt(),
      projectId: (json['project_id'] as num?)?.toInt(),
      imageUrl: json['image_url'] as String?,
      title: json['title'] as String?,
      price: (json['price'] as num?)?.toInt(),
      description: json['description'] as String?,
      imageRaw:
          (json['image_raw'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
    );

Map<String, dynamic> _$RewardEntityToJson(_RewardEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'project_id': instance.projectId,
      'image_url': instance.imageUrl,
      'title': instance.title,
      'price': instance.price,
      'description': instance.description,
      'image_raw': instance.imageRaw,
    };
